class Catastro < Expedientes::Expediente

  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models

  def admin_permalink
    admin_catastro_path(self)
  end

end
