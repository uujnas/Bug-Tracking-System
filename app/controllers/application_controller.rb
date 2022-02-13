class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name,:role, :surname, :phone_no,:profile_pic, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_name,:role, :surname, :phone_no,:profile_pic, :email, :password, :current_password)}
  end

  def after_sign_in_path_for(_resource)
    role_dashboards_path
  end
end
