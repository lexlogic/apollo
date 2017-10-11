class Ability
  include CanCan::Ability
 
  def initialize(user)
    if user.role == "admin" or user.role == "supervisor"
      can :manage, :all
    end
    if user.role == "worker"
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      can :read, Location
      can :read, Department
      can :manage, User, :id => user.id
      
      cannot :destroy, User
      cannot :read, ActiveAdmin::Page, :name => "Comments"
      cannot :read, ActiveAdmin::Page, :name => "Todos"
    end
    if user.role == "vendor"
      can :manage, :all
    end
    if user.role == "testing"
      can :read, :all
    end
  end
end