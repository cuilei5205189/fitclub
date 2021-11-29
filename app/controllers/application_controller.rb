class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def admin_required
    if !current_user.is_admin
      redirect_to "/", alert: "你不是管理员"
    end
  end

  helper_method :current_cart

  def current_cart
    # 如果用户登陆了，找到用户的专属购物车

    if current_user
      @current_cart ||= find_user_cart
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
    cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = cart.id
    cart
  end

  def find_user_cart
    cart = current_user.cart
    if cart.blank?
      cart = Cart.create
      current_user.cart = cart
    end
    session_cart = find_session_cart
    # 把临时购物车中的商品倒进用户的专属购物车

    unless session_cart.blank?
      cart.merge!(session_cart)
      session_cart.clean!
    end
    cart
  end
end
