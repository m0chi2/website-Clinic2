require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get homes_top_url
    assert_response :success
  end

  test "should get about" do
    get homes_about_url
    assert_response :success
  end

  test "should get exams" do
    get homes_exams_url
    assert_response :success
  end

  test "should get access" do
    get homes_access_url
    assert_response :success
  end
end
