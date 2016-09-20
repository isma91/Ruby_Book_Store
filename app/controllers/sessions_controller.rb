class SessionsController < ApplicationController

  def logout
    reset_session
    flash[:success] = "You logout successfully !!"
    redirect_to "/login"
  end
end
