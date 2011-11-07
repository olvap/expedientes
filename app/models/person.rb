class Person < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  #is_person
  has_paper_trail

  has_many :profesionals
  has_many :cursos
  has_one :empleado
  has_many :addresses
  belongs_to :civil
  belongs_to :sexo
  belongs_to :tdoc

  belongs_to :pather,:class_name => "Person", :foreign_key => "pather_id"
  belongs_to :mother,:class_name => "Person", :foreign_key => "mother_id"
  has_many :hijosv,:class_name => "Person", :foreign_key => "pather_id"
  has_many :hijosm,:class_name => "Person", :foreign_key => "mother_id"

  scope :profesionales, joins(:profesionals) #& where(:id=>1)
  scope :empleados, joins(:empleado) #& where(:id=>1)
  scope :not_female, where("sexo_id = 1 or sexo_id is null")
  scope :not_male, where("sexo_id = 2 or sexo_id is null")

  def format
    name
  end
  def admin_permalink
    admin_person_path(self)
  end
          
  def empleado?
    empleado
  end

  def pather_token
    [pather]
  end

  def mother_token
    [mother]
  end

  def familiaridad(p)
    r = "Hermano"
    r = "Padre" if (p == pather)
    r = "Madre" if (p == mother)
    r = "hijo" if (p.pather == self)
    r = "hijo" if (p.mother == self)
    r
  end

  def hijos
    h = []
    h = h + (hijosv if hijosv)+ (hijosm if hijosm)
  end

  def hermanos
    h = []
    
    h = pather.try(:hijosv) + pather.try(:hijosm) if pather
    h = mother.try(:hijosv) + mother.try(:hijosm) if mother
    h
  end

  def padres
    p = []
    p = p + [pather] + [mother]

  end
  
  def familiares
    f = []
    f = f + padres + hijos + hermanos
    check_uniq f
  end

  private
  def check_uniq(object)
    object.delete nil
    object.delete self
    object.uniq!
    object
  end
end
