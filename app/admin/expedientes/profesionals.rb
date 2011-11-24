ActiveAdmin.register Profesional do
  belongs_to :person

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index  
  end

  form do |f|
    f.inputs "Details" do
      f.input :titulo
      f.input :matricula
    end

    f.buttons
  end
end
