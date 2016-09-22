class OrdersController < ApplicationController
  before_action :requireLogin

  def requireLogin
    if session[:userId] == nil
      flash[:fail] = "You must be logged !!"
      redirect_to "/login"
    end
  end

  def new
    @order = Order.new
    @books = Book.all
    @customers = Customer.all
  end

  def edit
    @order = Order.find(params[:id])
    @books = Book.all
    @customers = Customer.all
  end

  def update
    Order.find(params[:id]).update(kind: params[:kind], customer_id: params[:customer], book_id: params[:book])
    time = Time.new
    currentTime = time.strftime("%d-%m-%Y %H:%M:%S")
    Log.new(date: currentTime, user_id: session[:userId], action: "edit order", order_id: params[:id]).save
    flash[:success] = "Order updated successfully !!"
    redirect_to "/orders"
  end

  def create
    @books = Book.all
    @customers = Customer.all
    @order = Order.new
    @order.kind = params[:kind]
    @order.book_id = params[:book]
    @order.customer_id = params[:customer]
    if @order.save
      time = Time.new
      currentTime = time.strftime("%d-%m-%Y %H:%M:%S")
      Log.new(date: currentTime, user_id: session[:userId], action: "add order", order_id: @order.id).save
      flash[:success] = "Order added successfully !!"
      redirect_to "/orders"
    else
      render "new"
    end
  end

  def index
    user = User.find(session[:userId])
    @userLastname = user.lastname
    @userFirstname = user.firstname
    order = Order.new
    @orders = order.allOrder
  end
end
