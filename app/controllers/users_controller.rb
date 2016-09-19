class UsersController < ApplicationController
  #def new
  #  @user = User.new
  #end

  def create
    errorEmpty = false
    duplicateEmail = false
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
    users = User.all
    users.each do |userToCheck|
      if userToCheck.email == user["email"]
        duplicateEmail = true
        break
      end
    end
    if duplicateEmail == true
      flash[:fail] = "Email already taken !!"
      redirect_to "/signup"
    end
    if duplicateEmail == false
      salt = BCrypt::Engine.generate_salt
      cryptedPass = BCrypt::Engine.hash_secret(user["pass"], salt)
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
