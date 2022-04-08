require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    @student = Student.new(name: 'Example Student', email: 'student@example.com', password: "foobar12", password_confirmation: "foobar12")
  end

  test 'should be valid' do
    assert @student.valid?
  end

  test 'name should be present' do
    @student.name = ' '
    assert_not @student.valid?
  end

  test 'email should be present' do
    @student.email = ' '
    assert_not @student.valid?
  end

  test 'name should not be too long' do
    @student.name = 'a' * 51
    assert_not @student.valid?
  end

  test 'email should not be too long' do
    @student.email = 'a' * 244 + '@example.com'
    assert_not @student.valid?
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[student@example,com student_at_foo.org student.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @student.email = invalid_address
      assert_not @student.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email addresses should be unique' do
    duplicate_student = @student.dup
    @student.save
    assert_not duplicate_student.valid?
  end

  test "password should be present (nonblank)" do
    @student.password = @student.password_confirmation = " " * 8
    assert_not @student.valid?
  end

  test "password should have a minimum length" do
    @student.password = @student.password_confirmation = "a" * 7
    assert_not @student.valid?
  end
end
