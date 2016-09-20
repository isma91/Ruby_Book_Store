class BooksController < ApplicationController
before_action :requireLogin

  def new
    @book = Book.new
  end

  def requireLogin
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

  def create
    errorEmpty = false
    book = Hash.new
    book["name"] = params[:name]
    book["author"] = params[:author]
    book["editor"] = params[:editor]
    book["type"] = params[:type]
    book["kind"] = params[:kind]
    book["cover"] = params[:cover]
    book["date"] = params[:date]
    book["resume"] = params[:resume]
    book.each do |name, value|
      if value.to_s == "" || value == nil
        errorEmpty = true
        break
      end
    end
    if errorEmpty == true
      flash[:fail] = "Some filed are empty !!"
      redirect_to "/book/new"
    else
      uploaded_io = params[:cover]
      fileName = rand(1...99999).to_s + uploaded_io.original_filename
      File.open(Rails.root.join('public', 'images', fileName), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      bookClass = Book.new
      bookClass.name = book["name"]
      bookClass.author = book["author"]
      bookClass.editor = book["editor"]
      bookClass.year = book["date"]
      bookClass.kind = book["kind"].join("|")
      bookClass.cover = fileName
      bookClass.resume = book["resume"]
      bookClass.save
      time = Time.new
      currentTime = time.strftime("%d-%m-%Y %H:%M:%S")
      Log.new(date: currentTime, userId: session[:userId], action: "add book", bookCustomerId: bookClass.id).save
      flash[:success] = "Book added successfully !!"
      redirect_to "/books"
    end
  end
end