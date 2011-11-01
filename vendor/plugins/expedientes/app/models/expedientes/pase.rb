module Expedientes
  class Pase < ActiveRecord::Base
    belongs_to :expediente
    belongs_to :oficina

    validate :ultimo?

    #default_scope :order => "created_at desc"

    def ultimo?
      if self == expediente.pases.last || !id
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
