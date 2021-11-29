require "test_helper"

class Account::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get account_users_edit_url
    assert_response :success
  end
end
