class Project < ApplicationRecord

    has_many :project_users
    has_many :users, through: :project_users
    has_many :bugs, dependent: :destroy 
     
    validates :name, presence: true,uniqueness:{message:"Project Name should be unique"}
end
