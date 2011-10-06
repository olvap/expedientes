module Personas
  class Tdoc < ActiveRecord::Base
    # FIX: cuando se solucione el problema de rails.
    def self.table_name
      "personas_tdocs"
    end
  end
end
