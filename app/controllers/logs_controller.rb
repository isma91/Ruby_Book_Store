class LogsController < ApplicationController
  before_action :requireLogin

  def requireLogin
    if session[:userId] == nil
      flash[:fail] = "You must be logged !!"
      redirect_to "/login"
    end
  end

  def index
    user = User.find(session[:userId])
    log = Log.new
    @logins = log.logLogin
    @logouts = log.logLogout
    @books = log.logBook
    @booksEdit = log.logBookEdit
    @customers = log.logCustomer
    @customersEdit = log.logCustomerEdit
    @orders = log.logOrder
    @ordersEdit = log.logOrderEdit
    @userLastname = user.lastname
    @userFirstname = user.firstname
  end
end
