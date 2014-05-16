# Crea la clase Naranjo. Debe tener el método altura que retorna su altura, y el
# método doceMesesDespues, el cual, cuando es llamado, incrementa la edad del
# árbol por un año. Cada año, el árbol debe crecer a lo alto (lo que tú
# consideres que debe crecer un naranjo en un año), y después de cierto número
# de años (de nuevo, a tu criterio) el árbol debe morir. En los primeros años no
# debe producir naranjas, pero después de un poco debe hacerlo, y creo que los
# árboles viejos producen más cada año que los árboles jóvenes… conforme tú
# creas que tiene más sentido. Por supuesto, debes ser capaz de
# contarLasNaranjas (retornando el número de naranjas en el árbol), y
# cortarNaranja (que reduce el número de @naranjas en uno y retorna una cadena
# diciendo que tan deliciosa estaba esa naranja o que no hay más naranjas para
# cortar este año). Asegúrate de que todas las naranjas que no sean cortadas en
# un año, caigan del árbol antes del siguiente año.

class Naranjo

  def initialize(edad_maxima, altura_maxima)
    # Así, el árbol vive un número fijo de años y crece a lo alto un número
    # fijo de centímetros como máximo.
    @edad_maxima   = edad_maxima
    @altura_maxima = altura_maxima

    # Marcas cuando el árbol germina.
    @edad            = 0
    @altura          = 0
    @naranjas        = 0 # Naranjas disponibles este año.
    @naranjas_pasado = 0 # Naranjas que dio el año pasado.
  end

  def doceMesesDespues
    if @edad == @edad_maxima
      puts "Tu árbol se secó lentamente... ahora sólo es un pedazo de madera."
      @naranjas = 0
    else
      @edad = @edad + 1
      # Ahora dejemos que su crecimiento sea un poco aleatorio...
      @altura  = @altura + rand(@altura_maxima / @edad_maxima + 1)
      # ... y que el número de naranjas disponibles este año sea mayor que el que
      # hubo el año anterior (pero sólo si el árbol es mayor de dos años).
      if @edad > 2
        @naranjas = @naranjas_pasado + (rand 7)
      end

      @naranjas_pasado = @naranjas
    end
  end

  def altura
    return @altura
  end

  def contarLasNaranjas
    return @naranjas
  end

  def cortarNaranja
    if @naranjas > 0
      @naranjas = @naranjas - 1
    else
      0
    end
  end
end

# Bien, la clase naranjo está lista. El siguiente código es sólo para hacer
# pruebas no formales de su funcionamiento.

# Definimos un par de constantes para los naranjos.
EDAD_MAXIMA   = 70   # años
ALTURA_MAXIMA = 1500 # centimetros

puts "1) El naranjo puede ser creado teniendo 0 cm de altura y 0 naranjas."
puts "¡Un nuevo naranjo germina!"
arbol = Naranjo.new(EDAD_MAXIMA, ALTURA_MAXIMA)
puts "Altura del árbol: " + arbol.altura.to_s # >> 0
puts "Naranjas en el árbol: " + arbol.contarLasNaranjas.to_s # >> 0
puts

puts "2) El árbol crece un poco cada año:"
puts "Altura del árbol: " + arbol.altura.to_s # >> 0
puts "Un año después..."
arbol.doceMesesDespues
puts "Altura del árbol: " + arbol.altura.to_s # >> n > 0
puts "Un año después..."
arbol.doceMesesDespues
puts "Altura del árbol: " + arbol.altura.to_s # >> m > n
puts "Un año después..."
arbol.doceMesesDespues
puts "Altura del árbol: " + arbol.altura.to_s # >> o > m
puts 

puts "3) El árbol produce más naranjas cada año, excepto los primeros 3 años:"
puts "¡Un nuevo naranjo germina!"
arbol = Naranjo.new(EDAD_MAXIMA, ALTURA_MAXIMA)
puts "Naranjas en el árbol: " + arbol.contarLasNaranjas.to_s # >> 0
puts "Un año después..."
arbol.doceMesesDespues
puts "Naranjas en el árbol: " + arbol.contarLasNaranjas.to_s # >> 0
puts "Un año después..."
arbol.doceMesesDespues
puts "Naranjas en el árbol: " + arbol.contarLasNaranjas.to_s # >> 0
puts "Un año después..."
arbol.doceMesesDespues
puts "Naranjas en el árbol: " + arbol.contarLasNaranjas.to_s # >> n >= 0
puts "Un año después..."
arbol.doceMesesDespues
puts "Naranjas en el árbol: " + arbol.contarLasNaranjas.to_s # >> m >= n >= 0
puts

puts "4) Cortar una naranja reduce en uno el número de naranjas:"
puts "Naranjas en el árbol: " + arbol.contarLasNaranjas.to_s # >> n
puts "Tomamos una naranja del árbol..."
arbol.cortarNaranja
puts "Naranjas en el árbol: " + arbol.contarLasNaranjas.to_s # >> m < n
puts

puts "5) El árbol muere después de 70 años:"
puts "¡Un nuevo naranjo germina!"
arbol = Naranjo.new(EDAD_MAXIMA, ALTURA_MAXIMA)
puts "Movemos el tiempo adelante 70 años..."
(EDAD_MAXIMA + 1).times do
  arbol.doceMesesDespues
end # >> Tu árbol se secó lentamente... ahora sólo es un pedazo de madera.
puts
