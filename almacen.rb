=begin
Crear un programa que permita:
Registrar 1 producto (nombre, precio, cantidad en almacén) 
Luego ingresar la cantidad a vender.
Si la cantidad a vender supera la docena, este debe realizar un descuento del 10%, si 
supera las 2 docenas debe realizar un descuento del 20%. 
Luego mostrar el total a pagar.
Disminuir la cantidad en almacén por la venta realizada.
Mostrar la cantidad actual del almacén.
Debe permitir realizar más ventas con el mismo producto ingresado 
(mediante una consulta al usuario)
=end


class TiendaVenta
	def initialize(unidades,producto)
		@unidades = unidades
		@producto = producto
	end

	def venta
		if @unidades <= 12
			cuenta = @producto.precio * @unidades
		elsif @unidades > 12 && @unidades <= 24
			cuenta = 0.9 * (@producto.precio * @unidades)
		elsif @unidades > 24
			cuenta = 0.8 * (@producto.precio * @unidades)
		end
		puts "El precio de #{@unidades} unidades de #{@producto.nombre} es: #{'%.2f' % cuenta} €"
		stockalmacen
	end

	def stockalmacen
		@producto.stock -= @unidades
	end
end

class Producto
	attr_reader :nombre, :precio, :stock
	attr_writer :stock
	def initialize(nombre,precio,stock)
		@nombre = nombre
		@precio = precio
		@stock = stock
	end
end

puts "\nALMACENAJE"
puts "Indica el nombre del producto:"
producto = gets.chomp
puts "Indica su precio de venta (€):"
precio = gets.chomp.to_f
puts "Indica la cantidad:"
stock = gets.chomp.to_i

producto = Producto.new(producto,precio,stock)

vender = true
puts "\nVENTA"
while vender

puts "Indica las unidades de #{producto.nombre} que quieres comprar:"
unidades = gets.chomp.to_i

supermercado = TiendaVenta.new(unidades,producto)
supermercado.venta

puts "\nQuedan #{producto.stock} unidades de #{producto.nombre} en el almacen"
puts "Deseas hacer otra compra?Si/No"
otra = gets.chomp

unless otra.upcase == 'SI' || otra.upcase == 'S'
	vender = false
end

end

