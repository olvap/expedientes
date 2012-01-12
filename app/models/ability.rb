class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # Guest user

    can :read, :all # todos pueden ver todo.

    user.roles.each do |r|
      self.send(r.name.downcase)
    end
  end

  def admin
    can :manage, :all
  end

  #personas
  def personas
    can [:create, :read, :update], Address
    can [:create, :read], Person
    can :familiares, Person
  end

  # este usuario es el que va a cargar y modificar los catastro
  # tiene el rol más alto dentro de la parte de catastro
  def catastro
    can :manage, Catastro
    can :manage, Pase
    can :manage, Oficina
  end

  def manager
    can :manage, Forum, Topic
  end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

end
