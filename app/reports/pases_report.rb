class PasesReport

  def detalle(pase)

    report = ODFReport::Report.new(Rails.root.join("app/reports/pase.odt")) do |r|

      r.add_field(:expediente_id, pase.expediente_id)
      r.add_field(:expediente_partida, pase.expediente_partida)
      r.add_field(:expediente_responsable, pase.expediente_responsable)
      r.add_field(:expediente_nro_expediente, pase.expediente_numero_expediente_colegio)
      r.add_field(:oficina, pase.oficina)
      r.add_field(:expediente_oficina_inicial, pase.expediente_inicio)

      r.add_field(:observaciones, pase.observaciones.gsub( %r{</?[^>]+?>}, '' ))
    end

    report_file_name = report.generate

  end

end
