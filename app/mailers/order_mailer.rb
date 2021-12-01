class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order       = order
    @user        = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email , subject: "[FitClub] 感谢您的下单，以下是您的购买明细")
  end

  def apply_cancel(order)
    @order       = order
    @user        = order.user
    @product_lists = @order.product_lists

    mail(to: "lei@codepower.rocks" , subject: "[FitClub] 用户#{order.user.email}申请取消订单")
  end

  def notify_activate(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[FitClub] 您的订单 #{order.token}已激活")
  end

  def notify_cancel(order)
    @order        = order
    @user         = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[FitClub] 您的订单 #{order.token}已取消")
  end
end
