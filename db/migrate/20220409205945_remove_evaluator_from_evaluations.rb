class RemoveEvaluatorFromEvaluations < ActiveRecord::Migration[6.1]
  def change
    remove_column :evaluations, :evaluator, :integer
  end
end
