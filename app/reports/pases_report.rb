require "layouts/header.rb"
require 'prawnbot'

class PasesReport < Prawnbot::Report

  def initialize
    super
    @header_title = "MUNICIPALIDAD DE LA CIUDAD DE CORONDA"
    @header_subtitle = "Catastro y edificaciones privadas"

    @logo = "#{Rails.root}/app/assets/images/logo.png"
    @water_print = "#{Rails.root}/app/assets/images/water_mark.png"

  end

  def show(pase)
    body

    show_title "DETALLE DE PASE"

    show_title "#{pase.catastro.category.name} N: #{pase.catastro.id} "

    myform([
      "<b>Partida</b> #{pase.catastro.partida}",
      "<b>Responsanble</b> #{pase.catastro.responsable}",
      "<b>Numero de expediente</b> #{pase.catastro.numero_expediente_colegio}",
      "<b>Convenio</b> #{pase.catastro.convenio_id}",

      "<b>Importe</b> #{pase.catastro.importe}"])


    show_title "<b>Oficina actual</b> #{pase.catastro.oficina.name}"

    mybox(pase.observaciones)

    render
  end
end
