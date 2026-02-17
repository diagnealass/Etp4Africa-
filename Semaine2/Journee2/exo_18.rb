emails = []

50.times do |i|
  numero = (i + 1).to_s.rjust(2, "0")  
  email = "jean.dupont.#{numero}@email.fr"
  emails << email
end


puts "Voici les 50 faux emails :"
puts emails
