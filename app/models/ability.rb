class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.admin?
       can :manage,:all
    elsif user.client?
    can :show, Article
    can :manage,Comment
    else
       can :show, Article
    end

  end
  
end
