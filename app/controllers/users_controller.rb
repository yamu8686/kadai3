class UsersController < ApplicationController
  def edit
     @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.all
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
  end
  
   private

  def user_params
    params.require(:user).permit(:title, :body, :image, :profile_image)
  end

end
