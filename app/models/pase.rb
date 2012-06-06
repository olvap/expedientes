class Pase < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  has_paper_trail

  belongs_to :catastro
  belongs_to :expediente
  belongs_to :oficina

#  validate :ultimo?
  validates :oficina, :presence => true
  validates :entrada, :presence => true
  #default_scope :order => "created_at desc"

  def admin_permalink
    admin_expediente_pase_path(self.expediente,self)
  end

  def penultimo?
    self == expediente.try(:pases)[-2]
  end

  def ultimo?
    (self == expediente.try(:pases).try(:last) || !id)
  end

  def estado
    if ultimo?
      "Pendiente"
    else
      "Movido"
    end
  end

end
