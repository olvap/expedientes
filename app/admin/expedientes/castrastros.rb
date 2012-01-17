ActiveAdmin.register Catastro do

  menu :if => proc{ can?(:manage, Catastro) or can?(:create, Pase)}

  scope :all, :default => true
  scope :catastro
  scope :edificaciones_privadas

  action_item(:except =>[:index,:new]) do
    link_to("Nuevo pase", new_admin_catastro_pase_path(catastro))
  end

  filter :id
  filter :partida
  filter :responsable
  filter :numero_expediente_colegio
  filter :people_name,:as => :string, :label => "Profesional"

  show do
    div(:id => "xtabs") do
      ul do
        li link_to "Detalles", "#xtabs-1"
        li link_to "Profesionales", "#xtabs-2"
        li link_to "Pases", "#xtabs-3"
      end
      div(:id => "xtabs-1") do
        attributes_table_for catastro,
          :id, :partida, :responsable, :numero_expediente_colegio, :final_de_obra,
          :convenio_id, :numero_de_recibo, :importe, :created_at, :updated_at
      end
      
      div(:id => "xtabs-2") do
        panel "Profesionales" do
          table_for catastro.people do
            column :name do |p| link_to p.name, admin_person_path(p) end
            column :doc
          end
        end
      end
      
      div(:id => "xtabs-3") do
        panel "Pases" do
          table_for catastro.pases do
            column :oficina
            column :entrada
            column :observaciones
            column(:estado) {|order| status_tag(order.estado)  }
            column{|pase| link_to "Ver", admin_catastro_pase_path(pase.catastro,pase )  }
          end
        end
      end
    end
    #active_admin_comments
  end

  index do
    column :id
    column :numero_expediente_colegio
    column :responsable
    column :partida
    column "Oficina Actual",:pase,:sortable => false
    default_actions
  end

  form do |f|

    f.inputs "Details" do
      f.input :numero_expediente_colegio
      f.input :responsable
      f.input :partida
      f.input :convenio_id
      f.input :category
      f.input :numero_de_recibo
      f.input :importe
      f.input :final_de_obra, :as=>:string, :input_html => {:class => 'datepicker',:size=>10}
      f.input :people_tokens,
      :input_html => {
        "data-pre" => f.object.people.to_json(:methods => :name), :only => [:id, :name] }
   end

    f.buttons
  end

  #-- versionado--
  #sidebar :versionado, :partial => "layouts/version", :only => :show
  member_action :history do
    catastro = Catastro.find(params[:id])
    @versions = catastro.versions
    render "layouts/history"
  end
  #-- end versionado --

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("catastro")}}

  controller do

    load_and_authorize_resource
    skip_load_resource :only => :index

    def show
      @versions =@catastro.versions
      @catastro = @catastro.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular
      show!
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
