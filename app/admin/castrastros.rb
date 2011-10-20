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

  controller do
    def show
      @versions =@catastro.versions 
      @catastro = @catastro.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular
    end
  end

  form do |f|

    f.inputs "Details" do
      f.input :numero_expediente_colegio
      f.input :partida
      f.input :final_de_obra, :as=>:string, :input_html => {:class => 'datepicker',:size=>10}
      f.input :people_tokens,
      :input_html => {
        "data-pre" => f.object.people.to_json(:methods => :name), :only => [:id, :name] }
   end

    f.buttons
  end

  sidebar :versionado, :partial => "layouts/version", :only => :show

  controller do
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
