require "test_helper"

class TestsControllerTest < ActionDispatch::IntegrationTest
  test "should get app" do
    get tests_app_url
    assert_response :success
  end
end
