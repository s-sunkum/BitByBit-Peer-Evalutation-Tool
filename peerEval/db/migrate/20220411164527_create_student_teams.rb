class CreateStudentTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :student_teams do |t|
      t.references :student, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
