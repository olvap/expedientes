ActiveAdmin.register Person do

  menu :label => "Personas"

  scope :all, :default => true
  scope :profesionales
  scope :empleados

  filter :id
  filter :name
  filter :doc
  
  show do

    panel "Datos personales" do
      attributes_table_for person,
       :name, :born, :tdoc, :doc, :civil, :sexo
    end

    panel "Ubicacion de Contacto" do
      table_for person.addresses do
        column :format
        column :telefono
        column :email
        column "Acciones" do |a|
          link_to "editar", edit_admin_person_address_path(person,a)
        end
      end
      link_to "Administrar", admin_person_addresses_path(person)
    end

    if person.profesionals.count > 0
      panel "Profesion" do
        table_for person.profesionals do
          column :titulo
          column :matricula
          column "Acciones" do |a|
            link_to "editar", edit_admin_person_profesional_path(person,a)
          end
        end
        link_to "Administrar", admin_person_profesionals_path(person)
      end
    end

    if person.empleados
      panel "Empleado" do
        table_for person.empleados, do
          column :legajo
          column :inicio
        end
        link_to "Administrar", admin_person_empleado_path(person)
      end

    end
    
    if person.familiares
      panel "Familiares" do
        table_for person.familiares do
          column do |a|
            link_to a.name, admin_person_path(a)
          end
          column "tipo" do |a|
            person.familiaridad a
          end
          column "Acciones" do |a|
            link_to "Editar", person.relative_admin_person_path(a)
          end
        end
        link_to "nuevo matrimonio", new_admin_person_matrimonio_path(person)
      end
      
    end
    panel "Cursos" do
      table_for person.cursos

      link_to "Administrar", admin_person_cursos_path(person)
    end
  active_admin_comments
  end

  form do |f|

    f.inputs "Details" do
      f.input :name
      f.input :tdoc
      f.input :doc
      f.input :born, :as=>:string, :input_html => {:class => 'datepicker',:size=>10}
      f.input :civil
      f.input :sexo
    end

    f.buttons
  end

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index

    def show
      #@person = Person.find params[:id] #esto lo hace cancan
      @versions =@person.versions 
      @person = @person.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular
      @version = @person
    end
  end

#  sidebar :help

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("people")}}

  action_item(:only => :show) do
    link_to("agregar direccion de contacto", new_admin_person_address_path(person)) +
    link_to("agregar Profesion", new_admin_person_profesional_path(person)) +
    (link_to("Convertir en empleado", new_admin_person_empleado_path(person)) if !person.empleado?) +
    (link_to("Ver datos de empleado", admin_person_empleados_path(person)) if person.empleado?) +
    (link_to("Editar Familiares",{:action => :familiares}))
  end

  member_action :familiares do
    @person = Person.find(params[:id])
  end

  member_action :lock do
    @person = Person.find(params[:id])
    @person.lock!
    @person.save!
    redirect_to :action => :show
  end

  member_action :unlock do
    @person = Person.find(params[:id])
    @person.unlock!
    @person.save!
    redirect_to :action => :show
  end

  member_action :history do
    @person = Person.find(params[:id])
    @versions = @person.versions
    render "layouts/history"
  end

end
