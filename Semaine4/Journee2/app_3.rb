# =============================================================
# FICHIER : app_3.rb — VERSION 3.0
# RÔLE    : Chef d'orchestre — délègue TOUT à la classe Game
#           10 ennemis apparaissent progressivement
# LANCER  : ruby app_3.rb
# =============================================================

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# --- Message de bienvenue ---
puts "=" * 50
puts "| 🎮 ILS VEULENT TOUS MA POO — v3.0              |"
puts "| Élimine les 10 ennemis pour gagner !            |"
puts "=" * 50

# --- Initialisation ---
print "\nEntre ton prénom : "
player_name = gets.chomp

# On crée UN SEUL objet Game qui contient TOUT l'état du jeu
my_game = Game.new(player_name)
puts "\nBienvenue #{player_name} ! Tu as 100 PV. Bonne chance...\n"

# --- Boucle principale ---
# Tout est délégué à my_game : plus de logique ici, juste des appels de méthodes
while my_game.is_still_ongoing?

  # 1. Afficher l'état de la partie
  my_game.show_players

  # 2. Faire potentiellement apparaître de nouveaux ennemis
  my_game.new_players_in_sight

  # 3. Afficher le menu et récupérer le choix
  my_game.menu
  choice = gets.chomp

  # 4. Exécuter l'action choisie
  my_game.menu_choice(choice)

  gets.chomp   # pause pour lire ce qui vient de se passer

  # 5. Les ennemis ripostent (seulement s'il y en a en vue)
  unless my_game.enemies_in_sight.empty?
    my_game.enemies_attack
    gets.chomp   # pause après la riposte
  end

end

# --- Fin du jeu ---
my_game.end_game