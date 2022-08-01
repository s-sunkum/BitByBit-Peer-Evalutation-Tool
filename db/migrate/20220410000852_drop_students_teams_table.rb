class DropStudentsTeamsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :students_teams
  end
end
