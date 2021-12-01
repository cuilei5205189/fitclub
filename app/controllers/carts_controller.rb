class CartsController < ApplicationController
  before_action :authenticate_user! , only: [:checkout]
  def index
  end

  def checkout
    if current_cart.cart_items.present?
      @order = Order.new
    else
      flash[:warning] = "购物车是空的！"
      redirect_to carts_path
    end
  end


  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to carts_path
  end

end
