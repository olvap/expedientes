ActiveAdmin.register Negocio do
  menu :if => proc{ can?(:manage, Bromatologia) }, :parent => "Bromatologia"

  actions  :index

  filter :name
  filter :rubro

  index do
    column :bromatologia
    column :name
    column :rubro
    column :responsable do |negocio| negocio.try(:bromatologia).try(:person).try(:name) end
  end
end
