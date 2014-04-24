
Aprende a programar: Respuestas
===============================

Este repositorio contiene código como respuesta a los ejercicios sugeridos en
el tutorial «[Aprende a programar][1]» escrito por [Chris Pine][2]. Por favor,
utiliza el material que aquí se encuentra sólo como una referencia para
ayudarte a dar solución a los ejercicios pero tratando de resolverlos por ti
mismo. Asimismo, toma en cuenta que puede haber más de una forma de resolver
un mismo ejercicio, así que las soluciones que has encontrado por ti mismo son
también correctas (siempre que se obtenga el resultado esperado, claro).

La soluciones se dan tanto en español (_es_) como en inglés (_en_). Así podrás
comparar ambos y, si encuentras algún error, puedes enviar correcciones o
sugerencias. Es necesario hacer notar que algunos ejercicios podrían
resolverse fácilmente usando otras características de Ruby, deben resolverse
sólo con las técnicas que aparecen a través del tutorial hasta el lugar donde
aparece cada uno de dichos ejercicios.

Lista de ejercicios
-------------------

- **Números**
  Escribe un programa que te diga:
  - ([Es][3], [En][4]) ¿Cuántas horas hay en un año?
  - ([Es][5], [En][6]) ¿Cuántos minutos hay en una década?
  - ([Es][7], [En][8]) ¿Cuántos segundos de edad tienes?
  - ([Es][9], [En][10]) ¿Cuántos chocolates esperas comer en tu vida?
    _Advertencia_: ¡Esta parte del programa puede tardar un poco en calcularse!
  - ([Es][11], [En][12]) Una pregunta un poco más difícil: ¿Si tengo 1031
    millones de segundos de edad, qué edad tengo en años?

- **Mezclando todo**
  - ([Es][13], [En][14]) Escribe un programa que pregunte por el nombre y
    apellidos de una persona. Al final, debe saludar a la persona usando su
    nombre completo.
  - ([Es][15], [En][16]) Escribe un programa que pregunta por el número favorito
    de una persona. Haz que tu programa le sume 1 al número y entonces sugiera
    el resultado como un más grande y mejor número favorito. (Pero hazlo con
    tacto.)

- **Más acerca de los métodos**
  - ([Es][17], [En][18]) Escribe el programa «Jefe enojado». Debe preguntar de
    forma ruda que es lo que quieres. Lo que sea que le pidas, el jefe enojado
    debe contestarte gritando y después, despedirte. Así que, por ejemplo, si tú
    escribes «Quiero un aumento.» él debe contestar gritando: ¿¡¿QUÉ QUIERES
    DECIR CON «QUIERO UN AUMENTO»?!? ¡¡ESTÁS DESPEDIDO!!
  - ([Es][19], [En][20]) Aquí hay algo para que puedas jugar un poco más con
    `center`, `ljust` y `rjust`. Escribe un programa que desplegará una «Tabla
    de contenidos» de forma que se vea parecida a ésta:

      ```
      ____________ Tabla de contenidos _______________
      Capítulo 1: Número ................... página 001
      Capítulo 2: Letras ................... página 072
      Capítulo 3: Variables ................ página 118
      ```

- **Control de flujo**
  - ([Es][21], [En][22]) «Un elefante se balanceaba...» Escribe un programa que
    imprima 99 veces la letra de ésta clásica canción infantil: «1 elefante se
    balanceaba sobre la tela de una araña».
  - ([Es][23], [En][24]) Escribe el programa de la abuela sorda. Para cualquier
    cosa que le digas a la abuela (esto es, cualquier cosa que escribas), ella
    debe responder con ¿¡QUÉ!? ¡HABLA MÁS FUERTE HIJITO!, a menos que se lo
    digas gritando (escribiendo todo en mayúsculas). Si gritas, ella podrá
    escucharte (o al menos eso creerá ella) y te responderá gritando ¡NO, NO
    DESDE 1938! Para hacer el programa realmente creíble, haz que la abuela
    grite un año cualquiera al azar entre 1930 y 1950. (Esta parte del programa
    es opcional y será mucho más fácil de realizar si lees la sección sobre el generador de números aleatorios de Ruby). No puedes dejar de hablar con la abuela hasta que grites ADIÓS.

      > **Pista**: ¡No te olvides de `chomp`! ¡'ADIÓS' con un Intro no es lo
      > mismo que un 'ADIÓS' sin uno!
      > **Pista 2**: Trata de pensar acerca de partes de tu programa tienen que
      > repetirse una y otra vez. Todas ellas deben estar dentro de una
      > iteración con `while`.

  - ([Es][25], [En][26]) Extiende tu programa de la abuela sorda: ¿Qué hay si la
    abuela no quiere que te vayas? Cuando grites ADIÓS, ella puede pretender no
    oirte. Cambia tu programa anterior para que tengas que gritar ADIÓS tres
    veces seguidas. Asegúrate de probar tu programa: si dices ADIÓS tres veces
    pero no de forma consecutiva, debes de seguir hablando con la abuela.
  - ([Es][27], [En][28]) Años bisiestos: Escribe un programa que solicite un año
    inicial y un año final, y entonces imprima todos los años bisiestos entre
    esos dos años (incluyendolos si también son años bisiestos). Los años
    bisiestos son divisibles entre cuatro (como 1984 y 2004). Sin embargo, los
    años divisibles entre 100 no son años bisiestos (como 1800 y 1900) a menos
    que también sean divisibles entre 400 (como 1600 y 2000, los que fueron de
    hecho, años bisiestos). (Sí, es bastante confuso, pero no es tan confuso
    como tener el mes de Julio a mitad del invierno, que es lo que eventualmente
    pasaría).

