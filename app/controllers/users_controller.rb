class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    redirect_to profile_path(current_user)
    #params[:user][:description]
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_photo, :description)
  end
end
