ActiveAdmin.register Catastro do

  scope :all, :default => true
  scope :catastro
  scope :urbano

  action_item(:except =>[:index,:new]) do
    a = link_to("Ver pases", admin_catastro_pases_path(catastro)) + link_to("Nuevo pase", new_admin_catastro_pase_path(catastro))
    a
  end 

  filter :id
  filter :partida
  filter :numero_expediente_colegio
  filter :people_name,:as => :string, :label => "Profesional"

  show do
    panel "Catastro" do
      attributes_table_for catastro,
        :id, :partida, :numero_expediente_colegio, :final_de_obra,
        :convenio_id, :created_at, :updated_at
    end

    panel "Profesionales" do
      table_for catastro.people do
        column :name
        column :doc
      end
    end

    panel "Pases" do
      table_for catastro.pases do
        column :oficina
        column :entrada
        column :observaciones
        column(:estado) {|order| status_tag(order.estado)  }
      end
    end
    active_admin_comments
  end

  index do
    column :id
    column :numero_expediente_colegio
    column :final_de_obra
    column :partida
    column "Oficina Actual",:pase,:sortable => false
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|

    f.inputs "Details" do
      f.input :numero_expediente_colegio
      f.input :partida
      f.input :convenio_id
      f.input :category
      f.input :final_de_obra, :as=>:string, :input_html => {:class => 'datepicker',:size=>10}
      f.input :people_tokens,
      :input_html => {
        "data-pre" => f.object.people.to_json(:methods => :name), :only => [:id, :name] }
   end

    f.buttons
  end

  #-- versionado--
  sidebar :versionado, :partial => "layouts/version", :only => :show
  member_action :history do
    catastro = Catastro.find(params[:id])
    @versions = catastro.versions
    render "layouts/history"
  end
  #-- end versionado --
  
  controller do

    load_and_authorize_resource
    skip_load_resource :only => :index

    def show
      @versions =@catastro.versions 
      @catastro = @catastro.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular
    end

    def create

      create! do |format|
        format.html {redirect_to new_admin_catastro_pase_path @catastro}
      end
    end

    def update

      update! do |format|
        format.html {redirect_to admin_catastro_path @catastro}
      end
    end

  end

end
