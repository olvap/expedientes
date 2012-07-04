ActiveAdmin.register Periodo do
  menu :parent => "Deuda"

  form do |f|

    f.inputs "Details" do
      f.input :name
      f.input :vencimiento, :as=>:string, :input_html => {:class => 'datepicker',:size=>10}
   end

    f.buttons
  end

  member_action :generar_bromatologia do
    periodo = Periodo.find(params[:id])
    Bromatologia.all.each do |tributo|
      Deuda.create(:periodo_id =>params[:id],:tributable_id => tributo.id,:tributable_type => "Bromatologia")
    end
    redirect_to admin_periodo_path(periodo)
  end

#  member_action :generar do
#    periodo = Periodo.find(params[:id])
#    Tgi.all.each do |tgi|
#      Deuda.create(:periodo_id =>params[:id],:tributable_id => tgi.id,:tributable_type => "Tgi")
#    end
#    redirect_to admin_periodo_path(periodo)
#  end

end
