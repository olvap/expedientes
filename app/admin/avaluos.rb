ActiveAdmin.register Avaluo do
  belongs_to :tgi

  form do |f|
    f.inputs "Details" do
      f.input :valor
      f.input :descuento
      f.input :estado
      f.input :edificacion
    end
    f.buttons
  end
end