- **Arreglos e iteradores**
  - ([Es][29], [En][30]) Escribamos un programa que nos pida introducir tantas
    palabras como deseemos (una palabra por línea, continuando hasta que
    presionemos Intro en una línea vacía), y que repita las palabras que
    escribimos en orden alfabético.

      > **Pista**: Hay un adorable método de arreglos que devuelve la versión
      > ordenada de un arreglo, `sort`. ¡Úsalo!

  - ([Es][31], [En][32]) Intenta escribir el programa anterior sin utilizar el
    método `sort`. Una parte importante de la programación es resolver
    problemas, ¡así que practica todo lo que puedas!
  - ([Es][33], [En][34]) Reescribe el programa «Tabla de contenidos» (del
    capítulo sobre métodos). Comienza el programa con un arreglo que contenga
    toda la información de la tabla de contenidos (nombres de capítulos, números
    de página, etc.). Después imprime la información con una bonita
    presentación.

- **Escribiendo tus propios métodos**
  - ([Es][35], [En][36]) Expande `numero_a_espanol`. Primero, agrega los miles.
    Debería retornar 'un mil' (o 'mil' o hasta 'uno mil') en lugar de 'diez
    cientos' y 'diez mil' en lugar de 'cien cientos cientos'.
  - ([Es][37], [En][38]) Expande `numero_a_espanol` una vez más. Haz que ahora
    pueda manejar millones para obtener 'un millón' en lugar de 'un mil mil'.
    Después intenta agregar millardos, billones, trillones… ¿Hasta dónde puedes
    llegar?
  - ([Es][39], [En][40]) ¿Qué tal un programa que escriba números en estilo de
    números de boda? Debería ser casi lo mismo que `numero_a_espanol`, pero
    insertando «y» entre los grupos de unidades, retornando cosas como
    'diecinueve cientos y setenta y dos' o como se supone que se deben escribir
    los números en las invitaciones de boda. Te daría más ejemplos, pero yo
    mismo no lo he terminado de entender. Podrías necesitar contactar a tu
    organizador de bodas más cercano.
  - ([Es][41], [En][42]) «Un elefante se balanceaba…» Usando `numero_a_espanol`
    y tu viejo programa, escribe la letra de la canción de la forma correcta
    ésta vez. Castiga a tu computadora: deja que alcance hasta 9,999 elefantes.
    (Pero tampoco escojas un número muy grande ya que escribir todo eso en la
    pantalla puede tomar bastante tiempo aún a una computadora; si pones como
    límite un millón de elefantes, ¡te estarás castigando también a ti mismo!)

- **Clases**
  - ([Es][43], [En][44]) «Un millardo de segundos...» Encuentra el segundo
    exacto en el que naciste (si es que puedes). Intenta averiguar el segundo
    exacto en el que tendrás (¿o en el que cumpliste, quizá?) un millardo de
    segundos de edad. Cuando lo averigües, marca la fecha en tu calendario. :)
  - ([Es][45], [En][46]) ¡Feliz cumpleaños! Pregunta en qué año nació una
    persona, después el mes y por último el día. Averigua su edad y dales una
    ¡NALGADA! Por cada cumpleaños que han tenido.
  - ([Es][47], [En][48]) Crea la clase Naranjo. Debe tener el método `altura`
    que retorna su altura, y el método `doceMesesDespues`, el cual, cuando es
    llamado, incrementa la edad del árbol por un año. Cada año, el árbol debe
    crecer a lo alto (lo que tú consideres que debe crecer un naranjo en un
    año), y después de cierto número de años (de nuevo, a tu criterio) el árbol
    debe morir. En los primeros años no debe producir naranjas, pero después de
    un poco debe hacerlo, y creo que los árboles viejos producen más cada año
    que los árboles jóvenes… conforme tú creas que tiene más sentido. Por
    supuesto, debes ser capaz de `contarLasNaranjas` (retornando el número de
    naranjas en el árbol), y `cortarNaranja` (que reduce el número de
    `@naranjas` en uno y retorna una cadena diciendo que tan deliciosa estaba
    esa naranja o que no hay más naranjas para cortar éste año). Asegúrate de
    que todas las naranjas que no sean cortadas en un año, caigan del árbol
    antes del siguiente año.
  - ([Es][49], [En][50]) Escribe un programa con el que puedas interactuar con
    tu pequeño dragón. Debes ser capaz de introducir comandos como `alimentar`
    y `pasear`, y que los métodos correspondientes en tu dragón sean llamados.
    Claro, como lo que tú escribirás será sólo texto, necesitarás tener algún
    tipo de despachador de métodos, donde tu programa revise el texto que ha
    sido introducido y llame el método apropiado.

