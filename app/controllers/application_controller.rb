class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path if request.referrer.nil? || !([root_path, new_user_registration_path, user_session_path, new_user_password_path].include? request.referrer.sub(request.base_url, '').delete('?'))
    end
  end
end
