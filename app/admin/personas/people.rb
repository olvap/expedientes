ActiveAdmin.register Person do

  menu :label => "Personas"

  #controller.authorize_resource

  scope :all, :default => true
  scope :profesionales
  scope :empleados

  filter :id
  filter :name
  filter :doc

  index do
    column :id
    column :name
    column :doc
    column :locked_at
    default_actions
  end
  show :title => :name do
    div(:id => "notice")do
      params[:notice]
    end
    div(:id => "xtabs") do
      ul do
        li link_to "Detalles", "#xtabs-1"
        li link_to "Comercial", "#xtabs-7"
        li link_to "Contacto", "#xtabs-2"
        li link_to "Familiares", "#xtabs-3"
        li link_to "Profesion", "#xtabs-4"
        li link_to "Empleado", "#xtabs-5"
        li link_to "Formacion", "#xtabs-6"
      end
      div(:id=> "xtabs-1") do
          attributes_table_for person,
          :name, :born, :tdoc, :doc, :civil, :sexo, :dead
      end

      div(:id => "xtabs-7") do
        if person.comercy
          attributes_table_for person.comercy,
            :ingresos_brutos, :cuit, :cantidad_de_personal, :jubilado
        end
        link_to "Administrar", new_admin_person_comercy_path(person)
      end

      div(:id=> "xtabs-2") do
        panel "Ubicaciones" do
          table_for person.addresses do
            column :format, :as=>"Direccion"
            column :telefono
            column :email
            column "Acciones" do |a|
              link_to("Detalle ", admin_person_address_path(person,a)) +
              link_to(" Editar", edit_admin_person_address_path(person,a))
            end
          end
          link_to "Administrar", admin_person_addresses_path(person)
        end
      end
      div(:id => "xtabs-3") do
        panel "Matrimonios" do
          table_for person.parejas do
            column :name do |p| link_to p.name, admin_person_path(p) end
          end
          link_to "Administrar", admin_person_matrimonios_path(person)
        end
        panel "Familiares" do
          if person.family
            table_for person.family.parents do
               column do |p| link_to p.name, admin_person_path(p) end
               column do"padre/madre"end
            end
          end

          table_for Family.hermanos(person)do
            column do |a| link_to a.person.name, admin_person_path(a.person) end
            column do "hermano/a"end
          end

          table_for Family.hijos_de person.id do
            column do |a| link_to a.person.name, admin_person_path(a.person) end
            column do"hijo"end
          end

          link_to "Administrar", new_admin_person_family_path(person)

        end
      end
      div(:id => "xtabs-4") do
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
      
      div(:id => "xtabs-5") do
        panel "Empleado" do
          table_for person.empleados, do
            column :legajo
            column :inicio
          end
          link_to "Administrar", admin_person_empleados_path(person)
        end
      end

      div(:id => "xtabs-6") do
        panel "Cursos" do
          table_for person.cursos
          link_to "Administrar", admin_person_cursos_path(person)
        end

      end
    end

  #active_admin_comments if !params[:version]
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
      @person = Person.find params[:id]
      @versions = @person.versions
      @person = @person.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular
      @version = @person
    end
  end

#  sidebar :help

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("people")}}

  member_action :lock do
    @person.lock!
    if @person.locked?
      redirect_to :back, :notice => "Persona cerrada"
    else
      redirect_to :back, :notice =>"Completa todos los datos antes de cerrar"
    end
  end

  member_action :unlock do
    @person.unlock!
    redirect_to :back, :notice => "Persona abierta"
  end

  # falta para jubilado y para revertir
  # agregar datos comerciales: cantidad de empleados, ingresos brutos, cuit/cuil.
  member_action :matar do
    @person = Person.find(params[:id])
    @person.dead = Date.today
    @person.save!
    redirect_to :action => :show
  end



  member_action :history do
    @person = Person.find(params[:id])
    @versions = @person.versions
    render "layouts/history"
  end

end
