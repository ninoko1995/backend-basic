class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:create,:edit,:update,:destory]

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
    if @book.save
      redirect_to :index
    else
      redirect_to :index 
    end
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
end
