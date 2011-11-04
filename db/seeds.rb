tdocs=["DNI","CUIT","CUIL","LE","LC","Pasaporte"]
civils=["Soltero","Casado","Divorciado","Viudo"]
sexos=["Masculino","Femenino"]
taddresses=["Particular","Oficina"]
categories = ['Catastro', 'Urbano']
oficinas = ['Catastro','Planeamiento urbano','Profesional','Archivo']

puts "** Oficinas **"
oficinas.each do |tipo|
  Expedientes::Oficina.find_or_create_by_name(tipo)
  puts tipo
end

puts "** Tipo de documentos **"
tdocs.each do |tipo|
  Personas::Tdoc.find_or_create_by_name(tipo)
  puts tipo
end

puts "** Tipo de sexo **"
sexos.each do |tipo|
  Personas::Sexo.find_or_create_by_name(tipo)
  puts tipo
end


puts "** Tipo de direccion **"
taddresses.each do |tipo|
  Personas::Taddress.find_or_create_by_name(tipo)
  puts tipo
end


puts "** Tipo de estados civiles **"
civils.each do |tipo|
  Personas::Civil.find_or_create_by_name tipo
  puts tipo
end

puts "** Tipo de contactos **"
taddresses.each do |tipo|
  Personas::Taddress.find_or_create_by_name tipo
  puts tipo
end

puts "** Tipo de expedientes **"
categories.each do |tipo|
  Category.find_or_create_by_name tipo
  puts tipo
end
