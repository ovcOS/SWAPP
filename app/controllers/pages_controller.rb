class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to users_path if current_user
  end

  def profile
    @user = current_user
  end
end
