require "test_helper"

class TeachersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get teacherlogin_path
    assert_template 'teacher_sessions/new'
    post teacherlogin_path, params: { session: { email: "", password: "" } }
    assert_template 'teacher_sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
