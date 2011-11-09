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
  has_many :matrimonios, :class_name => 'Matrimonio',:foreign_key => "person1_id"
  has_many :matrimonios_seccond, :class_name => 'Matrimonio',:foreign_key => "person2_id"

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

  def familiaridad(p)
    r = (estado_pareja p).try(:estado) || "Hermano"
    r = "Padre" if (p == pather)
    r = "Madre" if (p == mother)
    r = "hijo" if (p.pather == self)
    r = "hijo" if (p.mother == self)
    r
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
    f = f + padres + hijos + hermanos + parejas
    check_uniq f
  end 

  def parejas
    p = []
    p = p + matrimonios.map{|k,v|k.person2} + matrimonios_seccond.map{|k,v|k.person1}
  end

  def fathers
    if pather
      [pather]
    else
      []
    end
  end
  
  def mothers
    if mother
      [mother]
    else
      []
    end
  end

  private
  def check_uniq(object)
    object.delete nil
    object.delete self
    object.uniq!
    object
  end
end
