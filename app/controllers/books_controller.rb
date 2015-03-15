class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  def wypisz_book_user
    @book = Book.find_all_by_user_id(session[:user_id])
  end

  # POST /books
  # POST /books.json
  def create
        @book = Book.new(params[:book])
        @book.user_id= session[:user_id]
        @book.picture_file_name= 'default_book.jpg'
        respond_to do |format|
          if @book.save
            format.html { redirect_to @book, notice: 'Book was successfully created.' }
            format.json { render json: @book, status: :created, location: @book }
          else
            format.html { render action: "new" }
            format.json { render json: @book.errors, status: :unprocessable_entity }
          end
        end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to user_path(session[:user_id]) }
      format.json { head :no_content }
    end
  end

  def search
      if params[:gatunek]
        @books = Book.find_all_by_genre(params[:gatunek])
      else
        @books = Book.where("title like '%#{params[:title]}%'")
      end
  end

  def dodaj_opinie
    @micropost = Micropost.new
    @micropost.content= params[:content]
    @micropost.user_id= session[:user_id]
    @micropost.book_id= session[:temp]
    if @micropost.save
      redirect_to book_path(session[:temp])
    end
  end
end
