=begin
	
usando vectores, registar los datos de los choferes de la empresa(considere 5) que operan.el administrador de la empresa 
desea que un programa le permita registrar los datos para cada chofer, algunos reciben como pago diario mas de 50 soles 
pero no mas de 100 y otros menos de 50.el problema debe ser resuelto usando una clase principal y una clase que incluya 
los metodos de registrar, imprimir los datos de un chofer buscado por su numero de dni y otro metodo para imprimir todos los datos.

1) dni: 12231545 chofer: juan sueldo: 65
2) dni: 22281547 chofer:luis sueldo: 48
3) dni: 71228845 chofer: paolo sueldo:60
4) dni: 92531585 chofer: carlos sueldo: 45
5) dni: 12631543 chofer: fredy sueldo:52

	
=end


class Chofer
	attr_reader :dni, :nombre, :sueldo
	def initialize(dni,nombre,sueldo)
		@dni = dni
		@nombre = nombre
		@sueldo = sueldo
	end
end

class Plantilla
	def initialize
		@choferes = []
	end

	def registroChofer
		puts "Introduce el nombre del Chofer"
		nombre = gets.chomp
		puts "Introduce su DNI"
		dni = gets.chomp
		puts "Introduce su salario"
		sueldo = gets.chomp
		nombre = Chofer.new(dni,nombre,sueldo)
		@choferes << nombre
	end

	def buscarChofer
		existe = false
		puts "introduce el número de DNI"
		dni = gets.chomp
		@choferes.each do |x|
			if x.dni == dni
				puts "Nombre: #{x.nombre}; DNI: #{x.dni}; Sueldo: #{x.sueldo}"
				existe = true
			end
		end
		if existe == false
			puts "No existe ningún chofer con este DNI asociado"
		end
	end

	def todosChofer
		@choferes.each do |x|
			puts "Nombre: #{x.nombre}; DNI: #{x.dni}; Sueldo: #{x.sueldo}"
		end
	end
end

empresa = Plantilla.new
seguir = true

while seguir
puts "\nQue desea hacer:\n (1) Registro de nuevo Chofer\n (2) Buscar chofer por DNI\n (3) Listado de todos los choferes\n (4) Salir"
entrada = gets.chomp
case entrada
	when '1'
		empresa.registroChofer
	when '2'
		empresa.buscarChofer
	when '3'
		empresa.todosChofer
	when '4'
		seguir = false
	end
end

