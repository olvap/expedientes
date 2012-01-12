class Tgi < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  def admin_permalink
    admin_tgi_path(self)
  end
  has_paper_trail

  has_many :deudas, :as => :tributable

  belongs_to :manzana

  has_many :avaluos

  has_many :convenios, :as => :tributable

  belongs_to :address
  belongs_to :titular, :class_name => "Person"
  belongs_to :responsable, :class_name => "Person"

#  attr_reader :responsables_tokens
#  attr_reader :titulares_tokens

  alias_attribute :name ,:id

  def addresses
    (responsable.try(:addresses) ||[]) + (titular.try(:addresses) || [])
  end

  #genera la deuda para cada periodo
  def generar
    periodos = Periodo.all
    periodos.each do |periodo|
      Deuda.create(
        :tributable_id => id,
        :tributable_type => "Tgi",
        :calculable_id => avaluos.try(:last).try(:id),
        :calculable_type => "Avaluo",
        :periodo_id => periodo.id)
    end
  end

  def ubicacion
    "#{calle} #{numero} #{otro}"
  end
end
