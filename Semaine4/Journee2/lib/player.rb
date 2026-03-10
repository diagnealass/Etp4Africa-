# =============================================================
# FICHIER : lib/player.rb
# RÔLE    : Définit la classe Player (bot) et HumanPlayer (humain)
# =============================================================


# =============================================================
# CLASSE 1 : Player — le bot de base
# =============================================================

class Player

  # attr_accessor génère automatiquement les getters ET setters
  # pour @name et @life_points
  attr_accessor :name, :life_points

  # -----------------------------------------------------------
  # initialize : appelé par Player.new("José")
  # Tous les bots démarrent avec 10 PV, seul le nom varie
  # -----------------------------------------------------------
  def initialize(name)
    @name = name
    @life_points = 10
  end

  # -----------------------------------------------------------
  # show_state : affiche "José a 10 points de vie"
  # -----------------------------------------------------------
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  # -----------------------------------------------------------
  # gets_damage(damage) : retire des PV, annonce la mort si besoin
  # -----------------------------------------------------------
  def gets_damage(damage)
    @life_points -= damage

    if @life_points <= 0
      @life_points = 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  # -----------------------------------------------------------
  # attacks(other_player) : attaque un autre joueur
  # Utilise compute_damage pour calculer les dégâts
  # La séparation en méthode dédiée permet à HumanPlayer
  # de changer UNIQUEMENT le calcul, pas toute la logique d'attaque
  # -----------------------------------------------------------
  def attacks(other_player)
    puts "#{@name} attaque #{other_player.name}"
    damage = compute_damage
    other_player.gets_damage(damage)
    puts "il lui inflige #{damage} points de dommages"
  end

  # -----------------------------------------------------------
  # compute_damage : dé à 6 faces — surchargé dans HumanPlayer
  # -----------------------------------------------------------
  def compute_damage
    rand(1..6)
  end

end


# =============================================================
# CLASSE 2 : HumanPlayer < Player
# Hérite de tout ce que Player a, puis ajoute/surcharge
# =============================================================

class HumanPlayer < Player

  attr_accessor :weapon_level

  # -----------------------------------------------------------
  # initialize : 100 PV + arme niveau 1 dès le départ
  # -----------------------------------------------------------
  def initialize(name)
    @name        = name
    @life_points = 100
    @weapon_level = 1
  end

  # -----------------------------------------------------------
  # show_state : version enrichie avec le niveau d'arme
  # -----------------------------------------------------------
  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  # -----------------------------------------------------------
  # compute_damage : dégâts multipliés par le niveau d'arme
  # Entre weapon_level et 6 * weapon_level points de dégâts
  # -----------------------------------------------------------
  def compute_damage
    rand(1..6) * @weapon_level
  end

  # -----------------------------------------------------------
  # search_weapon : cherche une arme au hasard, la garde si meilleure
  # -----------------------------------------------------------
  def search_weapon
    new_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_level}"

    if new_level > @weapon_level
      @weapon_level = new_level
      puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  # -----------------------------------------------------------
  # search_health_pack : soins aléatoires, PV plafonné à 100
  # [valeur, 100].min => astuce Ruby pour ne jamais dépasser 100
  # -----------------------------------------------------------
  def search_health_pack
    dice = rand(1..6)

    if dice == 1
      puts "Tu n'as rien trouvé..."
    elsif dice.between?(2, 5)
      @life_points = [@life_points + 50, 100].min
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else # dice == 6
      @life_points = [@life_points + 80, 100].min
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end

end