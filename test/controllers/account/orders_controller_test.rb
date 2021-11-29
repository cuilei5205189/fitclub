require "test_helper"

class Account::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_orders_index_url
    assert_response :success
  end
end
