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
