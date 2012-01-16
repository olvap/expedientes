class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # Guest user

    can :read, AdminUser, :id => user.id
    can :read, Person, :id => user.try(:person).try(:id)

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
    can :manage, [Catastro, Pase, Oficina]
  end

  def pases
    can :create, Pase
  end

  def manager
    can :manage, [Forum, Topic]
  end

  def localidad
    can :manahe, :localidad
  end
end
