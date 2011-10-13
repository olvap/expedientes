module Expedientes
  class Pase < ActiveRecord::Base
    belongs_to :expediente
    belongs_to :oficina

    #validate :ultimo?

    def ultimo?
      if self == expediente.pases.last || expediente.pases.count == 0
        true
      else
        errors.add(:base, "Este expediente ha sido movido, ya no se puede actualizar")
        false
      end
    end

    def estado
      if ultimo?
        "Pendiente"
      else
        "Movido"
      end
    end

  end
end
