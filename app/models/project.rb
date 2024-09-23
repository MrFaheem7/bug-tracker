class Project < ApplicationRecord

    has_many :project_users, dependent: :destroy
    has_many :users, through: :project_users
    has_many :bugs, dependent: :destroy 
     
    validates :name, presence: true,uniqueness:{message:"Project Name should be unique"}
    validate :at_least_one_user
    private
    def at_least_one_user
      if user_ids.blank?
        errors.add(:user_ids, "Please assign at least one user to the project.")
      end
    end
end
