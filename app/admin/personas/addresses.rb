ActiveAdmin.register Address do
  menu false
  belongs_to :person, :optional =>true

  form do |f|
    f.inputs "Details" do
      f.input :taddress
      f.input :street
      f.input :number
      f.input :other
      f.input :localidad_id,
      :input_html => {
        "data-pre" => f.object.localidad.to_json(:methods => :name), :only => [:id, :name] }
      f.input :email
      f.input :telefono
      f.input :person_id, :as => :hidden

    end

    f.buttons
  end

  controller do

    load_and_authorize_resource
    skip_load_resource :only => :index

    def show
      #@person = Person.find params[:id] #esto lo hace cancan
      @versions =@address.versions
      @person = @address.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular

    end
    
    def create

      create! do |format|
        format.html {redirect_to admin_person_path @person}
      end
    end

    def update

      update! do |format|
        format.html {redirect_to admin_person_path @person}
      end
    end

  end

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("people")}}

  member_action :history do
    @address = Address.find(params[:id])
    @versions = @address.versions
    render "layouts/history"
  end
end
