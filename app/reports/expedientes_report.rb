class ExpedientesReport
  def detalle(params)

    @expediente = Expediente.find(params[:id])

    report = ODFReport::Report.new(Rails.root.join("app/reports/expediente.odt")) do |r|

      r.add_field(:id,         @expediente.id.to_s)
      r.add_field(:responsable, @expediente.responsable.to_s)

      r.add_section "PASES", @expediente.pases do |s|
        s.add_field(:oficina) { |pase| pase.oficina }
        s.add_field(:observacion) { |pase| pase.observaciones.gsub( %r{</?[^>]+?>}, '' ) }
        s.add_field(:entrada) { |pase| pase.entrada }
      end

    end

    report_file_name = report.generate

  end

end
