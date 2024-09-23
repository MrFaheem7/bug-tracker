class AddUniqueIndexToProjectUsers < ActiveRecord::Migration[7.2]
  def change
    add_index :project_users, [:project_id, :user_id], unique: true
  end
end
