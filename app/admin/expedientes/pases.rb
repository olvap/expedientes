ActiveAdmin.register Pase do
  belongs_to :expediente

  controller do
    load_and_authorize_resource
    skip_load_resource :only => :index
  end

  index do
    column :oficina
    column :entrada
    column :observaciones
    column :created_at
    column :updated_at
    column(:estado) {|order| status_tag(order.estado)  }

    default_actions
  end

  form :partial => "pases/form"

  member_action :imprimir do
    pase = Pase.find params[:id]
    output = PasesReport.new.show(pase)
    send_data output, :filename => "pase.pdf",
                          :type => "application/pdf"
  end

  controller do
    def create
      create! do |format|
        format.html {redirect_to admin_expediente_path @expediente}
      end
    end
  end
end
