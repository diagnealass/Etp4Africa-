emails = []

50.times do |i|
  numero = (i + 1).to_s.rjust(2, "0")
  email = "jean.dupont.#{numero}@email.fr"
  emails << email
end

puts "Voici les emails avec un numéro pair :"

emails.each do |email|
  
  numero = email.match(/(\d+)@/)[1].to_i
  puts email if numero.even?
end
