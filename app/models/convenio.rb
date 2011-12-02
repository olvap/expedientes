class Convenio < ActiveRecord::Base
  belongs_to :tributable, :polymorphic => true
  belongs_to :tributo
  
  has_and_belongs_to_many :deudas
  
  def deuda_count
    deudas.count
  end
  
  def deuda_desde
    deudas.first
  end
  
  def deuda_hasta
    deudas.last
  end
end
