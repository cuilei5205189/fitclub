class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  def activate
    @order = Order.find(params[:id])
    @order.activate!
    OrderMailer.notify_activate(@order).deliver!
    flash[:notice] = "Activate request has been sent to the customer."
    redirect_to admin_orders_path
  end

  # def shipped
  #   @order = Order.find(params[:id])
  #   @order.deliver!
  #   redirect_to :back
  # end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel_order!
    OrderMailer.notify_cancel(@order).deliver!
    flash[:notice] = "Cancel request has been sent to the customer."
    redirect_to admin_orders_path
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    flash[:notice] = "Return request has been sent to the customer."
    redirect_to admin_orders_path
  end
end
