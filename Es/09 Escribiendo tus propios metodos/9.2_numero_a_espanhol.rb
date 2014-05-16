
# encoding: UTF-8

# Expande numero_a_espanol una vez más. Haz que ahora pueda manejar millones
# para obtener 'un millón' en lugar de 'un mil mil'. Después intenta agregar
# millardos, billones, trillones… ¿Hasta dónde puedes llegar?

def numero_a_espanol numero
  if numero < 0  # No aceptamos números negativos.
    return 'Lo siento, el programa no maneja números negativos.'
  end
  if numero == 0
    return 'cero'
  end

  texto = '' # Ésta es la cadena que vamos a devolver.

  if numero > 99
    # Sección para números desde 100 y superiores #############################

    # Usamos un arreglo de arreglos para relacionar las etiquetas desde
    # "cientos" hasta la magnitud que se desee manejar.
    # Cada arreglo interior es una tercia de un número escrito en notación
    # exponencial (1e2 es lo mismo que 1 segido por 2 ceros o 100), el nombre
    # en plural y el nombre en singular que le corresponden a su magnitud. Con
    # esto, se pueden agregar más magnitudes de una manera sencilla. to_i se usa
    # para trabajar sólo con enteros.

    etiquetas = [
      [1e24.to_i, 'cuatrillones', 'cuatrillón'],
      [1e18.to_i, 'trillones'   , 'trillón'   ],
      [1e12.to_i, 'billones'    , 'billón'    ],
      [1e9.to_i , 'millardos'   , 'millardo'  ],
      [1e6.to_i , 'millones'    , 'millón'    ],
      [1e3.to_i , 'mil'         , 'mil'       ],
      [1e2.to_i , 'cien'        ] # Las centenas son un caso especial.
    ]

    # Este arreglo contiene los casos especiales para las centenas.
    centenas = [
      'cien', 'doscientos', 'trescientos', 'cuatrocientos', 'quinientos',
      'seiscientos', 'setecientos', 'ochocientos', 'novecientos'
    ]

    # «restante» es lo que nos falta por escribir del número.
    # «actual» es la parte que vamos a escribir ahora.
    # «restante» y «actual» ¿Está claro? :)
    restante = numero

    # Comenzando por la magnitud más alta en «etiquetas», cada una es probada
    # para ver si su etiqueta puede ser escrita.
    etiquetas.each do | etiqueta |
      if restante / etiqueta[0] > 0
        # Obtenemos la parte que será escrita...
        actual   = restante / etiqueta[0]
        # ...y la removemos del restante.
        restante = restante - actual * etiqueta[0]

        if etiqueta[1] == 'cien'
          # Si se llega a la centenas, se escriben los casos especiales.
          texto = texto + centenas[actual - 1]

          if actual == 1 and restante > 0
            texto = texto + 'to'
          end
        else
          if actual == 1
            # Si lo que vamos a escribir es un «uno» seguido de sustantivo
            # masculino, se usa la forma apocopada: http://goo.gl/a0zaOk
            texto = texto + 'un ' + etiqueta[2]
          elsif actual == 21
            # Si lo que vamos a escribir es un «veintiuno» seguido de sustantivo
            # masculino, se usa la forma apocopada.
            texto = texto + 'veintiún ' + etiqueta[2]
          else
            # Se hace una llamada recursiva para la parte que será escrita y se
            # le agrega la etiqueta de magnitud.
            texto = texto + numero_a_espanol(actual) + ' ' + etiqueta[1]
          end
        end

        # Si hay algo restante, se procesa y se limpia.
        if restante > 0
          texto    = texto + ' ' + numero_a_espanol(restante)
          restante = 0
        end
      end
    end
  else
    # Sección para números menores a 100 ######################################
    # Se llama a numero_pequenho para que se haga cargo de esos números.
    texto = texto + numero_pequenho(numero)
  end

  # Ahora sólo retornamos «texto»...
  texto
end

# Éste método se encarga de manejar sólo los números entre 1 y 99 (incluidos).
def numero_pequenho numero

  texto = '' # Ésta es la cadena que vamos a devolver.

  # Los arreglos nos permiten manejar los casos especiales de forma ordenada.
  # ¡No más returns!
  unidades = ['uno', 'dos', 'tres', 'cuatro', 'cinco', 'seis', 'siete', 'ocho',
              'nueve']
  decenas  = ['diez', 'veinte', 'treinta', 'cuarenta', 'cincuenta', 'sesenta',
              'setenta', 'ochenta', 'noventa']
  grupo_10 = ['once', 'doce', 'trece', 'catorce', 'quince', 'dieciséis',
              'diecisiete', 'dieciocho', 'diecinueve']
  grupo_20 = ['veintiuno', 'veintidós', 'veintitrés', 'veinticuatro',
              'veinticinco', 'veintiséis', 'veintisiete', 'veintiocho',
              'veintinueve']

  if numero < 10
    # Si el número es menor a 10, simplemente devolvemos las unidades.
    texto = unidades[numero - 1]
  else
    # Si el número es 10 o mayor, primero obtenemos las decenas.
    restante = numero
    actual   = restante / 10          # ¿Cuántas decenas se van a escribir?
    restante = restante - actual * 10 # Sustraemos esas decenas.

    if (actual <= 2) and (restante > 0)
      # Como no se usa escribir 'diez y dos' en lugar de 'doce', haremos
      # una excepción para esos casos.
      if actual == 1
        texto = texto + grupo_10[restante - 1]
      end
      # El «-1» es debido a que grupo_10[3] es 'catorce', no 'trece'.

      # Como no se usa escribir 'veinte y dos' en lugar de 'veintidos', haremos
      # una excepción para esos casos.
      if actual == 2
        texto = texto + grupo_20[restante - 1]
      end
      # El «-1» es debido a que grupo_20[3] es 'veinticuatro', no 'veintitrés'.
      # Como ya nos encargamos del dígito en lugar de las unidades, ya no hay
      # nada «restante».

      restante = 0
    else
      texto = texto + decenas[actual - 1]
      # El «-1» es debido a que decenas[3] es 'cuarenta', no 'treinta'.
    end

    if restante > 0
      # Para no escribir 'sesentacuatro'...
      texto = texto + ' y '
    end

    # Por último, si aún queda algo, obtengamos las unidades...
    actual   = restante # ¿Cuántas unidades se van a escribir?
    restante = 0        # Sustraemos esas unidades.

    if actual > 0
      texto = texto + unidades[actual - 1]
      # El «-1» es debido a que unidades[3] es 'cuatro', no 'tres'.
    end
  end

  # Ahora sólo retornamos «texto»...
  texto
end

puts numero_a_espanol(  0)
puts numero_a_espanol(  9)
puts numero_a_espanol( 10)
puts numero_a_espanol( 11)
puts numero_a_espanol( 17)
puts numero_a_espanol( 32)
puts numero_a_espanol( 88)
puts numero_a_espanol( 99)
puts numero_a_espanol(100)
puts numero_a_espanol(101)
puts numero_a_espanol(234)
puts numero_a_espanol(32111)
puts numero_a_espanol(99999)
puts numero_a_espanol(1000000000000)
