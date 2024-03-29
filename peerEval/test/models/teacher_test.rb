require "test_helper"

class TeacherTest < ActiveSupport::TestCase
  def setup
    @teacher = Teacher.new(name: "Sample Teacher", email: "teacher@example.com", password: "foobar123")
  end
  test "should be valid" do
    assert @teacher.valid?
  end
  test "name should be present" do
    @teacher.name = " "
    assert_not @teacher.valid?
  end
  test "email should be present" do
    @teacher.email = " "
    assert_not @teacher.valid?
  end
  test "name should not be too long" do
    @teacher.name = "a" * 51
    assert_not @teacher.valid?
  end
  test "email should not be too long" do
    @teacher.email = "a" * 244 + "@example.com"
    assert_not @teacher.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[teacher@example.com TEACHER@foo.COM A_US-ER@foo.bar.org
    first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @teacher.email = valid_address
      assert @teacher.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_teacher = @teacher.dup
    @teacher.save
    assert_not duplicate_teacher.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @teacher.email = mixed_case_email
    @teacher.save
    assert_equal mixed_case_email.downcase, @teacher.reload.email
  end
  test "password should be present (nonblank)" do
    @teacher.password = " " * 8
    assert_not @teacher.valid?
  end
    test "password should have a minimum length" do
    @teacher.password = "a" * 7
    assert_not @teacher.valid?
  end
end
