class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def edit
   # @user = User.find(params[:id])
   # if @user
     # render "edit"
   # else
  #    redirect_to edit_users_path(current_user.id)
   # end
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
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice: 'You have created user successfully.'
    else
     flash[:alert]
     @user = User.all
     render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = 'Signed out successfully.'
    redirect_to users_path(current_user.id)
  end

  def create
    @user = User.new(user_params)
    @user.save
    flash[:notice] = 'Welcome!You have signd up successfully.'
    redirect_to user_signed_in_path
  end


   private

  def user_params
    params.require(:user).permit(:name, :introduction, :title, :body, :image, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to(root_path)
    end
  end
end
