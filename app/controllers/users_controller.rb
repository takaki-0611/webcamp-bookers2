class UsersController < ApplicationController
  before_action :ensure_correct_user,{only: [:edit, :update]}

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def ensure_correct_user
    if current_user.id !=  params[:id].to_i
      redirect_to user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
