# =============================================================
# FICHIER : lib/game.rb
# RÔLE    : Classe Game — cerveau du jeu version 3.0
#           Gère l'état global : joueur humain + ennemis
# =============================================================

class Game

  attr_accessor :human_player, :enemies_in_sight, :players_left

  # -----------------------------------------------------------
  # initialize : Game.new("Wolverine")
  # Crée le HumanPlayer + initialise les compteurs
  # -----------------------------------------------------------
  def initialize(player_name)
    @human_player     = HumanPlayer.new(player_name)
    @enemies_in_sight = []    # ennemis visibles et combattables
    @players_left     = 10    # total d'ennemis dans la partie
  end

  # -----------------------------------------------------------
  # is_still_ongoing? : le jeu continue-t-il ?
  # Conditions d'arrêt :
  #   - le joueur humain est mort (PV <= 0)
  #   - OU il n'y a plus d'ennemis du tout (players_left == 0 ET en_sight vide)
  # -----------------------------------------------------------
  def is_still_ongoing?
    @human_player.life_points > 0 &&
      (@players_left > 0 || @enemies_in_sight.length > 0)
  end

  # -----------------------------------------------------------
  # show_players : affiche l'état du joueur + ennemis en vue
  # -----------------------------------------------------------
  def show_players
    puts "\n" + "=" * 45
    puts " TON ÉTAT :"
    @human_player.show_state

    puts "\n  ENNEMIS EN VUE (#{@enemies_in_sight.length}) | #{@players_left} ennemis restants en tout"
    if @enemies_in_sight.empty?
      puts "  (aucun ennemi en vue pour le moment)"
    else
      @enemies_in_sight.each_with_index do |enemy, index|
        print "  #{index} - "
        enemy.show_state
      end
    end
    puts "=" * 45
  end

  # -----------------------------------------------------------
  # menu : affiche les choix disponibles pour ce tour
  # N'affiche que les ennemis encore en vie
  # -----------------------------------------------------------
  def menu
    puts "\nQuelle action veux-tu effectuer ?"
    puts "  a - chercher une meilleure arme"
    puts "  s - chercher à se soigner"
    puts "  n - regarder autour (faire apparaître des ennemis)"

    unless @enemies_in_sight.empty?
      puts "\nAttaquer un joueur en vue :"
      @enemies_in_sight.each_with_index do |enemy, index|
        print "  #{index} - "
        enemy.show_state
      end
    end

    print "\nTon choix : "
  end

  # -----------------------------------------------------------
  # menu_choice(choice) : exécute l'action choisie par l'utilisateur
  # Entrée : choice (String) — ce que l'utilisateur a tapé
  # -----------------------------------------------------------
  def menu_choice(choice)
    case choice

    when "a"
      # Recherche d'arme
      @human_player.search_weapon

    when "s"
      # Recherche de soins
      @human_player.search_health_pack

    when "n"
      # Faire apparaître de nouveaux ennemis
      new_players_in_sight

    else
      # On essaie de convertir en entier pour attaquer un ennemi
      index = choice.to_i

      # Vérifie que l'index correspond bien à un ennemi existant
      if index >= 0 && index < @enemies_in_sight.length
        target = @enemies_in_sight[index]
        @human_player.attacks(target)

        # Si l'ennemi est mort après l'attaque, on l'élimine
        if target.life_points <= 0
          kill_player(target)
        end
      else
        puts "Choix invalide, essaie encore."
      end
    end
  end

  # -----------------------------------------------------------
  # kill_player(player) : supprime un ennemi mort de la liste
  # et décrémente le compteur global
  # -----------------------------------------------------------
  def kill_player(player)
    puts " #{player.name} est éliminé de la partie !"
    @enemies_in_sight.delete(player)   # retire de la liste des ennemis en vue
    @players_left -= 1                 # un ennemi de moins dans le monde
  end

  # -----------------------------------------------------------
  # enemies_attack : tous les ennemis EN VUE attaquent le joueur
  # Un ennemi mort (PV <= 0) ne peut pas attaquer
  # -----------------------------------------------------------
  def enemies_attack
    puts "\n Les ennemis t'attaquent !"

    @enemies_in_sight.each do |enemy|
      # Garde-fou : un ennemi à 0 PV ne joue plus
      if enemy.life_points > 0
        enemy.attacks(@human_player)
      end
    end
  end

  # -----------------------------------------------------------
  # new_players_in_sight : fait apparaître 0, 1 ou 2 nouveaux ennemis
  # Ne fait rien si tous les ennemis restants sont déjà en vue
  # -----------------------------------------------------------
  def new_players_in_sight

    # Cas 1 : tous les ennemis restants sont déjà visibles
    if @enemies_in_sight.length >= @players_left
      puts " Tous les ennemis restants sont déjà en vue !"
      return   # on sort immédiatement de la méthode
    end

    dice = rand(1..6)

    if dice == 1
      puts " Tu regardes autour de toi... rien à signaler."

    elsif dice.between?(2, 4)
      # Un seul nouvel ennemi apparaît
      add_enemy
      puts "  Un nouvel adversaire est apparu !"

    else # dice == 5 ou 6
      # Deux nouveaux ennemis apparaissent (si possible)
      nb_to_add = [@players_left - @enemies_in_sight.length, 2].min
      nb_to_add.times { add_enemy }
      puts " #{nb_to_add} nouveaux adversaires sont apparus !"
    end
  end

  # -----------------------------------------------------------
  # end_game : message de fin selon le résultat
  # -----------------------------------------------------------
  def end_game
    puts "\n" + "=" * 45
    puts " LA PARTIE EST FINIE"

    if @human_player.life_points > 0
      puts " BRAVO ! TU AS GAGNÉ !"
      puts "Tu as éliminé tous les ennemis avec #{@human_player.life_points} PV restants."
    else
      puts " Loser ! Tu as perdu !"
      puts "Tu t'es fait éliminer... Meilleure chance la prochaine fois."
    end
    puts "=" * 45
  end


  private  # Les méthodes ci-dessous sont internes à la classe

  # -----------------------------------------------------------
  # add_enemy : crée un ennemi avec un nom aléatoire et l'ajoute
  # en vue. Méthode privée car utilisée uniquement en interne.
  # -----------------------------------------------------------
  def add_enemy
    random_id = rand(1000..9999)
    new_enemy = Player.new("Joueur_#{random_id}")
    @enemies_in_sight << new_enemy
  end

end