
# encoding: UTF-8

# Un mejor registro de programas. La salida del último registro fue un poco
# difícil de leer y sería peor entre más métodos anidados recibiera. Sería mucho
# más fácil de leer si sangrara las líneas en los bloques internos. Para
# hacerlo, necesitarás llevar un registro de que tan profundamente anidado te
# encuentras cada vez que el registro quiera escribir algo. Para hacerlo,
# utiliza una variable global, una variable que puedes ver desde cualquier
# parte de tu código. Para crear una variable global, sólo precede el nombre de
# su variable con $, como éstas: $global, $profundidadDeAnidado y
# $chapulinColorado. Al final, tu registro debe presentar algo como esto:
#
# Comenzando «bloque exterior»...
#     Comenzando «algún pequeño bloque»...
#         Comenzando «bloque pequeñito»...
#         ...«bloque pequeñito» terminó, retornando: mucho amor
#     ...«algún pequeño bloque» terminó, retornando: 42
#     Comenzando «un bloque más»...
#     ...«un bloque más» terminó, retornando: ¡Me gusta la comida hindú!
# ...«bloque exterior» terminó, retornando: false

def registrar(descripcion, &bloque)
  puts   ("\t" * $nivel) +
         "Comenzando «" + descripcion + "»..."

  # Aquí el nivel del sangrado es incrementado, el bloque es llamado y el nivel
  # de sangrado regresa a su nivel anterior.
  $nivel = $nivel + 1
  valor  = yield.to_s
  $nivel = $nivel - 1

  # Entonces, se imprime el valor retornado por el bloque.
  puts   ("\t" * $nivel) +
         "...\"" + descripcion + "\"" + " terminó, retornando: " + valor
end

# Los bloques son definidos y registrados unos dentro de otros.
exterior = Proc.new do

  pequenho  = Proc.new do

    pequenhito = Proc.new do
      "mucho amor"
    end

    registrar("bloque pequeñito", &pequenhito)

    5
  end

  another = Proc.new do
    "¡Me gusta la comida tailandesa!"
  end

  registrar("algún pequeño bloque", &pequenho)
  registrar("un bloque más", &another)

  true
end

# El nivel de sangrado inicia en 0 y se registra el bloque «exterior».
$nivel = 0
registrar("bloque exterior", &exterior)
