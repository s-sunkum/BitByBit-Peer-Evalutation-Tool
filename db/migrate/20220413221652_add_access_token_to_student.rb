class AddAccessTokenToStudent < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :access_token, :string
  end
end
