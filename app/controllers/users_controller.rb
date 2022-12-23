class UsersController < ApplicationController
  def edit
     @user = User.find(params[:id])
  end

  def index
    @users = User.all
     @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

   private

  def user_params
    params.require(:user).permit(:name, :introduction, :title, :body, :image, :profile_image)
  end

end
