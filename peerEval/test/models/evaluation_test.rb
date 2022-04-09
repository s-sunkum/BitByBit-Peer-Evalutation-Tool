require "test_helper"

class EvaluationTest < ActiveSupport::TestCase
  def setup
    @evaluation = Evaluation.new(project_id: 1 , score: 5, evaluator: 1, target_id: 2, team_id:1)
  end

  test "should be valid" do
    assert @evaluation.valid?
  end
end
