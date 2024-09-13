class Bug < ApplicationRecord
  validates :title,presence:true,uniqueness:{
    
  }
  enum :status,{
    :new => 0,
    :started=>1,
    :completed=>2,
    :resolved=>3,
    }
    enum :bug_type, {
      :feature=>0,
      :bug=>1
    }
end
