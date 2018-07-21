require 'test_helper'

class UserCryptosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_cryptos_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_cryptos_destroy_url
    assert_response :success
  end

end
