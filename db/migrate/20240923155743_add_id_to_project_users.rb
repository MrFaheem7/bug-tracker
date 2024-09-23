class AddIdToProjectUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :project_users, :id, :primary_key
  end
end
