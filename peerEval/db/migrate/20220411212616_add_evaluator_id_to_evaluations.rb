class AddEvaluatorIdToEvaluations < ActiveRecord::Migration[6.1]
  def change
    add_column :evaluations, :evaluator_id, :integer
  end
end
