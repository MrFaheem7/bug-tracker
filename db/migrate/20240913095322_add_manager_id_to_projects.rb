class AddManagerIdToProjects < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :manager_id, :bigint
  end
end
