class AddTeacherIdToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :teacher_id, :integer
  end
end
