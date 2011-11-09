class Localidad < ActiveRecord::Base
  belongs_to :departamento
  default_scope :include => [:departamento]
end
