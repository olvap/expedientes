class Deuda < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  def admin_permalink
    admin_deuda_path(self)
  end
  has_paper_trail

  belongs_to :tributable, :polymorphic => true

  belongs_to :periodo
  validates :tributable_id, :uniqueness => {:scope => [:tributable_type, :periodo_id]}

  default_scope :include => :periodo

  delegate :name, :to => :periodo, :prefix => true, :allow_nil => true

  before_save :calcular_deuda

  def borrar
    if !baja
      self.baja = 1
      save
    end
  end

  def calcular_deuda
    self.monto = tributable.calcular_deuda(periodo)
  end

  def actualiazada
    tributable.calcular_deuda_actualizada(periodo)
  end

end
