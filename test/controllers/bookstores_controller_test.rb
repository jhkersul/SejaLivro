require 'test_helper'

class BookstoresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookstores_new_url
    assert_response :success
  end

end
