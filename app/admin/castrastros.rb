ActiveAdmin.register Catastro do

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index
  end

  action_item(:except =>[:index,:new]) do
    a = link_to("Ver pases", admin_catastro_pases_path(catastro)) + link_to("Nuevo pase", new_admin_catastro_pase_path(catastro))
    a
  end 
  controller do
    def show

      @versions =@catastro.versions 
      @catastro = @person.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular
    end
  end

  form do |f|

    f.inputs "Details" do
      f.input :numero_expediente_colegio
      f.input :partida
      f.input :final_de_obra, :as=>:string, :input_html => {:class => 'datepicker',:size=>10}
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
