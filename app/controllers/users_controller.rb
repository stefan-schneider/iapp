class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def index
  end
  
  def change
  end
  
  def delete
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the brand new iApp!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end