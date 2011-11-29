ActiveAdmin.register Tributo do
  menu false
  belongs_to :tgi, :singleton => true, :polymorphic => true, :optional => true
  
  controller do
    def show
      @tributo = Tributo.find(params[:id])
    end

    def new
      @tgi = Tgi.find(params[:tgi_id])
      if !@tgi.tributo
        @tributo = Tributo.new
        @tributo.tributable_id = @tgi.id
        @tributo.tributable_type ="Tgi"
        @tributo.save
      else
        @tributo = @tgi.tributo
      end
      redirect_to edit_admin_tgi_tributo_path(@tgi,@tributo)
    end
  end

#  scope :all, :default => true
#  scope :tgi

#  filter :id
#  filter :calle
#  filter :pii
#  filter :responsables_name,:as => :string, :label => "Responsable"
#  filter :titulares_name,:as => :string, :label => "Titular"

#  index do
#    column :id
#    column :ubicacion
#    column :pii
#    default_actions
#  end
#  
  form do |f|

    f.inputs "Details" do
      f.input :calle
      f.input :numero
      f.input :otro
      f.input :pii
      f.input :responsables_tokens,
      :input_html => {
        "data-pre" => f.object.responsables.to_json(:methods => :name), :only => [:id, :name] }
      f.input :titulares_tokens,
      :input_html => {
        "data-pre" => f.object.titulares.to_json(:methods => :name), :only => [:id, :name] }
   end

    f.buttons
  end

  show do
#    div do
#      if !tributo.tgi
#        li "Convertir tributo en:"
#        li link_to "TGI", new_admin_tributo_tgi_path(tributo)
#      end
#    end
#    div(:id => "xtabs") do
#      ul do
#        li link_to "General", "#xtabs-1"
#        li link_to "Tgi", "#xtabs-2" if tributo.tgi
#      end
#      div(:id=> "xtabs-1") do
        attributes_table_for tributo,
          :id, :ubicacion, :pii, :address, :created_at, :updated_at

        panel "Responsables" do
          table_for tributo.responsables do
            column{ |a| link_to a.name, admin_person_path(a) }
          end
        end


        panel "Titulares" do
          table_for tributo.titulares do
            column{ |a| link_to a.name, admin_person_path(a) }
          end
        end
      end      
#      if tributo.tgi
#        div(:id => "xtabs-2") do
#          h3 "Datos Fijos"
#          attributes_table_for tributo.tgi,
#            :id, :manzana_id, :seccion_inmueble, :superficie, :seccion,
#            :lote, :folio, :tomo, :inscripcion_dominio, :fecha, :parcela
#          div do
#            #link_to("Editar", edit_admin_tributo_tgi_path(tributo,tributo.tgi)) 
#          end
#          panel "avaluos" do
#            table_for tributo.tgi.avaluos do
#              column :valor
#              column :descuento
#              column :edificacion 
#              column :estado
#              column :categoria
#              column :metros
#              column :created_at
#              column{ |a| link_to "editar",edit_admin_tgi_avaluo_path(a.tgi,a) }
#              column{ |a| link_to "frentes",admin_avaluo_frentes_path(a) }
#            end
#            link_to "Nuevo", new_admin_tgi_avaluo_path(tributo.tgi)
#          end
#        end
#      end
#    end
#  end

  member_action :correo, :method => :get do
    @tributo = Tributo.find(params[:id])
  end
end
