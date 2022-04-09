class CreateTeamsStudentsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :teams, :students do |t|
      t.index [:team_id, :student_id]
      t.index [:student_id, :team_id]
    end
  end
end
