require 'test_helper'

class AddressControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get address_edit_url
    assert_response :success
  end

end
