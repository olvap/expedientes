class Person < Personas::Person

  def empleado?
    empleado
  end

  def admin_permalink
    admin_person_path(self)
  end

  scope :profesionales, joins(:profesionals) #& where(:id=>1)
  scope :empleados, joins(:empleado) #& where(:id=>1)

  has_many :profesionals
  has_one :empleado
end
