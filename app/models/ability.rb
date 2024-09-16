

class Ability
  include CanCan::Ability
  
  def initialize(user)
  
    if user.manager?
      can :manage, Project
      can :manage, Bug

    elsif user.developer?
      can :read, Bug, developer_id: user.id
      can :update, Bug, developer_id: user.id
      can :read, Project
    
    

    elsif user.qa?
     can :create, Bug
     can :read, Project
     can :read, Bug
    else

     can :read, Project
     can :read, Bug
    end    
  end
end
