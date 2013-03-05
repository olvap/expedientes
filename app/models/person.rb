class Person < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  def admin_permalink
    admin_person_path(self)
  end
  #assosiations
  has_paper_trail

  has_one :comercy
  has_one :family

  has_many :profesionals
  has_many :cursos
  has_many :empleados
  has_many :addresses
  belongs_to :civil
  belongs_to :sexo
  belongs_to :tdoc

  has_and_belongs_to_many :expedientes,
    :join_table => :expedientes_people, :uniq => true

  has_many :matrimonios, :class_name => 'Matrimonio',:foreign_key => "person1_id"
  has_many :matrimonios_seccond, :class_name => 'Matrimonio',:foreign_key => "person2_id"

  scope :profesionales, joins(:profesionals) #& where(:id=>1)
  scope :empleados, joins(:empleados) #& where(:id=>1)
  scope :not_female, where("sexo_id = 1 or sexo_id is null")
  scope :not_male, where("sexo_id = 2 or sexo_id is null")

  #validation
  validates :name, :presence => true

  #acts_as_locked(:name, :born, :doc, :tdoc_id, :sexo_id)

  #version
  def version
    versions.count
  end

  def title
    "#{name} ##{id}"
  end

  #end version

  def format
    name
  end

  def empleado?
    (empleados.count > 0)
  end

  def parejas?
    ( parejas.count > 0 )
  end

  def estado_pareja p
    if parejas? and parejas.index p
      pareja = parejas[parejas.index p]
      if pareja
        m = Matrimonio.where("person1_id = ? or person2_id = ?",pareja.id,pareja.id)
        m.last
      end
    end
  end

  def relative_admin_person_path(p)
    m = estado_pareja p
    if (m)
      edit_admin_person_matrimonio_path(m.person1, m)
    else
      if (p == pather || p == mother)
        familiares_admin_person_path(self)
      else
        familiares_admin_person_path(p)
      end
    end
  end

  def parejas
    p = []
    p = p + matrimonios.map{|k,v|k.person2} + matrimonios_seccond.map{|k,v|k.person1}
  end

end
