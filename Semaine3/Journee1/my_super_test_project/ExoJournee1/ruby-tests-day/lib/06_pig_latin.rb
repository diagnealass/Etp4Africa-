def translate(phrase)
  # On découpe la phrase en mots pour les traiter un par un
  phrase.split.map do |word|
    # Regex magique :
    # ^([^aeiou]*qu|[^aeiou]+)
    # 1. On cherche au début (^) :
    # 2. Soit des consonnes suivies de "qu" ([^aeiou]*qu)
    # 3. Soit juste un bloc de consonnes ([^aeiou]+)
    
    if word =~ /\A[aeiou]/
      # Si ça commence par une voyelle
      word + "ay"
    else
      # On capture le bloc de consonnes du début
      consonants = word.match(/\A([^aeiou]*qu|[^aeiou]+)/)[0]
      # On prend le reste du mot + le bloc déplacé + "ay"
      word[consonants.length..-1] + consonants + "ay"
    end
  end.join(" ")
end