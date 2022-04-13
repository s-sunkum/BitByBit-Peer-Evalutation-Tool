class RemoveTargetIdFromEvaluations < ActiveRecord::Migration[6.1]
  def change
    remove_column :evaluations, :target_id, :integer
  end
end
