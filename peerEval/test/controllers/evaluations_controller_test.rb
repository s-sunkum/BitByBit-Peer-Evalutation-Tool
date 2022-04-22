require "test_helper"

class EvaluationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get evaluations_new_url
    assert_response :success
  end

  test "should get index" do
    get evaluations_index_url
    assert_response :success
  end

#   test "should get index" do
#     get evaluations_url
#     assert_response :success
#   end

test "should get show" do
    get evaluations_show_url
    assert_response :success
  end
  
end
