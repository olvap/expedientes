class Catastro < ActiveRecord::Base

  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  def admin_permalink
    admin_catastro_path(self)
  end

  has_paper_trail
  #belongs_to :profesional
  has_many :pases
  #belongs_to :pase
  belongs_to :category
  has_and_belongs_to_many :people, :class_name => "Person",
                        :join_table => :pedidos, :uniq => true

  attr_reader :people_tokens

  alias_attribute :name ,:id

  scope :catastro, where(:category_id=>1)
  scope :edificaciones_privadas, where(:category_id=>2)


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
