  
# ¡Feliz cumpleaños!
# Pregunta en qué año nació una persona, después el mes y por último el día.
# Averigua su edad y dales una ¡NALGADA! Por cada cumpleaños que han tenido.

puts  "¡Hola! Permíteme hacer la cuenta de cuántos años tienes."
print "¿En qué año naciste? "
anho  = gets.chomp.to_i
print "¿En qué mes? (del 1 al 12): "
mes   = gets.chomp.to_i
print "¿En qué día del mes? (del 1 al 31): "
dia   = gets.chomp.to_i

nacimiento = Time.new(anho, mes, dia)
edad       = (Time.now - nacimiento) / 31536000 # Segundos en un año.

puts "¿Así que tienes " + edad.to_i.to_s + " años? ¡Vamos a divertirnos de forma"
puts "tradicional! *te recuesto boca abajo sobre mis rodillas* "

edad.to_i.times do
  print "¡NALGADA! "
end

puts
puts "Fue divertido, ¿no es así? Algunas tradiciones no deben morir. :)"
