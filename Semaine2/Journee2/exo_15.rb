puts "Quelle est ton année de naissance ?"
print "> "
birth_year = gets.chomp.to_i

current_year = 2024 # Tu peux aussi utiliser Time.now.year pour être automatique
age = 0

# Boucle de l'année de naissance jusqu'à l'année actuelle
(birth_year..current_year).each do |year|
  puts "En #{year}, tu avais #{age} an(s)."
  age += 1 # On ajoute 1 à l'âge pour l'année suivante
end