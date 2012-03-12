require "layouts/header.rb"
require "layouts/commons.rb"
include Header
include Commons

class PasesReport < Prawn::Document
  def show(pase)
    header_prawn("Municipalidad de Coronda")

#arriba, subrayado y destacado con otra letra  Munucipalidad de Coronda, abajo Responsable y Partida/s Inmobiliarias, la Oficina, la Fecha y abajo los comentarios, Todo eso si es posible comprimirlo para que salga impreso en la mitad de una hoja
    form({:ID => pase.id,
          :EXPEDIENTE => pase.catastro.id,
          :RESPONSABLE => pase.catastro.responsable,
          :PARTIDA => pase.catastro.partida,
          :FECHA => pase.entrada,
          :OFICINA => pase.oficina.name,
          :OBSERVADO => pase.observaciones
        },
          [20, bounds.top - 30])

    render
  end
end
