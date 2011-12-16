ActiveAdmin.register Bromatologia do
  
  filter :id
  filter :person_name, :as => :string

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("people")}}

  index do
    column :id
    column "Persona" do |b| b.person.try(:name) end
    column "Correo" do |b| b.address.try(:format) end
    default_actions
  end
  
  show do
    div(:id => "xtabs") do
      ul do
        li link_to "Detalles", "#xtabs-1"
        li link_to "Actividades", "#xtabs-4"
     #   li link_to "Avaluo", "#xtabs-2"
     #   li link_to "Deuda", "#xtabs-3"
      end
      div(:id=> "xtabs-1") do
      
        attributes_table_for bromatologia,
          :id, :person,:address, :created_at,:updated_at

      end
      div(:id=> "xtabs-4") do
        panel "actividades" do
          table_for bromatologia.negocios do
            column :id
            column :name
            column :rubro
            column :categoria
          end
        end
        link_to "Administrar", admin_bromatologia_negocios_path(bromatologia)
      end
    end
  end

  controller do

    def show
      @bromatologia = Bromatologia.find(params[:id])
      @versions = @bromatologia.versions
      @bromatologia = @bromatologia.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular
      #@version = @tgi
    end
    
  end

  form do |f|
    f.inputs "Detalle" do
      f.input :person_id,
      :input_html => {
        "data-pre" => f.object.person.to_json(:methods => :name), :only => [:id, :name] }
      f.has_many :negocios do |n|
        n.inputs :name,:rubro,:categoria
      end
    end
    f.buttons
  end
  
  member_action :correo, :method => :get do
    @bromatologia = Bromatologia.find(params[:id])
  end
  
  member_action :history do
    @bromatologia = Bromatologia.find(params[:id])
    @versions = @bromatologia.versions
    render "layouts/history"
  end

end