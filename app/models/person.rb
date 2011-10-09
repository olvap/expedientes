class Person < Personas::Person
  has_many :profesionals
  has_one :empleado

  scope :profesionales, joins(:profesionals) #& where(:id=>1)
  scope :empleados, joins(:empleado) #& where(:id=>1)

  def empleado?
    empleado
  end
end
