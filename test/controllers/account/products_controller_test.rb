require "test_helper"

class Account::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_products_index_url
    assert_response :success
  end
end
