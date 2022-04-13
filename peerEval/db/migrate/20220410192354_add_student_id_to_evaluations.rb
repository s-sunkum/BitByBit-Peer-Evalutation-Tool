class AddStudentIdToEvaluations < ActiveRecord::Migration[6.1]
  def change
    add_column :evaluations, :student_id, :integer
  end
end
