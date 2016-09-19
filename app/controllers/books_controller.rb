class BooksController < ApplicationController
before_action :checkUserConnected

  def checkUserConnected
    if session[:userId] == nil
      flash[:fail] = "You must be logged !!"
      redirect_to "/login"
    end
  end

  def index
    user = User.find(session[:userId])
    @userLastname = user.lastname
    @userFirstname = user.firstname
    @books = Book.all
  end
end