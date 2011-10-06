module Expedientes

  class Expediente < ActiveRecord::Base

    #belongs_to :profesional
    has_many :pases
    belongs_to :pase

    has_and_belongs_to_many :profesionals, :class_name => "Expedientes::Profesional",
                          :join_table => :expedientes_pedidos, :uniq => true

    attr_reader :profesionals_tokens

    def profesionals_tokens=(ids)
      self.profesional_ids = ids.split(",")
    end

     def profesionals_format
       profesionals.map do |profesional|
         profesional.name
       end
     end

    def oficina_id
      oficina.try :id
    end

    def oficina
      pase.try(:oficina)
    end

    def ubicacion_actual
      oficina.try :name
    end

    def fecha_de_entrada
      pase.try :entrada
    end

  end

end
