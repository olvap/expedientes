ActiveAdmin.register Person do

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index
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
    def show
      #@person = Person.find params[:id] #esto lo hace cancan
      @versions =@person.versions 
      @person = @person.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular
    end
  end

  sidebar "Ubicacion de Contacto", :only => :show do
      table_for person.addresses do
        column :format
        column :telefono
        column :email
        column "Acciones" do |a|
          link_to "editar", edit_admin_person_address_path(person,a)
        end
      end
    link_to "Ver todas", admin_person_addresses_path(person)
  end

#  sidebar :help

  sidebar :versionado, :partial => "layouts/version", :only => :show

  action_item(:only => :show) do
    link_to "agregar direccion de contacto", new_admin_person_address_path(person)
  end 
end
