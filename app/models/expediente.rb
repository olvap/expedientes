class Expediente < ActiveRecord::Base

  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  def admin_permalink
    admin_expediente_path(self)
  end

  Urgencia = { 0 => "Normal", 1 => "Lento", 2 => "Medio", 3 => "Urgente"}
  UrgenciaColection = Urgencia.invert

  def urgencia
    Urgencia[read_attribute(:urgencia)] || "No indicado"
  end

  has_paper_trail

  scope :pases_de_hoy, where("entrada >= ?", 1.day.ago.strftime("%Y-%m-%d")).joins(:pase)
  scope :vencidos, where("oficinas.urgencia - expedientes.urgencia >= datediff(curdate(), pases.entrada) and oficinas.urgencia > 0").joins(:pase).joins(:oficina)

  has_many :pases
  belongs_to :pase
  has_one :oficina, :through => :pase
  delegate :destinos, :to => :oficina, :prefix => true, :allow_nil => true

  belongs_to :inicio, :class_name => "Oficina"
  delegate :destinos, :to => :inicio, :prefix => true, :allow_nil => true

  has_and_belongs_to_many :people, :class_name => "Person",
                        :join_table => :expedientes_people, :uniq => true

  attr_reader :people_tokens

  alias_attribute :name ,:id

  def people_tokens=(ids)
    self.person_ids = ids.split(",")
  end

   def people_format
     people.map do |person|
       person.name
     end
   end

  def come_from
    pases[-2].try(:oficina)
  end

  def posibles_destinos
    if pases.count > 0
      oficina_destinos
    else
      inicio_destinos
    end
  end

end
