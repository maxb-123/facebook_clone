class ApplicationController < ActionController::Base
  # Protects against Cross-Site Request Forgery attacks
  protect_from_forgery with: :exception

  # Require authentication for all actions by default
  before_action :authenticate_user!

  # Permit additional parameters for Devise (e.g. username)
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Allows extra params for Devise registration and account update
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end