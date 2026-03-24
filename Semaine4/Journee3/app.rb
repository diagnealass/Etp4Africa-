# ============================================================
# APP.RB - Point d'entrée du programme
# ============================================================
# C'est LE fichier qu'on lance pour démarrer le programme.
# Il charge les dépendances et affiche le menu principal.
# ============================================================

# Charge les variables d'environnement depuis .env
#require 'dotenv/load'

# On indique à Ruby où trouver notre classe Scrapper.
# require_relative = chemin relatif par rapport à CE fichier.
require_relative 'lib/app/scrapper'

# ============================================================
# MENU PRINCIPAL
# ============================================================
# On affiche un joli menu pour que l'utilisateur choisisse
# dans quel format il veut sauvegarder les emails.
# ============================================================

puts "=" * 50
puts "   📧 SCRAPPER D'EMAILS - Val d'Oise"
puts "=" * 50
puts ""
puts "Que voulez-vous faire ?"
puts ""
puts "  1. Scraper et sauvegarder en JSON"
puts "  2. Scraper et sauvegarder en CSV"
puts "  3. Scraper et sauvegarder en Spreadsheet (.xlsx)"
puts "  4. Scraper et sauvegarder dans TOUS les formats"
puts "  5. Quitter"
puts ""
print "Votre choix (1-5) : "

# On lit le choix de l'utilisateur
# gets.chomp lit une ligne de texte et enlève le "\n" à la fin
choix = gets.chomp

# On crée un objet Scrapper (appelle automatiquement initialize)
scrapper = Scrapper.new

# On lance le scraping dans tous les cas (sauf si l'utilisateur quitte)
if choix != "5"
  scrapper.scrape
  puts ""
end

# On traite le choix de l'utilisateur
case choix
when "1"
  scrapper.save_as_json
when "2"
  scrapper.save_as_csv
when "3"
  scrapper.save_as_spreadsheet
when "4"
  puts "📦 Sauvegarde dans tous les formats..."
  scrapper.save_as_json
  scrapper.save_as_csv
  scrapper.save_as_spreadsheet
when "5"
  puts "👋 Au revoir !"
  exit
else
  puts "❌ Choix invalide. Relance le programme."
end

puts ""
puts "✅ Programme terminé avec succès !"