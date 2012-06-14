class Expediente < ActiveRecord::Base

  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  def admin_permalink
    admin_expediente_path(self)
  end

  has_paper_trail

  scope :pases_de_hoy, where("entrada >= ?", 1.day.ago.strftime("%Y-%m-%d")).joins(:pase)
  scope :vencidos, where("oficinas.urgencia >= datediff(curdate(), pases.entrada)").joins(:pase).joins(:oficina)

  has_many :pases
  belongs_to :pase
  has_one :oficina, :through => :pase

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

end
