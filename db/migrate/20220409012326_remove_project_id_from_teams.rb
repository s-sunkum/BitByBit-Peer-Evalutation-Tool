class RemoveProjectIdFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :project_id, :integer
  end
end
