class SessionsController < ApplicationController

  def logout
    time = Time.new
    currentTime = time.strftime("%d-%m-%Y %H:%M:%S")
    Log.new(date: currentTime, user_id: session[:userId], action: "logout").save
    reset_session
    flash[:success] = "You logout successfully !!"
    redirect_to "/login"
  end
end
