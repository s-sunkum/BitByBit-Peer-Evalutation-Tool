require 'test_helper'

class TeachersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @teacher = teachers(:teacher)
  end

  test 'login with invalid information' do
    get teacherlogin_path
    assert_template 'teacher_sessions/new'
    post teacherlogin_path, params: { session: { email: '', password: '' } }
    assert_template 'teacher_sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'login with valid information' do
    get teacherlogin_path
    post teacherlogin_path, params: { session: { email: @teacher.email,
                                                 password: 'password' } }
    assert_redirected_to @teacher
    follow_redirect!
    assert_template 'teachers/show'
    assert_select 'a[href=?]', teacherlogin_path, count: 0
    assert_select 'a[href=?]', teacherlogout_path
    assert_select 'a[href=?]', teacher_path(@teacher)

  end
end
