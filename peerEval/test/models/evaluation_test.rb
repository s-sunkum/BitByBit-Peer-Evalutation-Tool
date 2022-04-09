require "test_helper"

class EvaluationTest < ActiveSupport::TestCase
  def setup
    @evaluation = Evaluation.new(score: 5, comments: "Good job!")
  end

  test "should be valid" do
    assert @evaluation.valid?
  end

  test "score is in range" do
    @evaluation.score = 4
    assert @evaluation.valid?
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
