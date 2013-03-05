class BromatologiasReport

  def formulario deudas
    report = ODFReport::Report.new(Rails.root.join("app", "reports", "bromatolgias_formulario.odt")) do |r|
      r.add_section "CUOTA", deudas do |s|
          s.add_field(:cuenta)      { |item| item.tributable_id.to_s }
          s.add_field(:periodo)     { |item| item.periodo_name.to_s }
          s.add_field(:categoria)   { |item| item.tributable.try(:negocios).try(:first).try(:rubro).try(:sub_rubro).to_s }
          s.add_field(:vencimiento) { |item| item.periodo_vencimiento.to_s }
          s.add_field(:responsable) { |item| item.tributable_person_name.to_s }
          s.add_field(:ubicacion)   { |item| item.tributable_address.try(:format).to_s }
          s.add_field(:importe)     { |item| item.try(:calcular_deuda).to_s }
          s.add_field(:nombre) { |item| item.tributable.try(:negocios).try(:first).try(:name).to_s }
          s.add_field(:negocio) { |item| item.tributable.try(:negocios).try(:first).try(:rubro).try(:name).to_s[0..50] }
          s.add_field(:rubro) { |item| item.tributable.try(:negocios).try(:first).try(:rubro).try(:id).to_s }

          s.add_field(:cb)          { |item| item.obtener_codigo.to_s }
      end
    end


    report.generate
  end


end
