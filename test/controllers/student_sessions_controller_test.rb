require "test_helper"

class StudentSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get studentlogin_path
    assert_response :success
  end
  
end
