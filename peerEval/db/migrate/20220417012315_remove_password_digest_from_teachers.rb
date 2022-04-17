class RemovePasswordDigestFromTeachers < ActiveRecord::Migration[6.1]
  def change
    remove_column :teachers, :password_digest, :string
  end
end
