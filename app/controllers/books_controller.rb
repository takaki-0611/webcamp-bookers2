class BooksController < ApplicationController
  before_action :ensure_correct_user,{only: [:edit, :update]}

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have created book successfully."
    else
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    @book.user = current_user
  end

  def update
    @book = Book.find(params[:id])
    @book.user = current_user
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'edit'
    end
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    if current_user != @book.user
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :image, :body)
  end

end
