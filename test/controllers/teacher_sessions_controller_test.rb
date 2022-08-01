require "test_helper"

class TeacherSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teacherlogin_path
    assert_response :success
  end

end
