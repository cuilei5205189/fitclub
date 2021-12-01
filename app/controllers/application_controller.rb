class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_cart
  
  def admin_required
    if !current_user.is_admin
      redirect_to "/", alert: "你不是管理员"
    end
  end

  def current_cart
    if current_user
      if current_user.cart
        session[:cart_id] = current_user.cart.id
        @current_cart = current_user.cart
      else
        cart = find_session_cart
        cart.update user_id: current_user.id
        cart
      end
    else
      @current_cart ||= find_session_cart
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name ,:address, :avatar])
  end

  private

  def find_session_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    cart
  end
end
