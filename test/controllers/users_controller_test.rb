require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_portfolio" do
    get users_my_portfolio_url
    assert_response :success
  end

  test "should get search" do
    get users_search_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

end
