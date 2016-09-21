class CustomersController < ApplicationController
  before_action :requireLogin

  def requireLogin
    if session[:userId] == nil
      flash[:fail] = "You must be logged !!"
      redirect_to "/login"
    end
  end

  def new
    @customer = Customer.new
  end

  def index
    user = User.find(session[:userId])
    @userLastname = user.lastname
    @userFirstname = user.firstname
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    Customer.find(params[:id]).update(lastname: params[:lastname], firstname: params[:firstname], adresse: params[:adresse], city: params[:city], email: params[:email])
    flash[:success] = "Customer #{params[:lastname]}  #{params[:firstname]} updated successfully !!"
    redirect_to "/customers"
  end

  def create
    @customer = Customer.new(customerParam)
    if @customer.save
      time = Time.new
      currentTime = time.strftime("%d-%m-%Y %H:%M:%S")
      Log.new(date: currentTime, user_id: session[:userId], action: "add customer", customer_id: @customer.id).save
      flash[:success] = "Customer added successfully !!"
      redirect_to "/customers"
    else
      render "new"
    end
  end

  private

  def customerParam
    params.require(:customer).permit(:lastname, :firstname, :adresse, :city, :email)
  end
end
