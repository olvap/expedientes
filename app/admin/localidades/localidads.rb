ActiveAdmin.register Localidad do
  menu :parent => "Comunes"
  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index  

    def index
      index! do |format|
        format.json { render :json => @localidads.to_json(:only => [:id, :name, :postal ], :include => { :departamento => {:only => [:name]}})} 

      end
    end
  end
end
