class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(current_user.id)
  end

  def index
    @book = Book.new
    @books = Book.all

  end

  def show
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def back
    book = Book.find(params[:id])
    book.back
    redirect_to books_path(current_user)
  end
   
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(current_user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :name, :introduction, :image,  :profile_image)
  end

end
