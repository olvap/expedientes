ActiveAdmin.register Manzana do
  menu :if => proc{ can?(:manage, Manzana) }, :parent => "Comunes"

  controller.authorize_resource
end
