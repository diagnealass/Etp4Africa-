def caesar_cipher(string, key)
  # On réduit la clé avec un modulo 26 au cas où elle serait immense (ex: 31 devient 5)
  shift = key % 26
  
  # On transforme le string en tableau de caractères, on le modifie, puis on le rejoint
  string.chars.map do |char|
    if char.match(/[a-z]/)
      # Pour les minuscules (ASCII 97 à 122)
      base = 'a'.ord
      ((char.ord - base + shift) % 26 + base).chr
    elsif char.match(/[A-Z]/)
      # Pour les majuscules (ASCII 65 à 90)
      base = 'A'.ord
      ((char.ord - base + shift) % 26 + base).chr
    else
      # Si c'est un espace ou un symbole, on ne touche à rien
      char
    end
  end.join
end