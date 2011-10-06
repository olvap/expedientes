module Personas
  class Sexo < ActiveRecord::Base
    # FIX: cuando se solucione el problema de rails.
    def self.table_name
      "personas_sexos"
    end
  end
end
