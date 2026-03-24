require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'board'
require 'board_case'
require 'player'
require 'game'
require 'show'

# --- Lancement du jeu ---
puts "-------------------------------------------------"
puts "|   BIENVENUE DANS LE MEILLEUR MORPION DU MONDE |"
puts "-------------------------------------------------"

print "Nom du Joueur 1 (X) : "
p1 = gets.chomp
print "Nom du Joueur 2 (O) : "
p2 = gets.chomp

# Initialisation
game = Game.new(p1, p2)
show = Show.new

# Boucle de jeu
while game.status == "on going"
  show.show_board(game.board)
  game.turn
end

# Fin de partie
show.show_board(game.board) # Affichage final

if game.status == "winner"
  puts "FÉLICITATIONS ! 🎉"
  puts "#{game.current_player.name} a gagné la partie !"
else
  puts "MATCH NUL ! 🤝"
  puts "Personne n'a gagné, mais c'était un beau combat."
end