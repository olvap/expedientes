ActiveAdmin.register Expedientes::Pase, :as => "pase" do
  belongs_to :catastro

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

  form do |f|

      f.inputs "Details" do
        f.input :oficina,:label=>f.semantic_errors
        f.input :entrada, :as=>:string, :input_html => {:class => 'datepicker',:size=>10}
        f.input :observaciones
      end
      f.buttons

  end

  controller do
    def create
      create! do |format|
        format.html {redirect_to admin_catastro_path @catastro}
      end
    end
  end
end
