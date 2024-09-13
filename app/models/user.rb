class User < ApplicationRecord
  extend Devise::Models
    enum user_type: {
      developer: 0, 
      manager: 1, 
      qa: 2
    }

    has_many :projects_users
    has_many :projects, through: :projects_users
    has_many :created_bugs, class_name: 'Bug', foreign_key: 'creator_id'  
    has_many :assigned_bugs, class_name: 'Bug', foreign_key: 'developer_id'  
  
    validates :name, presence: true

    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
