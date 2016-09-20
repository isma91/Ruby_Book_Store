class SessionsController < ApplicationController

  def logout
    time = Time.new
    currentTime = time.strftime("%d-%m-%Y %H:%M:%S")
    Log.new(date: currentTime, userId: session[:userId], action: "logout", bookCustomerId: nil).save
    reset_session
    flash[:success] = "You logout successfully !!"
    redirect_to "/login"
  end
end
