ActiveAdmin.register Convenio do
  belongs_to :tgi, :optional => true
  menu false
  show do
    attributes_table_for convenio,
      :id, :tributable_type, :tributable_id, :inicio,
      :cuotas, :interes,:deuda_count,:deuda_desde,:deuda_hasta

  end

  form do |f|
    f.inputs "Detalles" do
      f.input :inicio
      f.input :cuotas
      f.input :interes

      f.input :deudas, :as => :check_boxes, :collection => f.object.tributable.deudas
    end
    f.buttons
  end

end
