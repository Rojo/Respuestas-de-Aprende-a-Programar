# El reloj del abuelo: Escribe un método que reciba un bloque y lo llame por
# cada hora que ha pasado el día de hoy. De esa forma, si yo le pasara el bloque
# do puts '¡DONG!' end, repicaría como un reloj de péndulo. Prueba tu método con
# unos cuantos bloques diferentes (incluyendo el que acabo de darte).
# Pista: Puedes usar Time.now.hora para obtener la hora actual. Pero esto
# devuelve un número entre 0 y 23, así que tienes que alterar esos números para
# obtener números comunes en la carátula de un reloj (del 1 a 12).

def reloj &bloque
  hora = Time.now.hour

  # Se convierte la hora actual en su equivalente a la que indica un reloj con
  # carátula de 12 horas.
  if hora == 0
    hora = 12
  elsif hora > 12
    hora = hora % 12
  end

  hora.times do | n |
  # Se pasa el número de la hora actual al bloque (por si lo utiliza para algo)
  # sumándole 1 porque .times comienza a contar desde 0.
    yield n + 1
  end
end

# Bloque que imprime «¡DONG! » cada vez que es llamado.
reloj do
  print "¡DONG! "
end

puts

# Bloque que imprime el contenido de cualquier «n» variable que se le pasa
# cuando es llamado.
reloj do | n |
  print n.to_s + " "
end

puts

# Bloque que añade a un contador todos los dígitos de las horas que han pasado
# en la caratula del reloj.
@contador = 0
reloj do | n |
  @contador = @contador + n
end

puts @contador
