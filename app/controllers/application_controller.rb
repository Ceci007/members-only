class ApplicationController < ActionController::Base
  include Devise::Controllers::Rememberable
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_remember_me(resource)
    remember_me resource
  end

  def require_user
    return if user_signed_in?

    flash[:alert] = 'You must be signed in to perform that action.'
    redirect_to new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username])
  end  
end
