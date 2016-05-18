=begin

Ejemplo n = 5


tipo 1

*
**
***
****
*****

Tipo 2

*****
****
***
**
*

Tipo 3

*
**
***
****
*****
****
***
**
*

Tipo 4

    *
   ***
  *****
 *******
*********

Tipo 5

*********
 *******
  *****
   ***
    *
Tipo 6

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

Tipo 7

*********
**** ****
***   ***
**     **
*	*

Tipo 8

*       *
**     **
***   ***
**** ****
*********

Tipo 9

*********
**** ****
***   ***
**     **
*       *
**     **
***   ***
**** ****
*********

=end

class Piramides
	def initialize(num,ast,spc)
		@num = num
		@ast = ast
		@spc = spc
	end

	def uno
		puts "\nTipo 1\n\n"
		(1..@num).each do |x|
			puts (@ast*x)
		end
	end

	def dos
		puts "\nTipo 2\n\n"
		(0..(@num-1)).each do |x|
			puts (@ast*(@num-x))
		end
	end

	def tres
		puts "\nTipo 3\n\n"
		(1..@num).each do |x|
			puts (@ast*x)
		end
		(1..(@num-1)).each do |x|
			puts (@ast*(@num-x))
		end
	end

	def cuatro
		puts "\nTipo 4\n\n"
		(1..@num).each do |x| 
			puts ((@spc * (@num-x))+(@ast * (x+x-1))) 
		end 
	end

	def cinco
		puts "\nTipo 5\n\n"
		(0..(@num-1)).each do |x|
			puts (@spc * (x))+(@ast * ((@num-x)+(@num-x-1)))
		end
	end
	def seis
		puts "\nTipo 6\n\n"
		(1..@num).each do |x| 
			puts ((@spc * (@num-x))+(@ast * (x+x-1))) 
		end 
		(1..(@num-1)).each do |x|
			puts (@spc * (x))+(@ast * ((@num-x)+(@num-x-1)))
		end
	end

	def siete
		puts "\nTipo 7\n\n"
		puts (@ast * (@num + (@num-1)))
		(1..(@num-1)).each do |x|
			puts (@ast*(@num-x)) + (@spc * (x+x-1)) + (@ast*(@num-x))
		end
	end

	def ocho
		puts "\nTipo 8\n\n"
		(1..(@num-1)).each do |x|
			puts (@ast * x) + (@spc * (@num+(@num-(x+x+1)))) + (@ast * x)
		end
		puts (@ast * (@num + (@num-1)))
	end

	def nueve
		puts "\nTipo 9\n\n"
		puts (@ast * (@num + (@num-1)))
		(1..(@num-1)).each do |x|
			puts (@ast*(@num-x)) + (@spc * (x+x-1)) + (@ast*(@num-x))
		end
		(2..(@num-1)).each do |x|
			puts (@ast * x) + (@spc * (@num+(@num-(x+x+1)))) + (@ast * x)
		end
		puts (@ast * (@num + (@num-1)))
	end
end

puts "Inserta un número entero" 
num = gets.chomp.to_i
spc = ' ' 
ast = '*' 

piramide = Piramides.new(num,ast,spc)
piramide.uno
piramide.dos
piramide.tres
piramide.cuatro
piramide.cinco
piramide.seis
piramide.siete
piramide.ocho
piramide.nueve