module Expedientes
  class Pase < ActiveRecord::Base
    belongs_to :expediente
    belongs_to :oficina
  end
end
