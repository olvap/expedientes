require "layouts/header.rb"
require 'prawnbot'

class PasesReport < Prawnbot::Report

  def initialize
    super
    @header_title = "MUNICIPALIDAD DE LA CIUDAD DE CORONDA"
    @header_subtitle = "Sistema de expedientes"

    @logo = "#{Rails.root}/app/assets/images/logo.png"
    @water_print = "#{Rails.root}/app/assets/images/water_mark.png"

  end

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

  def show(pase)
    self.font_size = 10
    body

    show_title "DETALLE DE PASE"

    show_title "#{pase.expediente.inicio.name} N: #{pase.expediente.id} "

    myform([
      "<b>Partida</b> #{pase.expediente.partida}",
      "<b>Responsanble</b> #{pase.expediente.responsable}",
      "<b>Numero de expediente</b> #{pase.expediente.numero_expediente_colegio}",
      "<b>Convenio</b> #{pase.expediente.convenio_id}",

      "<b>Importe</b> #{pase.expediente.importe}"])


    show_title "<b>Oficina actual</b> #{pase.expediente.oficina.name}"

    mybox(pase.observaciones)

    render
  end
end
