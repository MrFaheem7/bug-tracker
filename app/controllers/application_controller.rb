class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
   
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path 
  end
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path  # Devise's sign-in page
  end
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:user_type])
  end
end
