require 'test_helper'

class TeachersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get teachersignup_path
    assert_no_difference 'Teacher.count' do
      post teachers_path, params: { teacher: { name: '',
                                         email: 'teacher@invalid',
                                         password: 'foo',
                                         password_confirmation: 'bar' } }
    end
    assert_template 'teachers/new'
  end

  test "valid signup information" do
    get teachersignup_path
    assert_difference 'Teacher.count', 1 do
      post teachers_path, params: { teacher: { name: "Example Teacher",
                                         email: "teacher@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'teachers/show'
    assert teacher_is_logged_in?
  end
end
