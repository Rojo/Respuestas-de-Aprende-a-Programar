# Registro de programas. Escribe un método llamado registro, que toma una cadena
# como descripción de un bloque y, por supuesto, un bloque, además de otra
# cadena al final, diciendo que ha terminado el bloque. De forma similar a
# algoImportante, debe poner una cadena diciendo que ha comenzado el bloque y
# otra cadena al final indicando que ha terminado el bloque, indicando lo que el
# bloque retornó. Prueba tu método enviándole un bloque de código. Dentro de ese
# bloque, coloca otra llamada a registro, pasando otro bloque. (Esto es llamado
# anidar.) En otras palabras, tu salida debe verse de forma similar a ésta:
#
# Comenzando «bloque exterior»...
# Comenzando «algún pequeño bloque»...
# ...«algún pequeño bloque» terminó, retornando: 5
# Comenzando «un bloque más»...
# ...«un bloque más» terminó, retornando: ¡Me gusta la comida tailandesa!
# ...«bloque exterior» terminó, retornando: false

def registrar(descripcion, &bloque)
  puts  "Comenzando «" + descripcion + "»..."
  valor = yield.to_s
  puts  "...«" + descripcion + "» terminó, retornando: " + valor
end

exterior = Proc.new do
  pequenho  = Proc.new do
    5
  end

  otro = Proc.new do
    "¡Me gusta la comida tailandesa!"
  end

  registrar("algún pequeño bloque", &pequenho)
  registrar("un bloque más", &otro)

  false
end

registrar("bloque exterior", &exterior)
