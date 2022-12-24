class UsersController < ApplicationController
  def edit
     @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @user = User.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = 'You have created user successfully.'
    redirect_to user_path(user.id)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path(current_user.id)
  end

   private

  def user_params
    params.require(:user).permit(:name, :introduction, :title, :body, :image, :profile_image)
  end

end
