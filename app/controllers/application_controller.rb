class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
