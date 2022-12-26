class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book)
    else
      flash[:alert]
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
 #   @book = Book.find(params[:id])
 #    if @book.user == current_user
 #       render "edit"
 #    else
 #       redirect_to books_path
 #     end
  end

  def back
    book = Book.find(params[:id])
    book.back
    redirect_to books_path(current_user)
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book.id),notice: 'You have updated book successfully.'
    else
      flash[:alert]
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image, :profile_image)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user= @book.user
    redirect_to (books_path) unless @user == current_user
  end
end
