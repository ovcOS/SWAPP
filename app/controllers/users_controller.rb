class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def update
  end

  private

  def user_params
    params_require(:user).permit(:name, :email, :profile_photo)
  end
end
