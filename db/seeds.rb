# encoding: UTF-8

tdocs=["DNI","CUIT","CUIL","LE","LC","Pasaporte"]
civils=["Soltero","Casado","Divorciado","Viudo"]
sexos=["Masculino","Femenino"]
taddresses=["Particular","Oficina","Legal"]
categories = ['Catastro', 'Urbano']
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

categoria1=["Bodega","Destilería","Elaboración","Tostadero de café","Supermercado"]
categoria2=["Hotel de cuatro estrellas","Fábrica de productos ambientales y uso doméstico","Fábrica de helados","Fábrica de hielo","Fábricas de aditivos alimentarios","Fábrica de papas fritas, bocaditos secos, salados, etc","Cámara frigoríficas","Autoservicio","Fraccionamiento de vinos, cerveza, bebidas, etc."]
categoria3=["Depósito de fideos","Depósito de helados y venta de helados de elaboración foránea","Depósito de productos alimenticios","Depósito de queso","Depósito de bebidas alcohólicas y analcohólicas","Depósito de aditivos","Fraccionamiento de aceites comestibles","Fraccionamiento de golosinas y caramelos","Panaderías","Fraccionamiento de miel",
"Fraccionamiento de aditivos",
"Fraccionamiento de frutas desecadas",
"Fraccionamiento de sal",
"Hoteles de tres estrellas"]
categoria4=[
"Hotel de dos estrellas",
"Bar y confitería",
"Pensión",
"Rotisería",
"Pizzería",
"Fiambrería",
"Transporte de sustancias alimenticias",
"Fábrica de soda en sifones",
"Fábrica de pastas frescas"]
categoria5=[
"Almacen por menos y despensa",
"Almacen menor con despacho de bebidas",
"Carnicería",
"Casa de comidas para llevar",
"Venta de productos de confitería y masitería sin fábrica",
"Hotel de una estrella"]
categoria6=[
"Venta de bizcochos, galletitas dulces",
"Kiosco",
"Venta de leche y derivados",
"Venta de pan y facturas",
"Venta de aves y huevos",
"Venta de pescados",
"Vendedor ambulante",
"Despacho de bebidas",
"Venta de café, té y especias",
"Carribar",
"Venta ambulante de churros",
"Venta ambulante de frutas y verduras",
"Venta ambulante de golosinas",
"Venta ambulante de pescado",
"Venta de bebidas envasadas",
"Venta de hielo",
"Verdulería",
"Repartos"]

puts "** Categoria 1 **"
categoria1.each do |tipo|
  Rubro.find_or_create_by_name(:name => tipo, :sub_rubro => 1)
  puts tipo
end
puts "** Categoria 2 **"
categoria2.each do |tipo|
  Rubro.find_or_create_by_name(:name => tipo, :sub_rubro => 2)
  puts tipo
end
puts "** Categoria 3 **"
categoria3.each do |tipo|
  Rubro.find_or_create_by_name(:name => tipo, :sub_rubro => 3)
  puts tipo
end
puts "** Categoria 4 **"
categoria4.each do |tipo|
  Rubro.find_or_create_by_name(:name => tipo, :sub_rubro => 4)
  puts tipo
end
puts "** Categoria 5 **"
categoria5.each do |tipo|
  Rubro.find_or_create_by_name(:name => tipo, :sub_rubro => 5)
  puts tipo
end
puts "** Categoria 6 **"
categoria6.each do |tipo|
  Rubro.find_or_create_by_name(:name => tipo, :sub_rubro => 6)
  puts tipo
end
