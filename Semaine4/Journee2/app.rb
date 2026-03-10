# =============================================================
# FICHIER : app.rb — VERSION 1.0
# RÔLE    : Combat automatique entre 2 bots (José vs Josiane)
# LANCER  : ruby app.rb
# =============================================================

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# --- Création des deux combattants ---
player1 = Player.new("Josiane")
player2 = Player.new("José")

# --- Boucle de combat ---
# Le combat continue tant que les deux joueurs ont des PV > 0
while player1.life_points > 0 && player2.life_points > 0

  puts "\nVoici l'état de nos joueurs :"
  player1.show_state
  player2.show_state

  puts "\nPassons à la phase d'attaque :"

  # Tour 1 : Josiane attaque José
  player1.attacks(player2)

  # Garde-fou : si José vient de mourir, on sort immédiatement
  # Sans ce break, José pourrait riposter alors qu'il est mort
  break if player2.life_points <= 0

  # Tour 2 : José riposte
  player2.attacks(player1)

end

puts "\n--- Combat terminé ---"