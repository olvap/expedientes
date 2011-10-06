module Personas
  class Taddress < ActiveRecord::Base
    # FIX: cuando se solucione el problema de rails.
    def self.table_name
      "personas_addresses"
    end
  end
end
