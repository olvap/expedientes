module Expedientes

  class Expediente < ActiveRecord::Base

    has_paper_trail
    #belongs_to :profesional
    has_many :pases
    #belongs_to :pase
    belongs_to :category
    has_and_belongs_to_many :people, :class_name => "Person",
                          :join_table => :expedientes_pedidos, :uniq => true

    attr_reader :people_tokens

    alias_attribute :name ,:id

    scope :catastro, where(:category_id=>1)
    scope :urbano, where(:category_id=>2)


    def people_tokens=(ids)
      self.person_ids = ids.split(",")
    end

     def people_format
       people.map do |person|
         person.name
       end
     end

    def pase
      pases.last.try(:oficina).try(:name)
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
