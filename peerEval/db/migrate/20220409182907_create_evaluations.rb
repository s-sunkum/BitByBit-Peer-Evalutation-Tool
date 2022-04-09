class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.integer :project_id
      t.integer :score
      t.integer :evaluator
      t.integer :target_id
      t.integer :team_id

      t.timestamps
    end
  end
end