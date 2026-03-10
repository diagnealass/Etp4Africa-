# =============================================================
# APP.RB — Point d'entrée de l'application
# =============================================================
# require_relative charge un fichier Ruby RELATIF à ce fichier.
# "relatif" = par rapport à l'emplacement de app.rb.
# Ici, lib/user.rb et lib/event.rb sont dans le dossier lib/.
#
# L'ordre est important : on charge les classes avant de les utiliser.
# =============================================================
require_relative 'lib/user'
require_relative 'lib/event'

puts "=========================================="
puts "   TESTS DE LA CLASSE USER"
puts "=========================================="

# Création de 3 utilisateurs
# User.new("email", age) déclenche initialize automatiquement
julie  = User.new("julie@julie.com", 35)
jean   = User.new("jean@jean.com", 23)
claude = User.new("claude@claude.com", 75)

# Afficher l'email de julie grâce au getter créé par attr_accessor
puts "Email de Julie : #{julie.email}"

# Modifier l'age de Jean grâce au setter créé par attr_accessor
jean.age = 24
puts "Nouvel age de Jean : #{jean.age}"

# User.all retourne le tableau @@all avec tous les users
puts "\nListe de tous les utilisateurs :"
User.all.each { |u| puts "  - #{u.email} (#{u.age} ans)" }

# Trouver un user par son email
user_trouve = User.find_by_email("claude@claude.com")
puts "\nUser trouvé : #{user_trouve.email}, #{user_trouve.age} ans"

puts "\n=========================================="
puts "   TESTS DE LA CLASSE EVENT"
puts "=========================================="

# Création d'un événement passé (2020) et d'un futur (2030)
event_passe  = Event.new("2020-03-15 10:00", 60, "Réunion passée", ["julie@julie.com"])
event_futur  = Event.new("2030-06-20 14:00", 90, "Conférence future", ["jean@jean.com", "claude@claude.com"])

# Test is_past? et is_future?
puts "L'événement passé est dans le passé ? #{event_passe.is_past?}"    # true
puts "L'événement futur est dans le futur ? #{event_futur.is_future?}"  # true

# Afficher la date de fin calculée
puts "\nDate de fin de la réunion passée : #{event_passe.end_date.strftime("%d/%m/%Y %H:%M")}"

# Afficher avec to_s
puts "\nDétails de l'événement futur :"
event_futur.to_s

# Test postpone_24h
puts "\nAvant décalage : #{event_passe.start_date.strftime("%d/%m/%Y %H:%M")}"
event_passe.postpone_24h
puts "Après décalage : #{event_passe.start_date.strftime("%d/%m/%Y %H:%M")}"

# Test is_soon? avec un événement dans 10 minutes
dans_10_min = (Time.now + 600).strftime("%Y-%m-%d %H:%M")
event_bientot = Event.new(dans_10_min, 30, "Appel urgent", ["julie@julie.com"])
puts "\nL'événement dans 10 min est bientôt ? #{event_bientot.is_soon?}"  # true