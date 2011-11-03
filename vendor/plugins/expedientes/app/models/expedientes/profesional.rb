module Expedientes
  class Profesional < ActiveRecord::Base

    has_paper_trail

    belongs_to :person, :class_name => "Personas::Person"

    def persons
      [self.person]
    end

    def name
      person.try :name
    end

  end
end
