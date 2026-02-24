def word_counter(text, dictionary)
  # 1. On passe tout en minuscule pour ignorer la casse
  content = text.downcase
  result = {}

  # 2. Pour chaque mot du dictionnaire...
  dictionary.each do |word|
    # On utilise .scan pour trouver toutes les occurrences du mot dans le contenu
    # .length nous donne le nombre de fois qu'il apparaît
    count = content.scan(word.downcase).length
    
    # 3. On ne l'ajoute au Hash que si le compteur est supérieur à 0
    result[word] = count if count > 0
  end

  return result
end