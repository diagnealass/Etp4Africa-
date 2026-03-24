# 2.1.3 Le combo : La méthode pour demander le prénom
def ask_first_name
  puts "Quel est ton prénom ?"
  print "> "
  first_name = gets.chomp
  return first_name
end

# 2.1.2 Coucou toi : La méthode qui prend un paramètre
def say_hello(first_name)
  puts "Bonjour, #{first_name} !"
end

# Pour exécuter le programme
def perform
  name = ask_first_name
  say_hello(name)
end

perform