ActiveAdmin.register Expediente do

  scope :all, :default => true
  scope :pases_de_hoy
  scope :vencidos

  action_item(:except =>[:index,:new]) do
    link_to("Nuevo pase", new_admin_expediente_pase_path(expediente))
  end

  filter :id
  filter :partida
  filter :responsable
  filter :numero_expediente_colegio
  filter :people_name,:as => :string, :label => "Profesional"
  filter :pase_oficina_name,:as => :string, :label => "Oficina"
  filter :urgencia
  filter :inicio

  show do
    div(:id => "xtabs") do
      ul do
        li link_to "Detalles", "#xtabs-1"
        li link_to "Profesionales", "#xtabs-2"
        li link_to "Pases", "#xtabs-3"
      end
      div(:id => "xtabs-1") do
        attributes_table_for expediente,
          :id, :partida, :responsable, :numero_expediente_colegio, :final_de_obra,
          :convenio_id, :numero_de_recibo, :importe, :created_at, :updated_at
      end

      div(:id => "xtabs-2") do
        panel "Profesionales" do
          table_for expediente.people do
            column :name do |p| link_to p.name, admin_person_path(p) end
            column :doc
          end
        end
      end

      div(:id => "xtabs-3") do
        expediente.pases.each do |pase|
          div :class => "pases" do
            div :class => "meta" do
              h4(link_to pase.oficina_name, admin_oficina_path(pase.oficina), :class => "active_admin_pase_author")
              span(pretty_format(pase.entrada))
            end
            div :class => "body" do
              div my_simple_format pase.observaciones if pase.observaciones
              div link_to("Detalles", admin_expediente_pase_path(expediente,pase))
              div link_to "Imprimir", imprimir_admin_expediente_pase_path(expediente,pase)
            end
          end
        end
      end
    end
    active_admin_comments
  end

  index do
    column :id
    column :numero_expediente_colegio
    column :responsable
    column :partida
    column :inicio
    column :pase, :sortable => false
    column(:urgencia){|expediente| status_tag(expediente.urgencia)}
    default_actions
  end

  form do |f|

    f.inputs "Details" do
      f.input :numero_expediente_colegio
      f.input :responsable
      f.input :urgencia
      f.input :inicio, :collection => Oficina.iniciales
      f.input :partida
      f.input :convenio_id
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
    expediente = expediente.find(params[:id])
    @versions = expediente.versions
    render "layouts/history"
  end
  #-- end versionado --

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("expediente")}}

  controller do

    load_and_authorize_resource
    skip_load_resource :only => :index

    def show
      @versions =@expediente.versions
      @expediente = @expediente.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular
      show!
    end

    def create

      create! do |format|
        format.html {redirect_to new_admin_expediente_pase_path @expediente}
      end
    end

    def update

      update! do |format|
        format.html {redirect_to admin_expediente_path @expediente}
      end
    end

  end

end
