class Pase < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  has_paper_trail

  belongs_to :catastro
  belongs_to :oficina

#  validate :ultimo?
  validates :oficina, :presence => true
  validates :entrada, :presence => true
  #default_scope :order => "created_at desc"

  def admin_permalink
    admin_catastro_pase_path(self.catastro,self)
  end

  def penultimo?
    self == catastro.try(:pases)[-2]
  end

  def ultimo?
    (self == catastro.try(:pases).try(:last) || !id)
  end

  def estado
    if ultimo?
      "Pendiente"
    else
      "Movido"
    end
  end

end
