class DropStudentsTeamJoinTable < ActiveRecord::Migration[6.1]
  def change
    drop_join_table :students, :teams
  end
end
