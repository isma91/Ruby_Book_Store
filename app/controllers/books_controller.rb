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

  def edit
    @kindHash = Hash.new
    @kindHash["action"] = "Action"
    @kindHash["adventure"] = "Adventure"
    @kindHash["detective"] = "Detective"
    @kindHash["drama"] = "Drama"
    @kindHash["erotic"] = "Erotic"
    @kindHash["fantasy"] = "Fantasy"
    @kindHash["horror"] = "Horror"
    @kindHash["humour"] = "Humour"
    @kindHash["josei"] = "Josei (For Young Women and Adult)"
    @kindHash["kodomo"] = "Kodomo (For Young Child)"
    @kindHash["legend"] = "Legend"
    @kindHash["mystery"] = "Mystery"
    @kindHash["mythology"] = "Mythology"
    @kindHash["redisu"] = "Redisu (For Adult Woman)"
    @kindHash["romance"] = "Romance"
    @kindHash["science fiction"] = "Science fiction"
    @kindHash["seinen"] = "Seinen (For Young Man and Adult)"
    @kindHash["seijin"] = "Seijin (For Adult Man)"
    @kindHash["shojo"] = "Shojo (For Teenage Girl)"
    @kindHash["shonen"] = "Shonen (For Teen Boy)"
    @kindHash["suspence"] = "Suspence"
    @kindHash["thriller"] = "Thriller"
    @kindHash["western"] = "Western"
    @book = Book.find(params[:id])
  end

  def update
    errorEmpty = false
    book = Hash.new
    book["name"] = params[:name]
    book["author"] = params[:author]
    book["editor"] = params[:editor]
    book["kind"] = params[:kind]
    book["year"] = params[:date]
    book["resume"] = params[:resume]
    if params[:editCoverSwitch] == "on"
      book["cover"] = params[:cover]
    end
    book.each do |name, value|
      if value.to_s == "" || value == nil
        errorEmpty = true
        break
      end
    end
    if errorEmpty == true
      flash[:fail] = "Some filed are empty !!"
      redirect_to "/book/#{params[:id]}"
    else
      book["kind"] = params[:kind].join('|')
      if params[:editCoverSwitch] == "on"
        uploaded_io = params[:cover]
        fileName = rand(1...99999).to_s + uploaded_io.original_filename
        File.open(Rails.root.join('public', 'images', fileName), 'wb') do |file|
          file.write(uploaded_io.read)
        end
        Book.find(params[:id]).update(name: book["name"], author: book["author"], editor: book["editor"], kind: book["kind"], cover: fileName, year: book["year"], resume: book["resume"])
      else
        Book.find(params[:id]).update(name: book["name"], author: book["author"], editor: book["editor"], kind: book["kind"], year: book["year"], resume: book["resume"])
      end
      time = Time.new
      currentTime = time.strftime("%d-%m-%Y %H:%M:%S")
      Log.new(date: currentTime, user_id: session[:userId], action: "edit book", book_id: params[:id]).save
      flash[:success] = "Book #{params[:name]} edited successfully !!"
      redirect_to "/books"
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
    book["kind"] = params[:kind]
    book["cover"] = params[:cover]
    book["year"] = params[:date]
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
      bookClass.year = book["year"]
      bookClass.kind = book["kind"].join("|")
      bookClass.cover = fileName
      bookClass.resume = book["resume"]
      bookClass.save
      time = Time.new
      currentTime = time.strftime("%d-%m-%Y %H:%M:%S")
      Log.new(date: currentTime, user_id: session[:userId], action: "add book", book_id: bookClass.id).save
      flash[:success] = "Book added successfully !!"
      redirect_to "/books"
    end
  end
end