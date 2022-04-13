require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  def setup
    @project = Project.new(name: "Example Project")
  end

  test "should be valid" do
    assert @project.valid?
  end

  test "name should be present" do
    @project.name = " "
    assert_not @project.valid?
  end

  test "name should not be too long" do
    @project.name = "a" * 51
    assert_not @project.valid?
  end

  test "name should be unique" do
    duplicate_project = @project.dup
    @project.save
    assert_not duplicate_project.valid?
  end
end
