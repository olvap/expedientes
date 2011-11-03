module Expedientes
  class Oficina < ActiveRecord::Base

    has_paper_trail
    has_many :pases

    include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

    def admin_permalink
      admin_oficina_path(self)
    end
  
  end
end
