class RemoveAccessTokenFromStudent < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :access_token, :integer
  end
end
