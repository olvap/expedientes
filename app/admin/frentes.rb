ActiveAdmin.register Frente do
  belongs_to :avaluo
  
  form do |f|
    f.inputs "Details" do
      f.input :categoria
      f.input :metros
    end
    f.buttons
  end
end
