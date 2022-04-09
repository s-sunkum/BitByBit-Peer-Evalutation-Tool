class AddProjectIdToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :project_id, :integer
  end
end
