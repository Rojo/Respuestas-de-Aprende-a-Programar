# Un millardo de segundos...
# Encuentra el segundo exacto en el que naciste (si es que puedes). Intenta
# averiguar el segundo exacto en el que tendrás (¿o en el que cumpliste, quizá?)
# un millardo de segundos de edad. Cuando lo averigües, marca la fecha en tu
# calendario.

# ¿Cuándo nací? Mmmmm... mi madre me dice que fue un jueves, en agosto 19, 1981,
# alrrededor de la 1 p.m., así que...

nacimiento = Time.mktime(1981, 8, 6, 13, 0, 0)
millardo   = nacimiento + 1_000_000_000 # un millardo de segundos después

puts millardo
