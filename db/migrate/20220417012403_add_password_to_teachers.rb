class AddPasswordToTeachers < ActiveRecord::Migration[6.1]
  def change
    add_column :teachers, :password, :string
  end
end
