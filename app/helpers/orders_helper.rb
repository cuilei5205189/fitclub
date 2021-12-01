module OrdersHelper
  def render_order_paid_state(order)
    if order.is_paid?
      "已付款"
    else
      "未付款"
    end
  end

  def render_order_tate(order)
    if order.aasm_state == "order_placed"
      "已下单"
    elsif order.aasm_state == "paid"
      "已付款"
    elsif order.aasm_state == "activated"
      "已激活"
    elsif order.aasm_state == "good_returned"
      "已退货"
    elsif order.aasm_state == "order_cancelled"
      "订单已取消"
    end
  end
end
