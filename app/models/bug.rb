class Bug < ApplicationRecord
 
  validates :title, presence: true, uniqueness: { scope: :project_id, message: "Title must be unique within a project" }
  validates :status, presence: true
  validates :bug_type, presence: true
 
  
  enum status: {
    new_bug: 0,
    started: 1,
    completed: 2,  
    resolved: 3    
  }

  enum bug_type: {
    feature: 0,
    bug: 1
  }
  
 
  belongs_to :project
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :developer, class_name: 'User', foreign_key: 'developer_id'
  private
 
end