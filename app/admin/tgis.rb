ActiveAdmin.register Tgi do
  menu :parent => "Tributo"
  controller.authorize_resource 
  
  filter :id
  filter :tributo_pii, :as => :string
  filter :tributo_responsables_name,:as => :string, :label => "Responsables"
  filter :tributo_titulares_name,:as => :string, :label => "Titulares"

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("people")}}
  
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
      @tgi = @person.versions[params[:version].to_i].reify if params[:version] #si se pide una version en particular
      #@version = @tgi
    end
    
    def create

      create! do |format|
        format.html {redirect_to new_admin_tgi_tributo_path @tgi}
      end
    end
  end

  form do |f| 
    f.inputs "Details" do
      f.inputs :seccion_inmueble, :manzana,:superficie,
        :seccion, :lote, :folio, :tomo, :inscripcion_dominio, :fecha, :parcela
    end
    f.buttons
  end
  
  show do
    div(:id => "xtabs") do
      ul do
        li link_to "Detalles", "#xtabs-1"
        li link_to "Tributo", "#xtabs-4"
        li link_to "Avaluo", "#xtabs-2"
        li link_to "Deuda", "#xtabs-3"
      end
      div(:id=> "xtabs-1") do
      
        attributes_table_for tgi,
          :id, :seccion_inmueble, :manzana,:superficie,
            :seccion, :lote, :folio, :tomo, :inscripcion_dominio, :fecha, :parcela
      end

      div(:id=> "xtabs-4") do
        if tgi.tributo      
          attributes_table_for tgi.tributo,
            :id, :ubicacion, :pii, :address, :created_at, :updated_at

          panel "Responsables" do
            table_for tgi.tributo.responsables do
              column{ |a| link_to a.name, admin_person_path(a) }
            end
          end


          panel "Titulares" do
            table_for tgi.tributo.titulares do
              column{ |a| link_to a.name, admin_person_path(a) }
            end
          end
        end
        link_to "Editar", new_admin_tgi_tributo_path(tgi)
      end

      div(:id=> "xtabs-2") do
        if tgi.avaluos.last
          attributes_table_for tgi.avaluos.last,
            :valor, :descuento, :estado, :edificacion
          panel "frentes" do
            table_for tgi.avaluos.last.frentes do
              column :categoria
              column :metros
            end
          end
        end
        link_to "Administrar", admin_tgi_avaluos_path(tgi)
      end
      div(:id=> "xtabs-3") do
        panel "Deudas" do
          table_for tgi.deudas do 
            column :periodo
            column :motivo
            column :baja
            column do "dskljsdlfj" end
            end
          link_to "Generar deuda completa", generar_admin_tgi_path(tgi)
        end
        
        panel "Deuda" do
          semantic_form_for "deuda",:url =>{ :action=> :calcular }, :method => :get do |f|
            f.inputs "ABM" do
              f.input(:periodo_desde) +
              f.input(:periodo_hasta) +
              f.input(:accion, :as => :radio, :collection => ["actualizar", "borrar"]) +
              f.input(:motivo) +
              f.buttons
            end
          end
        end
        
        link_to "Administrar", admin_tgi_deudas_path(tgi)
      end
    end
  end

end
