class BoardCase
  # On doit pouvoir lire et modifier la valeur de la case (X, O ou vide)
  # Mais on a juste besoin de lire sa position (A1, B2, etc.)
  attr_accessor :value
  attr_reader :position

  def initialize(position_id)
    # À la naissance d'une case, elle reçoit sa position (ex: "A1")
    @position = position_id
    # Et par défaut, elle est vide (un espace)
    @value = " "
  end
  
  # Optionnel : une méthode pour afficher proprement la case
  def to_s
    # Cette méthode permet de faire "puts case" et d'afficher sa valeur
    @value.to_s
  end
end