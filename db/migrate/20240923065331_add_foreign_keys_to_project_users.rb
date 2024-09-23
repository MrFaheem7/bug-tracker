class AddForeignKeysToProjectUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :project_users, :projects
    add_foreign_key :project_users, :users
  end
end
