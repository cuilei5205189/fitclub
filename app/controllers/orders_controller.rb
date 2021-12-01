class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create,:show]
  layout "account"

  def create
      @order = Order.new(order_params)
      @order.user = current_user
      @order.total = current_cart.total_price

      if @order.save
        current_cart.cart_items.each do |cart_item|
          product_list = ProductList.new
          product_list.product = cart_item.product #记录product
          product_list.order = @order
          product_list.product_name = cart_item.product.title
          if cart_item.product.discount.present?
            product_list.product_price = cart_item.product.price * cart_item.product.discount / 100
          else
            product_list.product_price = cart_item.product.price
          end
          product_list.quantity = cart_item.quantity
          product_list.save
          # 下单后商品的库存数量对应减少
          product = cart_item.product
          product.quantity = product.quantity - cart_item.quantity
          product.save
        end
        current_cart.clean!
        OrderMailer.notify_order_placed(@order).deliver!
        flash[:notice] = "成功创建订单"
        redirect_to order_path(@order.token)
      else
        flash[:alert] = "创建订单失败"
        flash[:warning] = @order.errors.full_messages.join(", ")
        redirect_to checkout_carts_path
      end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists
  end

  def pay_with_alipay
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("alipay")
    @order.make_payment!

    redirect_to order_path(@order.token), notice: "使用支付宝成功完成付款"
  end

  def pay_with_wechat
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("wechat")
    @order.make_payment!

    redirect_to order_path(@order.token), notice: "使用微信成功完成付款"
  end


  def apply_to_cancel
    @order = Order.find(params[:id])
    OrderMailer.apply_cancel(@order).deliver!
    flash[:notice] = "已提交申请"
    redirect_to order_path(@order.token)
  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :phone_number)
  end

end
