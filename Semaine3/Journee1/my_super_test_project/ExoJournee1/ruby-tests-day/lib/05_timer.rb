def time_string(total_seconds)
  # 1. Calculer les heures, minutes et secondes restantes
  hours = total_seconds / 3600
  minutes = (total_seconds % 3600) / 60
  seconds = total_seconds % 60

  # 2. Formater pour avoir toujours 2 chiffres (00:00:00)
  # %02d signifie : un entier (d), sur 2 chiffres (2), complété par un zéro (0)
  format("%02d:%02d:%02d", hours, minutes, seconds)
end