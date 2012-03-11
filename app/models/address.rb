class Address < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  has_paper_trail

  def admin_permalink
    admin_person_address_path(self.person,self)
  end

  # FIX: cuando se solucione el problema de rails.

  belongs_to :localidad
  belongs_to :taddress
  belongs_to :person

  has_many :bromatologias
  alias_attribute :name ,:format

  def format
    "#{street} #{number} #{other} #{localidad.try :name} #{localidad.try :postal}"
  end

  def relations
    [:bromatologias]
  end

  def localidad_token
    [localidad]
  end

#  def copy(id)
#    resource = self.class
#  end

end
