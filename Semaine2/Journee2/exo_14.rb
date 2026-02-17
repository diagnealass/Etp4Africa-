puts "Choisis un nombre pour le compte à rebours :"
print "> "
number = gets.chomp.to_i

# On utilise la méthode .downto pour partir du nombre et descendre jusqu'à 0
number.downto(0) do |i|
  puts i
end