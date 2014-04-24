# Escribe un programa con el que puedas interactuar con tu pequeño dragón. Debes
# ser capaz de introducir comandos como alimentar y pasear, y que los métodos
# correspondientes en tu dragón sean llamados. Claro, como lo que tú escribirás
# será sólo texto, necesitarás tener algún tipo de despachador de métodos, donde
# tu programa revise el texto que ha sido introducido y llame el método
# apropiado.

# Código de la clase Dragon ===================================================
class Dragon 

  def initialize nombre
    @nombre          = nombre
    @durmiendo       = false 
    @nivel_estomago  = 10 # Está lleno. 
    @nivel_intestino =  0 # No necesita ir al baño. 
    puts '¡' + @nombre + ' ha nacido!'
  end 

  def alimentar 
    puts 'Alimentas a ' + @nombre + '.'
    @nivel_estomago = 10 # A quedado bien relleno.
    paso_del_tiempo
  end 

  def pasear 
    puts 'Sacas a ' + @nombre + ' a pasear.'
    @nivel_intestino = 0 # No dejará «sorpresas» en la casa.
    paso_del_tiempo
  end 

  def acostar 
    puts 'Llevas a ' + @nombre + ' a la cama.'
    @durmiendo = true 
    3.times do 
      if @durmiendo
        puts @nombre + ' ronca, llenando la habitación con humo.'
        paso_del_tiempo
      end 
    end 
    if @durmiendo
      @durmiendo = false 
      @nombre + ' despierta con calma.'
    end 
  end 

  def alzar 
    puts 'Cargas a ' + @nombre + ' en brazos, alzándolo a lo alto.'
    puts 'Él ríe, quemando tus pestañas.'
    paso_del_tiempo
  end 

  def mecer 
    puts 'Meces a ' + @nombre + ' con gentileza.'
    @durmiendo = true 
    puts 'Él cierra los ojos un momento...'
    paso_del_tiempo
    if @durmiendo
      puts '... pero despierta en cuanto te detienes.'
    end 
  end 

  private
  # «private» significa que los métodos definidos aquí son métodos para uso
  # interno del objeto. (Puedes alimentar a tu dragón, pero no puedes
  # preguntarle si tiene hambre.) 

  def hambriento? 
    # Los nombres de los métodos pueden terminar con «?».
    # Usualmente sólo se nombran así cuando los métodos sólo retornan true o
    # false. De ésta forma: 
    @nivel_estomago  <= 2 
  end 

  def incomodo? 
    @nivel_intestino >= 8 
  end 

  def paso_del_tiempo 
    if @nivel_estomago > 0 
      # Mover comida del estómago al intestino. 
      @nivel_estomago  = @nivel_estomago  - 1 
      @nivel_intestino = @nivel_intestino + 1 
    else 
      # ¡Nuestro dragón muere de hambre! 
      if @durmiendo
        @durmiendo = false 
        puts '¡' + @nombre + ' se levanta repentinamente!'
      end 
      puts '¡' + @nombre + ' muere de hambre! ¡Desesperado, TE DEVORA!'
      exit # Ésto termina el programa. 
    end
    if @nivel_intestino >= 10 
      puts '¡Ooops! ' + @nombre + ' tuvo un accidente...'
      @nivel_intestino = 0 
    end 
    if hambriento?
      if @durmiendo
        @durmiendo = false 
        puts '¡' + @nombre + ' se levanta repentinamente!'
      end 
      puts 'A ' + @nombre + ' le gruñe el estómago...'
    end 
    if incomodo?
      if @durmiendo
        @durmiendo = false 
        puts '¡' + @nombre + ' se levanta repentinamente!'
      end 
      puts @nombre + ' se mueve incómodo de un lado a otro.'
      puts 'Sería buena idea sacarlo a pasear...'
    end 
  end 
end 
# ============================================================================

# Ahora, el código para interactuar con el dragón
puts "Hola. Qué bueno que llegaste a tiempo. ¡Tu dragón está naciendo!"
puts "(Sabes, creo que deberías darle un nombre.)"
print "Name: "
mascota = Dragon.new(gets.chomp)
puts "Tu dragón parece bastante animado."
puts

# El programa termina si liberas al dragón o el dragón te come.
while true
  puts "¿Qué te gustaría hacer?"
  puts "a) Alimentar a tu dragón."
  puts "b) Sacar a pasear a tu dragón."
  puts "c) Acostar a tu dragón en su cama."
  puts "d) Alzar a tu dragón en brazos."
  puts "e) Mecer a tu dragón un poco."
  puts "f) Liberar a tu dragón... :("
  respuesta = gets.chomp

  if respuesta == "a"
    mascota.alimentar
  elsif respuesta == "b"
    mascota.pasear
  elsif respuesta == "c"
    mascota.acostar
  elsif respuesta == "d"
    mascota.alzar
  elsif respuesta == "e"
    mascota.mecer
  elsif respuesta == "f"
    puts "Esperemos que le vaya bien..."
    exit
  else
    puts "Perdón, no comprendí tu respuesta."
  end

  puts
end
