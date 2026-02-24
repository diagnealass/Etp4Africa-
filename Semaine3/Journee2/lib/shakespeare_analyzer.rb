require_relative 'word_counter'

# Étape 1 : Charger le texte de Shakespeare
def load_shakespeare
  # On lit tout le fichier et on le stocke dans une variable
  File.read("shakespeare.txt")
end

# Étape 2 : Charger le dictionnaire des gros mots
def load_swear_words
  # On lit le fichier, on sépare chaque ligne pour en faire un tableau
  # .map(&:strip) permet d'enlever les espaces ou retours à la ligne inutiles (\n)
  File.readlines("gros_mots.txt").map(&:strip)
end

# --- ANALYSE ---

shakespeare_text = load_shakespeare

# a) Mots communs
common_dictionary = ["the", "of", "and", "to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"]
puts "Analyse des mots communs en cours..."
puts word_counter(shakespeare_text, common_dictionary)

# b) Gros mots
puts "\nAnalyse des gros mots en cours..."
swear_dictionary = load_swear_words
puts word_counter(shakespeare_text, swear_dictionary)