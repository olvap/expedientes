ActiveAdmin.register Deuda do
  menu :parent => "Deuda"

  before_filter :only => :index do |controller|
    @per_page = 9999 if ['application/pdf'].include?(request.format)
  end
  #menu :if => proc{ can?(:manage, Deuda) }
  controller.authorize_resource

  controller do
    respond_to :html, :xml, :json, :pdf

    def index(options={}, &block)
      super(options) do |format|
        block.call(format) if block
        format.pdf {
          report = BromatologiasReport.new.formulario @deudas

          send_file(report)
        }
      end
    end
  end
  belongs_to :tgi, :optional => true

  sidebar :versionado, :partial => "layouts/version", :only => :show

  sidebar :Ayuda, {:partial => "layouts/help",:local => {:topic => Topic.find_by_name("people")}}

  member_action :actualizar do
  end

  member_action :borrar do
  end

  filter :periodo_name, :as => :string
  filter :tributable_type

  index do
    column :tributable_type
    column :periodo_name
    column :calcular_deuda
    column :actualiazada
    column :baja
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
