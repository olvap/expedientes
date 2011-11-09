ActiveAdmin.register Empleado do
  belongs_to :person,:singleton => true

  form :url => {:controller => "admin/empleados"} do |f|
    f.inputs "Details" do
      f.input :inicio, :as=>:string, :input_html => {:class => 'datepicker'}
      f.input :legajo
    end

    f.buttons
  end

  action_item(:only => :show) do
    link_to("Cursos", admin_person_cursos_path(person)) +
    link_to("Agregar Curso", new_admin_person_curso_path(person))
  end

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index  
  end

  show do
    panel "Detalles" do
      attributes_table_for empleado,
         :legajo, :inicio, :created_at, :updated_at

    end
    panel "Cursos" do
      table_for empleado.person.cursos do
        column :name
        column :inicio
        column :duracion
        column :institucion
        column :titulo
        column "Acciones" do |a|
          link_to "editar", edit_admin_person_curso_path(person,a)
        end
      end
      link_to "Administrar", admin_person_cursos_path(person)
    end

  end

end
