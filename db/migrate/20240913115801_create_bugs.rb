class CreateBugs < ActiveRecord::Migration[7.2]
  def change
    create_table :bugs do |t|
      t.string :title, null: false
      t.text :description
      t.integer :bug_type, null: false 
      t.integer :status, null: false, default: 0  
      t.date :deadline
      t.references :project, null: false, foreign_key: true  
      t.integer :creator_id  
      t.integer :developer_id 

      t.timestamps
    end

    
    add_foreign_key :bugs, :users, column: :creator_id  
    add_foreign_key :bugs, :users, column: :developer_id  
  end
end
