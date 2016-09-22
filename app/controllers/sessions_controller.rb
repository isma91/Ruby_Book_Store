class SessionsController < ApplicationController
  before_action :requireLogin

  def requireLogin
    if session[:userId] == nil
      flash[:fail] = "You must be logged !!"
      redirect_to "/login"
    end
  end

  def logout
    time = Time.new
    currentTime = time.strftime("%d-%m-%Y %H:%M:%S")
    Log.new(date: currentTime, user_id: session[:userId], action: "logout").save
    reset_session
    flash[:success] = "You logout successfully !!"
    redirect_to "/login"
  end

  def index
    user = User.find(session[:userId])
    @userLastname = user.lastname
    @userFirstname = user.firstname
    @users = User.all
  end
end
