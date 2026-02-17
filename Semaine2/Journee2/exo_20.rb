puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
print "> "

etages = gets.chomp.to_i


if etages < 1 || etages > 25
  puts "Veuillez entrer un nombre entre 1 et 25."
else
  puts "Voici la pyramide :"

  i = 1
  while i <= etages
    puts "#" * i
    i += 1
  end
end
