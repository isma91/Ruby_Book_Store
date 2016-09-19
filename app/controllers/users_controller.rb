class UsersController < ApplicationController

  def create
    errorEmpty = false
    user = Hash.new
    user["lastname"] = params[:lastname]
    user["firstname"] = params[:firstname]
    user["pass"] = params[:pass]
    user["email"] = params[:email]
    user.each do |name, value|
      if value.to_s == ""
        errorEmpty = true
        break
      end
    end
    if errorEmpty == true
      flash[:fail] = "Some fields of the form has not been filled !!"
      redirect_to "/signup"
    end
    if errorEmpty == false
      duplicateEmail = User.find_by_email(user["email"])
      if duplicateEmail != nil
        flash[:fail] = "Email already taken !!"
        redirect_to "/signup"
      end
      if duplicateEmail == nil
        cryptedPass = BCrypt::Password.create(user["pass"]);
        userClass = User.new(lastname: user["lastname"], firstname: user["firstname"], pass: cryptedPass, email: user["email"])
        if userClass.save
          flash[:success] = "You successfully registered !! You can now login !!"
          redirect_to "/login"
        else
          flash[:fail] = "Error while we try to register your account !! Try again !!"
          redirect_to "/signup"
        end
      end
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
    end
    userClass = User.new
    userToCheck = userClass.findByEmail(user["email"])
    if userToCheck == false
      flash[:fail] = "Bad email or password !!"
      redirect_to "/login"
    else
      passToCheck = BCrypt::Password.new userToCheck["pass"]
      if passToCheck == user["pass"]
        session[:userId] = user["id"]
      else
        flash[:fail] = "Bad email or password !!"
      end
      redirect_to "/login"
    end
  end

  def checkUserConnected
    if session[:userId] == nil
      flash[:fail] = "You must be logged !!"
      redirect_to "/login"
    end
  end

  def logout
    session[:userId] = nil
    flash[:success] = "You logout successfully !!"
    redirect_to "/login"
  end

end
