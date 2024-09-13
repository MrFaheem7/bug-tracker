class CreateBugs < ActiveRecord::Migration[7.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.date :deadline
      t.string :status
      t.string :type
     

      t.timestamps
    end
  end
end
