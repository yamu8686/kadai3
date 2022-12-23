class UsersController < ApplicationController
  def edit
     @user = User.find(params[:id])
  end

  def index
    @users = User.all
     @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.all
    @book = Book.new
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_path(user.id)
  end

   private

  def user_params
    params.require(:user).permit(:name, :introduction, :title, :body, :image, :profile_image)
  end

end
