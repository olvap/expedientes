class Tgivariable < ActiveRecord::Base
  belongs_to :tgi
  belongs_to :edificacion
  belongs_to :estado
end
