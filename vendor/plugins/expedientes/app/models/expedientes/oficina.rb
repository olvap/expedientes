module Expedientes
  class Oficina < ActiveRecord::Base
    has_many :pases

  end
end
