# =============================================================
# FICHIER : multiples.rb
# RÔLE    : Contient les deux méthodes du programme
# =============================================================


# -------------------------------------------------------------
# MÉTHODE 1 : is_multiple_of_3_or_5?(current_number)
#
# But : Vérifier si un nombre est multiple de 3 OU de 5
# Entrée : un nombre (current_number)
# Sortie : true ou false (c'est un booléen)
# -------------------------------------------------------------

def is_multiple_of_3_or_5?(current_number)
  # L'opérateur % (modulo) donne le RESTE d'une division entière.
  # Exemples :
  #   9 % 3 = 0  => 9 est divisible par 3
  #   10 % 5 = 0 => 10 est divisible par 5
  #   7 % 3 = 1  => 7 n'est PAS divisible par 3

  # Si le reste de la division par 3 est 0 OU que le reste par 5 est 0,
  # alors le nombre est multiple de 3 ou de 5 => on retourne true.
  # Sinon, on retourne automatiquement false.
  (current_number % 3 == 0) || (current_number % 5 == 0)
end


# -------------------------------------------------------------
# MÉTHODE 2 : sum_of_3_or_5_multiples(final_number)
#
# But : Calculer la somme de tous les multiples de 3 ou 5
#       strictement inférieurs à final_number
# Entrée : un entier naturel (Integer, >= 0)
# Sortie : un entier (la somme) OU un message d'erreur
# -------------------------------------------------------------

def sum_of_3_or_5_multiples(final_number)

  # --- GARDE-FOU : vérification de l'entrée ---
  # On vérifie que final_number est bien un Integer (entier)
  # ET qu'il est positif ou nul (entier naturel).
  # La méthode .is_a?(Integer) renvoie true si c'est bien un Integer.
  # Si l'une des deux conditions échoue, on affiche un message et on arrête.
  unless final_number.is_a?(Integer) && final_number >= 0
    return "Yo ! Je ne prends que les entiers naturels. TG."
  end

  # --- INITIALISATION ---
  # On crée une variable "final_sum" qui va accumuler notre somme.
  # On la démarre à 0 (elle est vide au début).
  final_sum = 0

  # --- LA BOUCLE ---
  # (0...final_number) crée une plage de 0 jusqu'à final_number EXCLU.
  # Le triple point "..." signifie "strictement inférieur".
  # (Si on voulait inclure final_number, on utiliserait "..")
  #
  # Exemple avec final_number = 11 :
  #   La boucle passera par : 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  #   (11 est EXCLU car on veut les nombres "strictement inférieurs à 11")
  (0...final_number).each do |current_number|

    # À chaque tour de boucle, current_number vaut le nombre en cours
    # (0, puis 1, puis 2, etc.)

    # On appelle notre première méthode pour tester ce nombre.
    if is_multiple_of_3_or_5?(current_number)

      # Si c'est un multiple de 3 ou 5 => on l'AJOUTE à notre somme.
      # final_sum += current_number  est un raccourci pour :
      # final_sum = final_sum + current_number
      final_sum += current_number

    # Pas besoin de "else" ici : si ce n'est pas un multiple,
    # on ne fait rien et la boucle passe automatiquement au suivant.
    end

  end # fin de la boucle

  # --- RETOUR DU RÉSULTAT ---
  # On retourne la somme finale accumulée pendant la boucle.
  return final_sum

en