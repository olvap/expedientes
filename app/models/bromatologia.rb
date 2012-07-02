class Bromatologia < ActiveRecord::Base

  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  def admin_permalink
    admin_bromatologia_path(self)
  end
  has_paper_trail

#  has_one :tributo, :as => :tributable
  has_many :deudas, :as => :tributable

  belongs_to :address
  belongs_to :person
  has_many :negocios
  accepts_nested_attributes_for :negocios

  scope :sin_direccion, where("address_id is null")
  scope :rubro_erroneo, joins(:negocios).where("negocios.rubro_id < 999")

  alias_attribute :name ,:id

  delegate :addresses, :to => :person, :prefix => false, :allow_nil => true

  def person_token
    [person]
  end

  def calcular_deuda(periodo)
    10
  end

  def calcular_deuda_actualizada(periodo)
    10 * periodo.interes
  end

end
