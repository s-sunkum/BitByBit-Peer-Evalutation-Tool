require "test_helper"

class StudentSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get student_sessions_new_url
    assert_response :success
  end

  # test "should show create" do
  #   article = articles(:one)
  #   get article_url(article)
  #   assert_response :success
  # end
  
end
