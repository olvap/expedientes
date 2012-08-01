ActiveAdmin.register Negocio do
  menu :if => proc{ can?(:manage, Bromatologia) }, :parent => "Bromatologia"

  filter :name
  filter :rubro
  filter :bromatologia_person_name,:as => :string, :label => "Responsable"
#  filter :rubro_sub_rubro,:as => :number, :label => "Categoria"

  index do
    column :bromatologia
    column :name
    column :rubro
    column :responsable do |negocio| negocio.try(:bromatologia).try(:person).try(:name) end
    column :categoria do |negocio| negocio.try(:rubro).try(:sub_rubro)end
  end
end
