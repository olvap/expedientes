class Tgi < ActiveRecord::Base
  belongs_to :tributo
  belongs_to :manzana
  
  has_many :avaluos
end
