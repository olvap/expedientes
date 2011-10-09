ActiveAdmin.register Empleado do
  belongs_to :person,:singleton => true

  form :url => {:controller => "admin/empleados"} do |f|
    f.inputs "Details" do
      f.input :inicio, :as=>:string, :input_html => {:class => 'datepicker'}
      f.input :legajo
      f.input :person
    end

    f.buttons
  end

end
