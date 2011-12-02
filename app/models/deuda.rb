class Deuda < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  def admin_permalink
    admin_deuda_path(self)
  end
  has_paper_trail

  belongs_to :tributable, :polymorphic => true
  belongs_to :calculable, :polymorphic => true

  belongs_to :periodo
  validates :tributable_id, :uniqueness => {:scope => [:tributable_type, :periodo_id]}

  default_scope :include => :periodo

  alias_attribute :name ,:format

  def format
    periodo.try(:name)
  end

  def year
    periodo.try(:name).to_s[0..3]
  end

  def actualizar
    calculable = tributable.avaluos.last if !baja
    save
  end

  def borrar
    if !baja
      self.baja = 1
      save
    end
  end

end
