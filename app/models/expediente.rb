class Expediente < ActiveRecord::Base

  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  def admin_permalink
    admin_expediente_path(self)
  end

  has_paper_trail

  has_many :pases

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

  def pase
    pases.try(:last)
  end

  def oficina_id
    oficina.try :id
  end

  def oficina
    pase.try(:oficina)
  end

  def ubicacion_actual
    oficina.try :name
  end

  def fecha_de_entrada
    pase.try :entrada
  end
end
