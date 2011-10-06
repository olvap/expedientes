tdocs=["DNI","CUIT","CUIL","LE","LC","Pasaporte"]

tdocs.each do |tdoc|
  Personas::Tdoc.find_or_create_by_name(tdoc)
end 

civils=["Soltero","Casado","Divorciado","Viudo"]

civils.each do |civil|
  Personas::Civil.find_or_create_by_name(civil)
end

sexos=["Masculino","Femenino"]

sexos.each do |sexo|
  Personas::Sexo.find_or_create_by_name(sexo)
end

taddresses=["Particular","Oficina"]

taddresses.each do |taddress|
  Personas::Taddress.find_or_create_by_name(taddress)
end
