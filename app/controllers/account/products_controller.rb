class Account::ProductsController < Account::BaseController
  def index
    @products = current_user.collections
  end
end
