ActiveAdmin.register Tgi do
  menu :parent => "Tributo"

  menu :if => proc{ can?(:manage, Tgi) }

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index
  end

  filter :id
  filter :pii, :as => :string
#  filter :tributo_responsables_name,:as => :string, :label => "Responsables"
#  filter :tributo_titulares_name,:as => :string, :label => "Titulares"

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("people")}}

  index do
    column :id
    column :pii
    column :responsable
    column :titular
    default_actions
  end

  member_action :calcular do
    tgi = Tgi.find(params[:id])
#    deudas = tgi.deudas.find(:all,:conditions =>[""],:periodo_name_gte => params[:deuda][:periodo_desde], :periodo_name_lte => params[:deuda][:periodo_hasta])
    deudas = tgi.deudas.find(:all, :include => :periodo, :conditions => ["periodos.name >= ? and periodos.name <= ?",params[:deuda][:periodo_desde], params[:deuda][:periodo_hasta]])
    deudas.each do |deuda|
      deuda.motivo=params[:deuda][:motivo]
      deuda.send(params[:deuda][:accion])
    end
    redirect_to admin_tgi_path(tgi)
  end


  member_action :generar do
    tgi = Tgi.find(params[:id])
    tgi.generar
    redirect_to admin_tgi_path(tgi)
  end

  controller do

    def show
      @tgi = Tgi.find(params[:id])
      @versions = @tgi.versions
      @tgi = @tgi.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular
      #@version = @tgi
    end
  end

  form do |f|
    f.inputs "Details" do
      f.inputs :pii, :calle, :numero, :otro,
        :responsable, :titular,
        :seccion_inmueble, :manzana,
        :seccion, :lote,:superficie,
        :folio, :tomo, :inscripcion_dominio, :fecha, :parcela
    end
    f.buttons
  end

  show do
    div(:id => "xtabs") do
      ul do
        li link_to "Detalles", "#xtabs-1"
        li link_to "Avaluo", "#xtabs-2"
#        li link_to "Deuda", "#xtabs-3"
      end
      div(:id=> "xtabs-1") do

        attributes_table_for tgi,
          :id, :pii, :ubicacion, :responsable, :titular,
          :address, :seccion_inmueble, :manzana,:superficie,
          :seccion, :lote, :folio, :tomo, :inscripcion_dominio, :fecha, :parcela
      end

      div(:id=> "xtabs-2") do
        if tgi.avaluos.last
          attributes_table_for tgi.avaluos.last,
            :valor, :descuento, :estado, :edificacion, :categoria, :metros
          panel "frentes" do
            table_for tgi.avaluos.last.frentes do
              column :categoria
              column :metros
            end
          end
        end
        link_to "Administrar", admin_tgi_avaluos_path(tgi)
      end

# Habilitar esto cuando ponga la deuda

#      div(:id=> "xtabs-3") do
#        panel "Deudas" do
#          table_for tgi.deudas do
#            column :name
#            column :motivo
#            column :baja
#            end
#          link_to "Generar deuda completa", generar_admin_tgi_path(tgi)
#        end

#        panel "Deuda" do
#          semantic_form_for "deuda",:url =>{ :action=> :calcular }, :method => :get do |f|
#            f.inputs "ABM" do
#              f.input(:periodo_desde) +
#              f.input(:periodo_hasta) +
#              f.input(:accion, :as => :radio, :collection => ["actualizar", "borrar"]) +
#              f.input(:motivo) +
#              f.buttons
#            end
#          end
#        end

#        link_to "Administrar", admin_tgi_deudas_path(tgi)
#      end
    end
  end

  member_action :correo, :method => :get do
    @tgi = Tgi.find(params[:id])
  end

  member_action :history do
    @tgi = Tgi.find(params[:id])
    @versions = @tgi.versions
    render "layouts/history"
  end

end
