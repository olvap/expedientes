class Person < Personas::Person
  has_many :profesionals

  scope :profesionales, joins(:profesionals) #& where(:id=>1)
  
end
