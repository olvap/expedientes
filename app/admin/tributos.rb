ActiveAdmin.register Tributo do
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
    div(:id => "xtabs") do
      ul do
        li link_to "General", "#xtabs-1"
        li link_to "Tgi", "#xtabs-2"
        li link_to "Variables", "#xtabs-3"
      end
      div(:id=> "xtabs-1") do
        attributes_table_for tributo,
          :id, :calle, :numero, :otro, :pii, :address, :created_at, :updated_at
        
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
      
      div(:id => "xtabs-2") do
        attributes_table_for tributo.tgi,
          :id, :manzana_id, :seccion_inmueble, :superficie, :seccion,
          :lote, :folio, :tomo, :inscripcion_dominio, :fecha, :parcela
      end
      
      div(:id => "xtabs-3") do

        attributes_table_for tributo.tgi.tgivariables.last,
          :avaluo, :descuento, :estado, :edificacion
        link_to "Administrar", admin_tgi_tgivariables_path(tributo.tgi)
      end
    end
  end

  member_action :correo, :method => :get do
    @tributo = Tributo.find(params[:id])
  end
end