- **Bloques y procs**
  - ([Es][51], [En][52]) El reloj del abuelo: Escribe un método que reciba un
    bloque y lo llame por cada hora que ha pasado el día de hoy. De esa forma,
    si yo le pasara el bloque `do puts '¡DONG!' end`, repicaría como un reloj de
    péndulo. Prueba tu método con unos cuantos bloques diferentes (incluyendo el
    que acabo de darte).

      > **Pista**: Puedes usar `Time.now.hour` para obtener la hora actual.
      > Pero esto devuelve un número entre 0 y 23, así que tienes que alterar
      > esos números para obtener números comunes en la carátula de un reloj
      > (del 1 a 12).

  - ([Es][53], [En][54]) Registro de programas. Escribe un método llamado
    `registro`, que toma una cadena como descripción de un bloque y, por
    supuesto, un bloque, además de otra cadena al final, diciendo que ha
    terminado el bloque. De forma similar a `algoImportante`, debe poner una
    cadena diciendo que ha comenzado el bloque y otra cadena al final indicando
    que ha terminado el bloque, indicando lo que el bloque retornó. Prueba tu
    método enviándole un bloque de código. Dentro de ese bloque, coloca otra
    llamada a registro, pasando otro bloque. (Esto es llamado anidar.) En otras
    palabras, tu salida debe verse de forma similar a ésta:

      ```
      Comenzando «bloque exterior»... Comenzando «algún pequeño bloque»...
      ...«algún pequeño bloque» terminó, retornando: 5
      Comenzando «un bloque más»...
      ...«un bloque más» terminó, retornando: ¡Me gusta la comida tailandesa!
      ...«bloque exterior» terminó, retornando: false
      ```

  - ([Es][55], [En][56]) Un mejor registro de programas. La salida del último
    registro fue un poco difícil de leer y sería peor entre más métodos anidados
    recibiera. Sería mucho más fácil de leer si sangrara las líneas en los
    bloques internos. Para hacerlo, necesitarás llevar un registro de que tan
    profundamente anidado te encuentras cada vez que el registro quiera escribir
    algo. Para hacerlo, utiliza una variable global, una variable que puedes ver
    desde cualquier parte de tu código. Para crear una variable global, sólo
    precede el nombre de su variable con $, como éstas: `$global`,
    `$profundidadDeAnidado` y `$chapulinColorado`. Al final, tu registro debe
    presentar algo como esto:

      ```
      Comenzando «bloque exterior»...
        Comenzando «algún pequeño bloque»...
          Comenzando «bloque pequeñito»...
          ...«bloque pequeñito» terminó, retornando: mucho amor
        ...«algún pequeño bloque» terminó, retornando: 42
        Comenzando «un bloque más»...
        ...«un bloque más» terminó, retornando: ¡Me gusta la comida hindú!
      ...«bloque exterior» terminó, retornando: false
      ```


Notas
-----
- Si has concluido el tutorial, tienes un nivel intermedio de inglés y
quisieras aprender un poco más, te recomiendo comprar «[Learn to Program][57]»,
que es la versión extendida del tutorial.
- ¡Puedes practicar aún más! La lista de ejercicios que se publicó en «Learn to
  Program» esta disponible en este repositorio. (De igual forma, se requiere
  un nivel medio en inglés y el investigar un poco sobre temás no vistos en el
  tutorial.)
