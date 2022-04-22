require "test_helper"

class TeamsHelperControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teams_helper_url
    assert_response :success
  end

  # test "should get index" do
  #   get teamshelper_url
  #   assert_response :success
  # end

  # test "should get index" do
  #   get '/addstudents'
  #   assert_response :success
  # end
end
