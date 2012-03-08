class Rubro < ActiveRecord::Base
  scope :bromatologia, where("sub_rubro > 0")
end
