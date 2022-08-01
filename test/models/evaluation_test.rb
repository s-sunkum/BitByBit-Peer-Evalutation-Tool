require "test_helper"

class EvaluationTest < ActiveSupport::TestCase
  def setup
    @evaluation = Evaluation.new(score: 5, comments: "Good job!", evaluator_id: 1, evaluatee_id: 1, project_id: 1)
  end

  test "score is a number" do
    @evaluation.score = "hello"
    assert_not @evaluation.valid?
  end

  test "score should be less than upper bound" do
    @evaluation.score = 6
    assert_not @evaluation.valid?
  end

  test "score should be greater than lower bound" do
    @evaluation.score = 0
    assert_not @evaluation.valid?
  end

  test 'comments should be present' do
    @evaluation.comments = ' '
    assert_not @evaluation.valid?
  end

  test "comments shouldn't exceed maximum length" do
    @evaluation.comments = "a"*501
    assert_not @evaluation.valid?
  end
end
