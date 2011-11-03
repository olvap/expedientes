module Expedientes
  class Pase < ActiveRecord::Base
    include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
    has_paper_trail

    belongs_to :expediente
    belongs_to :oficina

    validate :ultimo?

    #default_scope :order => "created_at desc"

    def admin_permalink
      admin_catastro_pase_path(self.expediente,self)
    end
    
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
