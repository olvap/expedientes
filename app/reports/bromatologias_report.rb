class BromatologiasReport

  def formulario deudas
    report = ODFReport::Report.new(Rails.root.join("app", "reports", "bromatolgias_formulario.odt")) do |r|
      r.add_section "CUOTA", deudas do |s|
        s.add_field(:cuenta)      { |item| item.id.to_s }
        s.add_field(:periodo)     { |item| item.periodo_name.to_s }
        s.add_field(:vencimiento) { |item| item.periodo_vencimiento.to_s }
        s.add_field(:responsable) { |item| item.tributable_person_name  .to_s }
        s.add_field(:ubicacion)   { |item| item.tributable_address.try(:format).to_s }
        s.add_field(:importe)     { |item| item.calcular_deuda.to_s }
        s.add_field(:nombre) { |item| item.tributable.negocios.first.name.to_s }
        s.add_field(:negocio) { |item| item.tributable.negocios.first.rubro.name[0..20].to_s }
        s.add_field(:rubro) { |item| item.tributable.negocios.first.rubro.id.to_s }

        s.add_field(:cb)          { |item| item.obtener_codigo.to_s }
      end
    end


    report.generate
  end


end
