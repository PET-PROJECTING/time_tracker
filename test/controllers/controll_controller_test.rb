require "test_helper"

class ControllControllerTest < ActionDispatch::IntegrationTest
  test "should get inside" do
    get controll_inside_url
    assert_response :success
  end

  test "should get outside" do
    get controll_outside_url
    assert_response :success
  end

  test "should get classification" do
    get controll_classification_url
    assert_response :success
  end
end
