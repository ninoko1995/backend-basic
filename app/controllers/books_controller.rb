class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:create,:edit,:update,:destory]
  before_action :set_current_user,only:[:index,:edit]
  before_action :correct_user?,only:[:edit,:update,:destroy]

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_url
  end

  def update
    if @book.update(book_params)
      redirect_to books_url
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :comment, :prace)
    end

    def set_current_user
      @user=current_user
    end

    def correct_user?
      unless User.find(params[:id]) == current_user
        redirect_to root_url
      end
    end
end
