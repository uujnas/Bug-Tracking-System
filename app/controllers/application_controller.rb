class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name, :surname, :phone_no, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :phone_no, :email, :password, :current_password)}
  end
end
