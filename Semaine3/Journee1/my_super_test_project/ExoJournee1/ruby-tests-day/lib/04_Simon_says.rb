def echo(word)
  word
end

def shout(word)
  word.upcase
end

# Utilisation d'un argument par défaut (n=2)
def repeat(word, n = 2)
  # Crée un tableau avec le mot répété n fois, puis les joint avec un espace
  ([word] * n).join(" ")
end

def start_of_word(word, n)
  # On utilise le slicing : de l'index 0 jusqu'à n caractères
  word[0...n]
end

def first_word(phrase)
  # Découpe la phrase en mots et prend le premier (index 0)
  phrase.split.first
end

def titleize(phrase)
  # On garde seulement 'and' et 'the' comme petits mots
  little_words = ["and", "the"]
  
  words = phrase.split.map.with_index do |word, index|
    # On capitalise si c'est le premier mot (index 0) 
    # OU si ce n'est PAS un petit mot
    if index > 0 && little_words.include?(word)
      word
    else
      word.capitalize
    end
  end
  words.join(" ")
end