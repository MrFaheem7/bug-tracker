class RemoveColumnNameFromProjects < ActiveRecord::Migration[7.2]
  def change
    remove_column :projects, :manager_id
  end
end