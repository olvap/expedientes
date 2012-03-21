class ConvertDireAndLocalidadBackEnAddress < ActiveRecord::Migration
  def up
    errores = Array.new
    tgis = Tgi.all
    tgis.each do |tgi|
      #arreglar que algunos no tienen responsables
      resp = tgi.responsable
      if resp
        address = tgi.responsable.addresses.where(:other => tgi.direi_back).first if resp
        unless address
        address = Address.new(
          {:localidad_id => tgi.localidad_back_id,
           :person_id => tgi.responsable.id,
           :other => tgi.direi_back
          })
        address.save
        end
        tgi.address = address
        tgi.save
        puts tgi.id
      else
        errores.insert tgi.id
      end
    end

    puts "estos se cargaron mal"
    puts errores

  end

  def down
  end
end
