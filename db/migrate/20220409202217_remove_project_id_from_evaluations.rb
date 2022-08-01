class RemoveProjectIdFromEvaluations < ActiveRecord::Migration[6.1]
  def change
    remove_column :evaluations, :project_id, :integer
  end
end
