class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :mustNotBeConnected

  def new
    @user = User.new
  end

  def create
    @user = User.new(userParam)
    if @user.save
      flash[:success] = "You successfully registered !! You can now login !!"
      redirect_to "/login"
    else
      render "new"
    end
  end

  def connexion
    errorEmpty = false
    user = Hash.new
    user["email"] = params[:email]
    user["pass"] = params[:pass]
    user.each do |name, value|
      if value.to_s == ""
        errorEmpty = true
        break
      end
    end
    if errorEmpty == true
      flash[:fail] = "Email or password are empty  !!"
      redirect_to "/login"
    else
      userToCheck = User.find_by_email(user["email"])
      if userToCheck == nil
        flash[:fail] = "Bad email or password !!"
        redirect_to "/login"
      else
        passToCheck = BCrypt::Password.new userToCheck["pass"]
        if passToCheck == user["pass"]
          time = Time.new
          currentTime = time.strftime("%d-%m-%Y %H:%M:%S")
          session[:userId] = userToCheck["id"]
          Log.new(date: currentTime, userId: userToCheck["id"], action: "login", bookCustomerId: nil).save
          redirect_to "/books"
        else
          flash[:fail] = "Bad email or password !!"
          redirect_to "/login"
        end
      end
    end
  end

  def mustNotBeConnected
    if session[:userId] != nil
      flash[:fail] = "You can't signup or login when you're already logged !!"
      redirect_to "/books"
    end
  end

  private

  def userParam
    params.require(:user).permit(:lastname, :firstname, :email, :pass)
  end

end