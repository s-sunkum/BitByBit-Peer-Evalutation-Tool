class RemoveStudentIdFromEvaluations < ActiveRecord::Migration[6.1]
  def change
    remove_column :evaluations, :student_id, :integer
  end
end
