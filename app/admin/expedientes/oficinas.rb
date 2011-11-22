ActiveAdmin.register Oficina,:as => "oficina" do

  show :as => :block do |oficina|

    panel oficina.name do
      table_for(oficina.pases) do |t|
        t.column(:expediente)
        t.column(:estado) {|order| status_tag(order.estado)  }
#        t.column(:final_de_obra)
#        t.column(:partida)
#        t.column(:pase)
        t.column(:created_at)
        t.column(:updated_at)
   #     t.column("last Post") {|item| item.last_post }
        #tr :class => "odd" do
        #  td "Total:", :style => "text-align: right;"
        #  td number_to_currency(order.total_price)
        #end
      end
    end
  end
end
