require 'test_helper'

class PickadatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pickadates_new_url
    assert_response :success
  end

  test "should get create" do
    get pickadates_create_url
    assert_response :success
  end

end
