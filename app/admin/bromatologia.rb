ActiveAdmin.register Bromatologia do
  menu :if => proc{ can?(:manage, Bromatologia) }, :parent => "Bromatologia"

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index
  end

  filter :id
  filter :person_name, :as => :string
  filter :libreta_sanitaria, :as => :select
  filter :curso_de_manipulador, :as => :select
  filter :control_de_plagas, :as => :select

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("people")}}

  scope :all, :default => true
  scope :sin_direccion
  scope :rubro_erroneo

  index do
    column "RBL" do |b| b.id end
    column "Persona" do |b| b.person.try(:name) end
    column "Correo" do |b| b.address.try(:format) end
    column :libreta_sanitaria
    column :curso_de_manipulador
    column :control_de_plagas
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
          end
        end
      end
    end
    active_admin_comments
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
        "data-pre" => f.object.person_token.to_json(:methods => :name), :only => [:id, :name] }
      f.inputs :libreta_sanitaria, :curso_de_manipulador, :control_de_plagas
      f.has_many :negocios do |n|
        n.input :name
        n.input :rubro, :collection => Rubro.bromatologia
      end
    end
    f.buttons
  end

  action_item(:except =>[:index,:new]) do
    link_to("Correo", correo_admin_bromatologia_path(bromatologia))
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
