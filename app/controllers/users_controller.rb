class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page]).reverse_order

  end
  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to  user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "You have updated user successfully."
    else
      flash.now[:alert] = "error"
      render 'edit'
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
