class RemoveTeamIdFromEvaluations < ActiveRecord::Migration[6.1]
  def change
    remove_column :evaluations, :team_id, :integer
  end
end
