ActiveAdmin.register Oficina,:as => "oficina" do
  menu :parent => "Comunes"
  show :title => :name do
    panel oficina.name do
      table_for(oficina.pases) do |t|
        t.column(:catastro)
        t.column(:estado) {|order| status_tag(order.estado)  }
        t.column(:created_at)
        t.column(:updated_at)
      end
    end

  end
end
