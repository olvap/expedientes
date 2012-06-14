ActiveAdmin.register Oficina,:as => "Oficinas" do

  menu :if => proc{ can?(:read, Oficina) }, :parent => "Comunes"

  controller.authorize_resource

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :urgencia
      f.input :destinos, :as => :check_boxes
      f.input :inicial

    end

    f.buttons
  end

end
