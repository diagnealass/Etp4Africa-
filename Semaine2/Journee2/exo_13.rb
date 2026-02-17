require 'date'

print "Quelle est ton année de naissance ? "
annee_naissance = gets.chomp.to_i

# Récupère l'année actuelle
annee_courante = Date.today.year

puts "Voici toutes les années depuis ta naissance :"

i = annee_naissance
while i <= annee_courante
  puts i
  i += 1
end
