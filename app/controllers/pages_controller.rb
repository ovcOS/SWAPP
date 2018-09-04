class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to users_path if current_user
  end

  def profile
    @user = current_user
    @medium = Medium.new
    @skill = Skill.new
    @tag = Tag.new
    @skill_names = Skill.all.map{ |skill| skill.name.titleize }
    @tag_names = Tag.all.map{ |tag| tag.name.titleize }
  end
end
