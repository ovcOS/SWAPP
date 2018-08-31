class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit]

  def index
    @user = current_user
    if params[:query].present?
      @users = User.search_by_fuzzy_skill(params[:query])
    else
      @users = User.best_matches(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user = current_user

    @user.description = params[:user][:description] if user_params[:description]
    if user_params[:skills]
      skill = Skill.find_by_name(user_params[:skills].strip.downcase.gsub(' ', '-'))
      @user.skills << skill if skill
    end

    if user_params[:tags]
      tag = Tag.find_by_name(user_params[:tags].strip.downcase.gsub(' ', '_'))
      @user.tags << tag if tag
    end

    if user_params[:profile_photo]
      @user.profile_photo = params[:user][:profile_photo] if user_params[:profile_photo]
    end

    if params[:skills].present?
      params[:skills].split(',').each do |skill_name|
         skill = Skill.find_by_name(skill_name.strip.downcase.gsub(' ', '-'))
         @user.skills << skill if skill
      end
    end

    if params[:tags].present?
      params[:tags].split(',').each do |tag_name|
        tag = Tag.find_by_name(tag_name.strip.downcase.gsub(' ', '_'))
        @user.tags << tag if tag
      end
    end
    @user.location = "Barcelona, Spain"
    @user.save!
    redirect_to profile_path
  end

  def getting_started
    @user = current_user
    @skill_names = Skill.all.map{ |skill| skill.name.titleize }
    @tag_names = Tag.all.map{ |tag| tag.name.titleize }
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile_photo, :description, :skills, :tags)
  end
end
