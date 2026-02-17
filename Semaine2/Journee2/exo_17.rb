puts "Quel âge as-tu ?"
print "> "
age_now = gets.chomp.to_i

0.upto(age_now) do |i|
  years_ago = age_now - i
  age_at_that_time = i
  
  if years_ago == age_at_that_time
    puts "Il y a #{years_ago} ans, tu avais la moitié de l'âge que tu as aujourd'hui"
  else
    puts "Il y a #{years_ago} ans, tu avais #{age_at_that_time} ans."
  end
end