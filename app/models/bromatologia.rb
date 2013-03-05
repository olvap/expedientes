# encoding: utf-8
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
  scope :rubro_erroneo, joins(:negocios).where("negocios.rubro_id < 999 and negocios.rubro_id > 0")

  alias_attribute :name ,:id

  delegate :addresses, :to => :person, :prefix => false, :allow_nil => true
  delegate :name, :to => :person, :prefix => true, :allow_nil => true

  def person_token
    [person]
  end

  def calcular_deuda(periodo)
    c = 0
    if negocios.first.rubro.sub_rubro == 1
      c = 189
    end
    if negocios.first.rubro.sub_rubro == 2
      c = 126
    end
    if negocios.first.rubro.sub_rubro == 3
      c = 83.16
    end
    if negocios.first.rubro.sub_rubro == 4
      c = 56.66
    end
    if negocios.first.rubro.sub_rubro == 5
      c = 41.52
    end
    if negocios.first.rubro.sub_rubro == 6
      c = 31.5
    end
    c
  end

  def calcular_deuda_actualizada(periodo)
    calcular_deuda(periodo) * periodo.interes
  end

end
