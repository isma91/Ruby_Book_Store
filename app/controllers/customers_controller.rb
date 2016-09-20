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

  def create
    @customer = Customer.new(customerParam)
    if @customer.save
      time = Time.new
      currentTime = time.strftime("%d-%m-%Y %H:%M:%S")
      Log.new(date: currentTime, userId: session[:userId], action: "add customer", bookCustomerId: @customer.id).save
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