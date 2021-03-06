class Ability
  include CanCan::Ability

  @@user
  def initialize(user)
    @@user = user || User.new # Guest user

    can :read, AdminUser, :id => @@user.id
    can :read, Person, :id => @@user.try(:person).try(:id)
    @@user.roles.each do |r|
      self.send(r.name.downcase)
    end
  end

  def municipal
    can [:read, :imprimir], :all
    can :create, Topic
    can :inbox, AdminUser
    can :create, Mensaje
  end

  def admin
    can :manage, :all
  end

  def oficinas
    can :manage, Oficina
  end

  #personas
  def personas
    can [:create, :update], Address
    can [:create, :update], Person
    can :familiares, Person
  end

  # este usuario es el que va a cargar y modificar los catastro
  # tiene el rol más alto dentro de la parte de catastro
  def catastro
    can [:create, :update], [Expediente, Oficina]
    can :create, Pase
    #solo pueden modificar el ultimo, aunque sin la restriccion del tiempo.
    can :update, Pase, :ultimo?
  end

  # Este rol solo permite crear y modificar los expedietnenes que el
  # usuario tiene permitido en su perfil.
  def expedientes
    can [:create, :update], Expediente do |expediente|
      !expediente.inicio_id or @@user.oficina_ids.include? expediente.inicio_id
    end
  end

  #este rol es para los usuarios que solo que mueven expedientes de catastro
  def pases
    #solo pueden crear pase si el expediente se encuentra en su ofinca
    can :create, Pase do |pase|
      @@user.oficina_ids.include? pase.expediente.try(:oficina).try(:id) or !pase.expediente.pase
    end
    #solo pueden editarlo si vino de su oficina
    can :update, Pase do |pase|
      (@@user.oficina_ids.include? pase.expediente.come_from.id and pase.ultimo?) and
      # si se modifico hace mas de un dia ya no se puede modificar mas.
      (pase.updated_at >= Time.new.yesterday)
    end
  end

  def bromatologia
    can :manage, Bromatologia
  end

  def manager
    can :manage, [Forum, Topic]
  end

  def localidad
    can :manage, :localidad
  end
end