- Las descripciones de los problemas en el material en inglés son &copy; Chris
  Pine. A menos que se indique lo contrario, todo código incluido en éste
  repositorio es de dominio público bajo los términos de la licencia [Creative
  Commons CC0 1.0 Universal License][58].

  [1]: http://goo.gl/3UcZi
  [2]: http://pine.fm/
  [3]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/01%20Numeros/1.1_horas_en_un_anho.rb
  [4]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/01%20Numbers/1.1_hours_in_a_year.rb
  [5]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/01%20Numeros/1.2_minutos_en_una_decada.rb
  [6]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/01%20Numbers/1.2_minutes_in_a_decade.rb
  [7]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/01%20Numeros/1.3_segundos_de_edad.rb
  [8]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/01%20Numbers/1.3_seconds_old.rb
  [9]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/01%20Numeros/1.4_chocolates_en_la_vida.rb
  [10]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/01%20Numbers/1.4_chocolates_in_life.rb
  [11]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/01%20Numeros/1.5_que_edad_tengo.rb
  [12]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/01%20Numbers/1.5_how_old_am_i.rb
  [13]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/04%20Mezclando%20todo/4.1_saludo_nombre_completo.rb
  [14]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/04%20Mixing%20It%20Up/4.1_full_name_greeter.rb
  [15]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/04%20Mezclando%20todo/4.2_numero_favorito.rb
  [16]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/04%20Mixing%20It%20Up/4.2_favorite_number.rb
  [17]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/05%20Mas%20acerca%20de%20los%20metodos/5.1_jefe_enojado.rb
  [18]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/05%20More%20About%20Methods/5.1_angry_boss.rb
  [19]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/05%20Mas%20acerca%20de%20los%20metodos/5.2_tabla_de_contenidos.rb
  [20]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/05%20More%20About%20Methods/5.2_content_table.rb
  [21]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/07%20Control%20de%20flujo/7.1_un_elefante.rb
  [22]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/06%20Flow%20Control/6.1_bottles_of_beer.rb
  [23]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/07%20Control%20de%20flujo/7.2_la_abuela_sorda.rb
  [24]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/06%20Flow%20Control/6.2_deaf_granny.rb
  [25]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/07%20Control%20de%20flujo/7.3_la_abuela_necia.rb
  [26]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/06%20Flow%20Control/6.3_stubborn_granny.rb
  [27]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/07%20Control%20de%20flujo/7.4_anhos_bisiestos.rb
  [28]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/06%20Flow%20Control/6.4_leap_year.rb
  [29]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/08%20Arreglos%20e%20iteradores/8.1_ordenar_palabras.rb
  [30]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/07%20Arrays%20and%20Iterators/7.1_sort_words.rb
  [31]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/08%20Arreglos%20e%20iteradores/8.2_ordenar_palabras_2.rb
  [32]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/07%20Arrays%20and%20Iterators/7.2_sort_words_2.rb
  [33]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/08%20Arreglos%20e%20iteradores/8.3_tabla_de_contenidos.rb
  [34]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/07%20Arrays%20and%20Iterators/7.3_content_table.rb
  [35]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/09%20Escribiendo%20tus%20propios%20metodos/9.1_numero_a_espanhol.rb
  [36]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/08%20Writing%20Your%20Own%20Methods/8.1_english_number.rb
  [37]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/09%20Escribiendo%20tus%20propios%20metodos/9.2_numero_a_espanhol.rb
  [38]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/08%20Writing%20Your%20Own%20Methods/8.2_english_number.rb
  [39]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/09%20Escribiendo%20tus%20propios%20metodos/9.3_numeros_de_invitacion.rb
  [40]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/08%20Writing%20Your%20Own%20Methods/8.3_wedding_number.rb
  [41]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/09%20Escribiendo%20tus%20propios%20metodos/9.4_un_elefante.rb
  [42]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/08%20Writing%20Your%20Own%20Methods/8.4_bottles_of_beer.rb
  [43]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/10%20Clases/10.1_millardo_de_segundos.rb
  [44]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/09%20Classes/9.1_one_billion_seconds.rb
  [45]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/10%20Clases/10.2_feliz_cumpleanhos.rb
  [46]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/09%20Classes/9.2_happy_birthday.rb
  [47]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/10%20Clases/10.3_naranjo.rb
  [48]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/09%20Classes/9.3_orange_tree.rb
  [49]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/10%20Clases/10.4_pequenho_dragon.rb
  [50]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/09%20Classes/9.4_baby_dragon.rb
  [51]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/11%20Bloques%20y%20procs/11.01_reloj_del_abuelo.rb
  [52]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/10%20Blocks%20and%20Procs/10.1_grandfather_clock.rb
  [53]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/11%20Bloques%20y%20procs/11.02_registro_de_programas.rb
  [54]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/10%20Blocks%20and%20Procs/10.2_program_logger.rb
  [55]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/Es/11%20Bloques%20y%20procs/11.03_mejor_registro.rb
  [56]: https://github.com/Rojo/Respuestas-de-Aprende-a-Programar/blob/master/En/10%20Blocks%20and%20Procs/10.3_better_logger.rb
  [57]: http://pragprog.com/book/ltp2/learn-to-program
  [58]: https://creativecommons.org/publicdomain/zero/1.0/legalcode

