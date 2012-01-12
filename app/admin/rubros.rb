ActiveAdmin.register Rubro do

  menu :if => proc{ can?(:manage, Rubro) }, :parent => "Comunes"

  controller.authorize_resource
end
