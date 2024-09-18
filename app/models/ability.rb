class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new 
    if user.manager?
      can :manage, Project
      can :manage, Bug

    elsif user.developer?
     
      can :manage, Bug do |bug|
        bug.developer == user
      end
      can :read, Project
      can :my_tasks,Bug

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
