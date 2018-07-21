require 'test_helper'

class CryptosControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get cryptos_search_url
    assert_response :success
  end

end
