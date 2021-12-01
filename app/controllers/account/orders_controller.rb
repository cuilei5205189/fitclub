class Account::OrdersController < Account::BaseController
  def index
    @orders = current_user.orders.order("id DESC")
  end
end
