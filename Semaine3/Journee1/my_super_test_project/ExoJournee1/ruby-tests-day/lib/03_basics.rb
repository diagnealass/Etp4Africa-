# 1. Who is the biggest number
def who_is_bigger(a, b, c)
  # On vérifie si l'un des arguments est nil
  return "nil detected" if a.nil? || b.nil? || c.nil?

  # On place les valeurs dans un hash pour associer la valeur à sa lettre
  # puis on cherche la clé du plus grand élément (max_by)
  values = { "a" => a, "b" => b, "c" => c }
  return "#{values.key(values.values.max)} is bigger"
end

# 2. Crazy stuff on strings
def reverse_upcase_noLTA(string)
  # On inverse, on met en majuscules, puis on supprime L, T et A
  # .tr ou .delete permettent de supprimer plusieurs caractères d'un coup
  return string.reverse.upcase.delete("LTA")
end

# 3. 42 finder
def array_42(array)
  # .include? est la méthode parfaite pour vérifier la présence d'un élément
  return array.include?(42)
end

# 4. Crazy stuff on arrays (Magic Array)
def magic_array(array)
  # On enchaîne les méthodes (Method Chaining)
  # flatten: aplatit les tableaux imbriqués
  # sort: trie
  # map: multiplie par 2
  # reject: enlève les multiples de 3
  # uniq: enlève les doublons
  array.flatten.sort.map { |n| n * 2 }.reject { |n| n % 3 == 0 }.uniq.sort
end