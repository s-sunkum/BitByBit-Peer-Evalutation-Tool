class RemoveProjectIdFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :project_id, :integer
  end
end
