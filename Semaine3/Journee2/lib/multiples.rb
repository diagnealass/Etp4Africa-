# Vérifie si un nombre est multiple de 3 ou 5
def is_multiple_of_3_or_5?(n)
  # Un multiple donne un reste de 0 lors d'une division (modulo %)
  n % 3 == 0 || n % 5 == 0
end

# Calcule la somme des multiples inférieurs à final_number
def sum_of_3_or_5_multiples(final_number)
  # 1. Vérification de l'entrée (Doit être un Integer et >= 0)
  unless final_number.is_a?(Integer) && final_number >= 0
    return "Yo ! Je ne prends que les entiers naturels. TG."
  end

  final_sum = 0
  
  # 2. Boucle de 0 jusqu'à final_number (exclu)
  (0...final_number).each do |current_number|
    if is_multiple_of_3_or_5?(current_number)
      final_sum += current_number
    end
  end

  return final_sum
end