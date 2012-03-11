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
        "data-pre" => f.object.localidad_token.to_json(:methods => :name), :only => [:id, :name] }
      f.input :email
      f.input :telefono
      f.input :person_id, :as => :hidden

    end

    f.buttons
  end

#  controller do

#    load_and_authorize_resource
#    skip_load_resource :only => :index


## reemplazo de repetidos
#    before_filter :similar, :only => :show

#    def similar
##      copy(params[:copy]) if params[:copy]
#    end

##   este metodo tiene que fijarse que los 2 registros sean realmente parecidos.
##   Para eso tiene que usar algún tipo de metodo definido por el usuario en
##   el modelo.
#    def similar?
##      true
#    end

##   Este metodo resulve que hace con el dato de la copia en el original.
##   Por defecto, copia el contenido de la copia en el original
#    def asign
##      @original.send("#{att.to_sym}=", @copy.send(att.to_sym))
#    def

##   Este metodo, dice cuando hay que hacer la asigancion. Por defecto,
##   solo lo hace si el original esta vacio.
#    def compare
##      @original.send(att.to_sym).to_s <= "" and att.to_s != "id"
#    end

#    def copy(id)
##      @copy = resource.class.find(id)
##      @original = resource.class.find(params[:id])

##      if similar?
##        #copiar los attributos de la copia en el original si no tienen nada.
##        @original.attributes.keys.each do |att|
##           asing if compare
##        end
##        #copio las relaciones que apuntan a la copia para que apunten al original
##        @copy.class.reflect_on_all_associations(:has_many).collect do |assoc|
##          if @copy.relations.include? assoc.name

##            has_many_array = @copy.send(assoc.name)
##            has_many_array.each do |h|
##              binding.pry
##              h.send("#{resource.class.to_s.downcase}_id=", @original.id)
##              h.save
##            end
##          end
##        end
##      end
##      @original.save
##      @copy.destroy
#    end
## end reemplazo


#    def show
#      #@person = Person.find params[:id] #esto lo hace cancan
#      @versions = @address.versions
#      @address = @address.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular

#    end

#    def create

#      create! do |format|
#        format.html {redirect_to admin_person_path @person}
#      end
#    end

#    def update

#      update! do |format|
#        format.html {redirect_to admin_person_path @person}
#      end
#    end

#  end

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("people")}}

  member_action :history do
    @address = Address.find(params[:id])
    @versions = @address.versions
    render "layouts/history"
  end
end
