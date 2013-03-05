class Pase < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  has_paper_trail

  belongs_to :expediente
  belongs_to :oficina

  delegate :name,                      :to => :oficina, :prefix => true, :allow_nil => true
  delegate :id,                        :to => :expediente, :prefix => true
  delegate :partida,                   :to => :expediente, :prefix => true
  delegate :responsable,               :to => :expediente, :prefix => true
  delegate :numero_expediente_colegio, :to => :expediente, :prefix => true
  delegate :inicio,                    :to => :expediente, :prefix => true

  validates :expediente, :presence => true
  validates :oficina, :presence => true
  validates :entrada, :presence => true
  #default_scope :order => "created_at desc"

  after_create :ultimo_pase
  after_destroy :remover_ultimo

  def admin_permalink
    admin_expediente_pase_path(self.expediente,self)
  end

  alias_attribute :name ,:oficina_name

  def remover_ultimo
    e = expediente
    if e.pases
      e.pase = e.pases.last
      e.save
    end
  end

  def ultimo_pase
    e = expediente
    e.pase_id = self.id
    e.save
  end

  def penultimo?
    self == expediente.try(:pases)[-2]
  end

  def ultimo?
    (self == expediente.try(:pase) || !id)
  end

  def estado
    if ultimo?
      "Pendiente"
    else
      "Movido"
    end
  end

end
