ActiveAdmin.register Curso do
  belongs_to :person

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index
  end

    form do |f|
      f.inputs "Detalles" do
        f.input :name
        f.input :inicio, :as=>:string, :input_html => {:class => 'datepicker',:size=>10}
        f.input :duracion
        f.input :institucion
        f.input :titulo
      end
      f.buttons

  end
end
