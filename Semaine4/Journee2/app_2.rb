# =============================================================
# FICHIER : app_2.rb — VERSION 2.0
# RÔLE    : Combat interactif — TOI contre José et Josiane
# LANCER  : ruby app_2.rb
# =============================================================

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# --- Message de bienvenue ---
puts "=" * 50
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "| Sois le dernier survivant pour gagner !         |"
puts "=" * 50

# --- Initialisation du joueur humain ---
print "\nEntre ton prénom : "
human_name = gets.chomp
user = HumanPlayer.new(human_name)
puts "Bienvenue #{user.name} ! Tu démarres avec #{user.life_points} PV."

# --- Initialisation des ennemis (dans un array pour les boucler) ---
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]   # tableau pour pouvoir boucler dessus

# --- Boucle principale de combat ---
# Le jeu tourne tant que le joueur est en vie ET qu'au moins un ennemi l'est aussi
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

  # Affichage de l'état du joueur humain
  puts "\n" + "-" * 40
  user.show_state

  # Menu de choix
  puts "\nQuelle action veux-tu effectuer ?"
  puts "  a - chercher une meilleure arme"
  puts "  s - chercher à se soigner"
  puts "\nAttaquer un joueur en vue :"
  print "  0 - "; player1.show_state
  print "  1 - "; player2.show_state
  print "\nTon choix : "

  choice = gets.chomp

  # Action selon le choix
  case choice
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0"
    user.attacks(player1)
  when "1"
    user.attacks(player2)
  else
    puts "Choix invalide !"
  end

  gets.chomp   # pause pour lire le résultat avant de continuer

  # --- Riposte des ennemis ---
  puts "\n💥 Les ennemis t'attaquent !"

  # On boucle sur le tableau enemies plutôt que d'écrire player1.attacks et player2.attacks
  # => anticipation : s'il y avait 20 ennemis, on n'écrirait pas 20 lignes
  enemies.each do |enemy|
    # Un ennemi mort ne peut pas attaquer
    if enemy.life_points > 0
      enemy.attacks(user)
    end
  end

  gets.chomp   # pause
end

# --- Message de fin ---
puts "\n" + "=" * 40
puts "La partie est finie !"

if user.life_points > 0
  puts "🏆 BRAVO ! TU AS GAGNÉ !"
else
  puts "💀 Loser ! Tu as perdu !"
end
puts "=" * 40