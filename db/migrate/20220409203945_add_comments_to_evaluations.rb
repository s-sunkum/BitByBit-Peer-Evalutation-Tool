class AddCommentsToEvaluations < ActiveRecord::Migration[6.1]
  def change
    add_column :evaluations, :comments, :text
  end
end
