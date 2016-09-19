class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    Rails.logger.debug params.inspect
    errorEmpty = false
    user = Hash.new
    user["lastname"] = params[:lastname]
    user["firstname"] = params[:firstname]
    user["username"] = params[:username]
    user["pass"] = params[:pass]
    user["email"] = params[:email]
    user.each do |name, value|
      if value.to_s == ""
        errorEmpty = true
        break
      end
    end
    if errorEmpty == true
      flash[:failed] = "Some fields of the form has not been filled !!"
    end
    redirect_to "/signup"
    #@user = User.new(params[:user])
    #if @user.save
    #  flash[:notice] = "You Sign up successfully !!"
    #  flash[:color] = "valid"
    #else
    #  flash[:notice] = "Form is invalid !!"
    #  flash[:color] = "invalid"
    #end
    #render new
    #render params[:]
  end
end
