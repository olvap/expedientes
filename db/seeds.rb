tdocs=["DNI","CUIT","CUIL","LE","LC","Pasaporte"]
civils=["Soltero","Casado","Divorciado","Viudo"]
sexos=["Masculino","Femenino"]
taddresses=["Particular","Oficina","Legal"]
categories = ['Catastro', 'Urbano']
oficinas = ['Catastro','Planeamiento urbano','Profesional','Archivo']
forums = ['Ayuda']
edificaciones =['Baldio','Edificado','Parcela','Municipal']
estados = ['Normal','Baja','Excento']

puts "** Edificaciones **"
edificaciones.each do |tipo|
  Edificacion.find_or_create_by_name(tipo)
  puts tipo
end

puts "** Estados **"
estados.each do |tipo|
  Estado.find_or_create_by_name(tipo)
  puts tipo
end

puts "** Foros **"
forums.each do |tipo|
  Forum.find_or_create_by_name(tipo)
  puts tipo
end

puts "** Oficinas **"
oficinas.each do |tipo|
  Oficina.find_or_create_by_name(tipo)
  puts tipo
end

puts "** Tipo de documentos **"
tdocs.each do |tipo|
  Tdoc.find_or_create_by_name(tipo)
  puts tipo
end

puts "** Tipo de sexo **"
sexos.each do |tipo|
  Sexo.find_or_create_by_name(tipo)
  puts tipo
end


puts "** Tipo de direccion **"
taddresses.each do |tipo|
  Taddress.find_or_create_by_name(tipo)
  puts tipo
end


puts "** Tipo de estados civiles **"
civils.each do |tipo|
  Civil.find_or_create_by_name tipo
  puts tipo
end

puts "** Tipo de contactos **"
taddresses.each do |tipo|
  Taddress.find_or_create_by_name tipo
  puts tipo
end

puts "** Tipo de expedientes **"
categories.each do |tipo|
  Category.find_or_create_by_name tipo
  puts tipo
end
