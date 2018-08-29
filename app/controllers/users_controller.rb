class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user.update(user_params)

    if params[:skills].present?
      params[:skills].each do |skill_name|
        @user.skills << Skill.find_by_name(skill_name)
      end
    end

    if params[:tags].present?
      params[:tags].each do |tag_name|
        @user.tags << Tag.find_by_name(tag_name)
      end
    end
  end

  def getting_started
    @user = current_user
    @skill_names = Skill.all.map{ |skill| skill.name.gsub('_', ' ').titlecase }.join(',')
    @tag_names = Tag.all.map{ |tag| tag.name.gsub('_', ' ').titlecase }.join(',')
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params_require(:user).permit(:name, :email, :profile_photo)
  end
end
