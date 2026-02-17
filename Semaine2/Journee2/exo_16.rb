puts "Quel âge as-tu ?"
print "> "
age_now = gets.chomp.to_i

# On boucle de 0 jusqu'à l'âge actuel
0.upto(age_now) do |i|
  years_ago = age_now - i
  age_at_that_time = i
  
  puts "Il y a #{years_ago} ans, tu avais #{age_at_that_time} ans."
end