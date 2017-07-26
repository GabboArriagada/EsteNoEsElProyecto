class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
  redirect_to questions_url, :alert => exception.message
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  def after_sign_in_path_for(resource_or_scope)
    questions_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:email, :password, :rut, :name, :last_name, :telefono)}
    devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:email, :password)}
    devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:name, :rut, :email, :password, :telefono, :fecha_nacimiento, :direccion)}
  end
end
