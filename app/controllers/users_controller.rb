class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  end

  def index
  	@users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
  	@books = Book.all
  	@book = Book.new
  	@user = current_user
  end

  def update
  	@user = current_user
  	@user.update(user_params)
  	@user.save
  	redirect_to books_path
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email)
  	end

end
