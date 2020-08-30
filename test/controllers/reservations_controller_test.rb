require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservations_index_url
    assert_response :success
  end

  test "should get new" do
    get reservations_new_url
    assert_response :success
  end

  test "should get confirm" do
    get reservations_confirm_url
    assert_response :success
  end

  test "should get create" do
    get reservations_create_url
    assert_response :success
  end

  test "should get thanks" do
    get reservations_thanks_url
    assert_response :success
  end
end
