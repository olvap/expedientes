ActiveAdmin.register Oficina,:as => "oficina" do

  menu :if => proc{ can?(:read, Oficina) }, :parent => "Comunes"

  controller.authorize_resource

  controller do

    def show
      @pases = []
      @oficina = Oficina.find(params[:id])
      @oficina.catastros.each{|c| @pases = @pases + [c.pases.last] if c.pases.last.oficina == @oficina }
      show!
    end

  end
  show :title => :name do
    panel oficina.name do
      table_for(pases) do |t|
        t.column(:catastro_id){|pase| link_to pase.catastro_id, admin_catastro_path(pase.catastro)}
        t.column {|pase| pase.catastro.partida}
        t.column {|pase| pase.catastro.responsable}
        t.column(:estado) {|order| status_tag(order.try(:estado))  }
        t.column(:entrada)
        t.column(:observaciones)
      end
    end

  end
end
