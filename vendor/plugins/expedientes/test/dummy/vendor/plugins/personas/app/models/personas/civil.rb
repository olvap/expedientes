module Personas
  class Civil < ActiveRecord::Base
    # FIX: cuando se solucione el problema de rails.
    def self.table_name
      "personas_civils"
    end
  end
end
