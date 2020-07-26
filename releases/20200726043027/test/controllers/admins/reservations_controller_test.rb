require 'test_helper'

class Admins::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get admins_reservations_all_url
    assert_response :success
  end

end
