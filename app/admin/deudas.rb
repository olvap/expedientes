ActiveAdmin.register Deuda do
  menu :parent => "Deuda"
  #menu :if => proc{ can?(:manage, Deuda) }     
  controller.authorize_resource 
  
  belongs_to :tgi, :optional => true

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("people")}}

  member_action :actualizar do
  end

  member_action :borrar do
  end

  member_action :generar do
    periodos = Periodo.where("id >= ? and id <= ?",params[:periodo_desde],params[:periodo_hasta])

    periodos.each do |periodo|

      Tgi.where("id >= ? and id <= ?",params[:tgi_desde], params[:tgi_hasta]).each do |tgi|
        Deuda.create(:periodo_id => periodo.id,:tributable_id => tgi.id)
      end

    end

    redirect_to admin_deudas_path
  end

end
