class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def admin_required
    if !current_user.is_admin
      redirect_to "/", alert: "你不是管理员"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name ,:address, :avatar])
  end
end
