class RenameProjectsUsersToProjectUsers < ActiveRecord::Migration[7.2]
  def change
    rename_table :projects_users, :project_users
  end
end
