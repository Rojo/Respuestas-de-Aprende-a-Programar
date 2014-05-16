# Expande numero_a_espanol. Primero, agrega los miles. Debería retornar 'un mil'
# (o 'mil' o hasta 'uno mil') en lugar de 'diez cientos' y 'diez mil' en lugar
# de 'cien cientos cientos'.

def numero_a_espanol numero
  if numero < 0  # No aceptamos números negativos.
    return 'Lo siento, el programa no maneja números negativos.'
  end
  if numero == 0
    return 'cero'
  end

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
  centenas = ['cien', 'doscientos', 'trescientos', 'cuatrocientos', 'quinientos',
              'seiscientos', 'setecientos', 'ochocientos', 'novecientos']

  # "restante" es lo que nos falta por escribir del número.
  # "actual" es la parte que vamos a escribir ahora.
  # "restante" y "actual" ¿Está claro? :)
  # Primero obtengamos las centenas...
  restante  = numero

  # Sección de los miles.
  actual   = restante / 1000          # ¿Cuántos miles se van a escribir?
  restante = restante - actual * 1000 # Sustraemos esos miles

  if actual > 0
    # Hacemos una llamada recursiva
    miles = numero_a_espanol actual
    texto = texto + miles + ' mil'

    if restante > 0
      # Agregamos un espacio para evitar 'dos milcincuenta y uno'...
      texto = texto + ' '
    end
  end

  # Sección de los cientos.

  actual    = restante / 100          # ¿Cuántas centenas se van a escribir?
  restante  = restante - actual * 100 # Sustraemos esas centenas...

  if actual > 0
    if actual < 10
      # Como no se usa escribir 'nueve cientos' en lugar de 'novecientos',
      # haremos una excepción para esos casos.
      texto = texto + centenas[actual - 1]
      # El «-1» es debido a que centenas[3] es 'cuatrocientos', no 'trecientos'.
    else
      # Aqui hay un truco que requiere habilidad:
      texto = texto + numero_a_espanol(actual) + ' cientos'
      # Eso es llamado recursión. ¿Qué es lo que acabo de hacer?
      # Le dije a éste método que se llame así mismo, pero con la parte «actual»
      # en lugar de la «restante». Recuerda que la parte «actual» (en éste
      # momento) es el número que tenemos que escribir.
      # Después de que agregamos las «centenas» al «texto», le agregamos la
      # cadena ' cientos'. Así, por ejemplo, si originalmente llamamos a
      # numero_a_espanol con 1999 (de forma que «numero» = 1999), en éste punto
      # lo «actual» sería 19 y lo «restante» sería 99.
      # Lo que implicaría menos esfuerzo en éste punto es dejar a
      # numero_a_espanol escribir 'diecinueve' por nosotros, entonces escribimos
      # ' cientos' y, al final, la siguiente parte de numero_a_espanol escribe
      # 'noventa y nueve'.
    end

    if restante > 0
      # Agregamos «to» a «cien» en caso de que haya más por escribir para los
      # casos donde hay decenas o unidades por escribir, como «ciento cincuenta»
      # y no «cien cincuenta», etc.
      if actual == 1
        texto = texto + 'to'
      end
      # Agregamos un espacio para evitar 'doscientoscincuenta y uno'...
      texto = texto + ' '
    end
  end

  # Después, obtengamos las decenas...
  actual   = restante / 10          # ¿Cuántas decenas se van a escribir?
  restante = restante - actual * 10 # Sustraemos esas decenas.

  if actual > 0
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
  end

  # Por último, si aún queda algo, obtengamos las unidades...
  actual   = restante # ¿Cuántas unidades se van a escribir?
  restante = 0        # Sustraemos esas unidades.

  if actual > 0
    texto = texto + unidades[actual - 1]
    # El «-1» es debido a que unidades[3] es 'cuatro', no 'tres'.
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
