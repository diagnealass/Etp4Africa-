class Board
  # On doit pouvoir accéder aux cases pour les afficher
  attr_accessor :cases

  def initialize
    # On crée un Hash qui va contenir nos 9 cases
    # La clé est le nom de la case (A1), la valeur est l'objet BoardCase
    @cases = {
      "A1" => BoardCase.new("A1"), "A2" => BoardCase.new("A2"), "A3" => BoardCase.new("A3"),
      "B1" => BoardCase.new("B1"), "B2" => BoardCase.new("B2"), "B3" => BoardCase.new("B3"),
      "C1" => BoardCase.new("C1"), "C2" => BoardCase.new("C2"), "C3" => BoardCase.new("C3")
    }
  end

  def play_touch(position, symbol)
    # 1. On vérifie si la position existe et si la case est vide
    if @cases.has_key?(position) && @cases[position].value == " "
      @cases[position].value = symbol
      return true # Le coup a été joué avec succès
    else
      return false # Coup invalide ou case déjà prise
    end
  end

  def victory?
    # Les 8 combinaisons gagnantes (3 lignes, 3 colonnes, 2 diagonales)
    ways_to_win = [
      ["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"], # Lignes
      ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], # Colonnes
      ["A1", "B2", "C3"], ["A3", "B2", "C1"]                      # Diagonales
    ]

    ways_to_win.each do |combo|
      # On récupère les valeurs des 3 cases de la combinaison
      check = combo.map { |pos| @cases[pos].value }
      
      # Si les 3 sont identiques et ne sont pas vides, c'est gagné !
      return true if check.all?("X") || check.all?("O")
    end

    false # Personne n'a gagné pour l'instant
  end
end