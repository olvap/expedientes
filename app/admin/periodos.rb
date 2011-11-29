ActiveAdmin.register Periodo do
  menu :parent => "Deuda"
  
  member_action :generar do
    periodo = Periodo.find(params[:id])
    Tgi.all.each do |tgi|
      Deuda.create(:periodo_id =>params[:id],:tributable_id => tgi.id,:tributable_type => "Tgi")
    end
    redirect_to admin_periodo_path(periodo)
  end

end
