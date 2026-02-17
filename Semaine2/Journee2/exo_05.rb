# Affiche une phrase simple pour expliquer l'objectif du programme
puts "On va compter le nombre d'heures de travail à THP"

# Calcule 10h * 5 jours * 11 semaines et insère le résultat (550) dans la phrase
puts "Travail : #{10 * 5 * 11}"

# Calcule le total précédent multiplié par 60 pour obtenir les minutes (33000)
puts "En minutes ça fait : #{10 * 5 * 11 * 60}"

# Affiche une question simple sur les secondes
puts "Et en secondes ?"

# Calcule le nombre de secondes (10*5*11*60*60) et l'affiche seul sur une ligne (1980000)
puts 10 * 5 * 11 * 60 * 60

# Affiche une phrase posant une question de comparaison mathématique
puts "Est-ce que c'est vrai que 3 + 2 < 5 - 7 ?"

# Effectue la comparaison : est-ce que 5 est inférieur à -2 ? Affiche le booléen "false"
puts 3 + 2 < 5 - 7

# Calcule 3 + 2 et insère le résultat "5" dans la réponse
puts "Ça fait combien 3 + 2 ? #{3 + 2}"

# Calcule 5 - 7 et insère le résultat "-2" dans la réponse
puts "Ça fait combien 5 - 7 ? #{5 - 7}"

# Affiche une conclusion textuelle simple
puts "Ok, c'est faux alors !"

# Affiche une phrase de transition
puts "C'est drôle ça, faisons-en plus :"

# Compare si 5 est strictement supérieur à -2. Affiche "true" (vrai)
puts "Est-ce que 5 est plus grand que -2 ? #{5 > -2}"

# Compare si 5 est supérieur ou égal à -2. Affiche "true" (vrai)
puts "Est-ce que 5 est supérieur ou égal à -2 ? #{5 >= -2}"

# Compare si 5 est inférieur ou égal à -2. Affiche "false" (faux)
puts "Est-ce que 5 est inférieur ou égal à -2 ? #{5 <= -2}"