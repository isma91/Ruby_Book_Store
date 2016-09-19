class UsersController < ApplicationController
before_action :checkUserConnected

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
      if user["pass"].to_s.length < 5
        flash[:fail] = "Your password must have at least 5 characters !!"
        redirect_to '/signup'
      else
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
    userToCheck = User.find_by_email(user["email"])
    if userToCheck == nil
      flash[:fail] = "Bad email or password !!"
      redirect_to "/login"
    else
      passToCheck = BCrypt::Password.new userToCheck["pass"]
      if passToCheck == user["pass"]
        session[:userId] = userToCheck["id"]
        redirect_to "/books"
      else
        flash[:fail] = "Bad email or password !!"
        redirect_to "/login"
      end
    end
  end

  def checkUserConnected
    if session[:userId] != nil
      flash[:fail] = "You can't signup or login when you're already logged !!"
      redirect_to "/books"
    end
  end

  def logout
    session[:userId] = nil
    flash[:success] = "You logout successfully !!"
    redirect_to "/login"
  end

end
