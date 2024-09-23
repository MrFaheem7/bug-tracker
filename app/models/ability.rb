class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new 
    if user.manager?
      can :manage, Project
      can :manage, Bug

    elsif user.developer?
      can :update, Bug do |bug|
        bug.developer_id == user.id
      end
      can :read, Bug
      can :read, Project
      can :my_tasks,Bug

    elsif user.qa?
      can :manage, Bug
      can :read, Project

    else
      can :read, Project
      can :read, Bug
    end    
  end
end
