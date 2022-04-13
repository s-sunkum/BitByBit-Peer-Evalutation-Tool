class AddProjectIdToEvaluations < ActiveRecord::Migration[6.1]
  def change
    add_column :evaluations, :project_id, :integer
  end
end
