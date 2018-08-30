class MediaController < ApplicationController
  def new
  end

  def create
    medium = Medium.new(media_params)
    medium.file_type = 'photo'
    medium.user_id = current_user.id
    medium.save!
    redirect_to profile_path
  end

  def destroy
  end

  private
  def media_params
    params.require(:medium).permit(:path)
  end
end
