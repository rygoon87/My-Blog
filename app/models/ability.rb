class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new

      if user.is_admin?
        can :manage, :all
      end

      can [:edit, :destroy], Post do |post|
        post.user == user
      end

      can [:show, :destroy, :edit], User, :id => user.id

    end

end
