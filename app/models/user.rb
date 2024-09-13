class User < ApplicationRecord
  extend Devise::Models
   enum :user_type, {
    :developer=>0, 
    :manager=>1, 
    :qa=>2}
   
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
