# On importe les bibliothèques dont on a besoin.
# "require" c'est comme "importer" en Python ou "include" en JS.

require 'open-uri'       # Pour ouvrir/télécharger des pages web
require 'nokogiri'       # Pour lire et analyser le HTML
require 'json'           # Pour créer et lire des fichiers JSON
require 'csv'            # Pour créer et lire des fichiers CSV

# ============================================================
# CLASS Scrapper
# ============================================================
# Une classe, c'est un "moule" qui crée des objets.
# Ici, notre classe Scrapper va :
#   1. Aller chercher les emails sur internet (scraping)
#   2. Les sauvegarder dans différents formats
# ============================================================

class Scrapper

  # La page web qu'on va scraper (les mairies du Val d'Oise)
  # On la met en constante (en majuscules) car elle ne change pas.
  URL = "https://www.valdoise.fr/606-annuaire-des-communes.htm"

  # ----------------------------------------------------------
  # INITIALIZE
  # ----------------------------------------------------------
  # C'est la méthode spéciale qui s'exécute quand on crée un
  # nouvel objet Scrapper avec : Scrapper.new
  # Elle initialise les variables d'instance (@emails).
  # @emails : le "@" signifie que c'est une variable d'instance,
  # accessible partout dans la classe.
  # ----------------------------------------------------------
  def initialize
    @emails = {}   # On commence avec un hash vide
    # Un hash ressemble à : { "VILLE" => "email@exemple.fr" }
  end

  # ----------------------------------------------------------
  # MÉTHODE : scrape
  # ----------------------------------------------------------
  # Cette méthode va sur internet, télécharge la page,
  # et extrait tous les emails + noms de villes.
  # Elle retourne le hash @emails une fois rempli.
  # ----------------------------------------------------------
  def scrape
    puts "🔍 Démarrage du scraping..."

    begin
      # On télécharge la page web et on la stocke dans 'html'
      html = URI.open(URL)

      # Nokogiri analyse le HTML pour qu'on puisse le parcourir
      # comme un document structuré.
      document = Nokogiri::HTML(html)

      # On cherche tous les éléments HTML qui contiennent les infos.
      # Ici, on sélectionne les lignes du tableau des communes.
      # NOTE : Adapte le sélecteur CSS selon la structure réelle de la page !
      document.css(".list-annuaire .annuaire-item").each do |item|
        # Pour chaque ville trouvée, on extrait le nom et l'email
        city_name = item.css(".commune-name").text.strip.upcase
        email     = item.css("a[href^='mailto:']").attr("href")&.value&.gsub("mailto:", "")&.strip

        # On n'ajoute que si les deux informations existent
        if city_name && email && !city_name.empty? && !email.empty?
          @emails[city_name] = email
        end
      end

      puts "✅ Scraping terminé ! #{@emails.count} emails trouvés."

    rescue => e
      # Si quelque chose se passe mal (pas de connexion internet, etc.)
      puts "❌ Erreur lors du scraping : #{e.message}"
      puts "ℹ️  Utilisation de données de démonstration..."

      # Données de démo pour tester sans connexion internet
      @emails = {
        "ABLEIGES"   => "mairie.ableiges95@wanadoo.fr",
        "AINCOURT"   => "mairie.aincourt@wanadoo.fr",
        "AMBLEVILLE" => "mairie.ambleville@wanadoo.fr",
        "AMENUCOURT" => "mairie.amenucourt@orange.fr",
        "ANDILLY"    => "mairie@mairie-andilly.fr",
        "ARGENTEUIL" => "contact@mairie-argenteuil.fr",
        "ARNOUVILLE" => "mairie@arnouville.fr",
        "ARRONVILLE" => "mairie.arronville@wanadoo.fr",
        "ARTHIES"    => "mairie.arthies@wanadoo.fr",
        "ATTAINVILLE" => "mairie.attainville@wanadoo.fr"
      }
      puts "✅ #{@emails.count} emails de démo chargés."
    end

    # On retourne le hash rempli
    @emails
  end

  # ----------------------------------------------------------
  # MÉTHODE : save_as_json
  # ----------------------------------------------------------
  # Sauvegarde les emails dans un fichier JSON.
  # JSON (JavaScript Object Notation) ressemble à ça :
  # {
  #   "ABLEIGES": "mairie.ableiges95@wanadoo.fr",
  #   "AINCOURT": "mairie.aincourt@wanadoo.fr"
  # }
  # ----------------------------------------------------------
  def save_as_json
    # On vérifie qu'on a bien des données à sauvegarder
    if @emails.empty?
      puts "⚠️  Aucune donnée à sauvegarder. Lance d'abord #scrape."
      return
    end

    # On définit le chemin du fichier de sortie
    # __dir__ = le dossier où se trouve CE fichier (lib/app/)
    # On remonte de 2 niveaux avec "../.." pour aller à la racine
    # puis on entre dans le dossier "db"
    file_path = File.join(__dir__, "..", "..", "db", "emails.json")

    # On s'assure que le dossier "db" existe
    # FileUtils.mkdir_p crée le dossier (et ses parents) si nécessaire
    require 'fileutils'
    FileUtils.mkdir_p(File.dirname(file_path))

    # On ouvre le fichier en mode écriture ("w" = write)
    # Le bloc "do |file|" ferme automatiquement le fichier après
    File.open(file_path, "w") do |file|
      # JSON.pretty_generate transforme notre hash Ruby en JSON bien indenté
      # to_json marcherait aussi, mais pretty_generate est plus lisible
      file.write(JSON.pretty_generate(@emails))
    end

    puts "💾 Emails sauvegardés en JSON : #{file_path}"
  end

  # ----------------------------------------------------------
  # MÉTHODE : save_as_csv
  # ----------------------------------------------------------
  # Sauvegarde les emails dans un fichier CSV.
  # CSV (Comma-Separated Values) ressemble à ça :
  # Ville,Email
  # ABLEIGES,mairie.ableiges95@wanadoo.fr
  # AINCOURT,mairie.aincourt@wanadoo.fr
  # ----------------------------------------------------------
  def save_as_csv
    if @emails.empty?
      puts "⚠️  Aucune donnée à sauvegarder. Lance d'abord #scrape."
      return
    end

    file_path = File.join(__dir__, "..", "..", "db", "emails.csv")

    require 'fileutils'
    FileUtils.mkdir_p(File.dirname(file_path))

    # CSV.open ouvre un fichier CSV en mode écriture
    # force_quotes: true met des guillemets autour de chaque valeur
    # (utile si les données contiennent des virgules)
    CSV.open(file_path, "w", force_quotes: true) do |csv|
      # On ajoute d'abord une ligne d'en-tête (les noms des colonnes)
      csv << ["Ville", "Email"]

      # Puis on ajoute une ligne pour chaque ville
      # @emails.each parcourt chaque paire clé-valeur du hash
      @emails.each do |city, email|
        csv << [city, email]
      end
    end

    puts "💾 Emails sauvegardés en CSV : #{file_path}"
  end

  # ----------------------------------------------------------
  # MÉTHODE : save_as_spreadsheet
  # ----------------------------------------------------------
  # Crée un fichier Google Spreadsheet lisible (.xlsx) contenant
  # les villes en colonne A et les emails en colonne B.
  #
  # Note : Pour un VRAI Google Sheets, il faudrait l'API Google.
  # Ici on crée un fichier .xlsx compatible avec Google Sheets,
  # Excel, LibreOffice etc. qu'on peut ensuite importer.
  # ----------------------------------------------------------
  def save_as_spreadsheet
    if @emails.empty?
      puts "⚠️  Aucune donnée à sauvegarder. Lance d'abord #scrape."
      return
    end

    # On vérifie si la gem 'caxlsx' est disponible
    # Elle permet de créer des fichiers Excel .xlsx
    begin
      require 'caxlsx'
    rescue LoadError
      puts "❌ La gem 'caxlsx' n'est pas installée."
      puts "   Ajoute 'gem \"caxlsx\"' dans ton Gemfile et lance 'bundle install'"
      puts "   Pour l'instant, on va créer un CSV à la place..."
      save_as_csv
      return
    end

    file_path = File.join(__dir__, "..", "..", "db", "emails.xlsx")

    require 'fileutils'
    FileUtils.mkdir_p(File.dirname(file_path))

    # Caxlsx::Package crée un nouveau fichier Excel
    Caxlsx::Package.new do |package|
      # On ajoute un "workbook" (le classeur)
      package.workbook.add_worksheet(name: "Emails Val d'Oise") do |sheet|

        # Style pour les en-têtes (texte en gras)
        header_style = sheet.styles.add_style(
          b: true,                          # gras (bold)
          bg_color: "4472C4",               # fond bleu
          fg_color: "FFFFFF",               # texte blanc
          alignment: { horizontal: :center }
        )

        # On ajoute la ligne d'en-tête avec le style
        sheet.add_row(["Ville", "Email"], style: header_style)

        # On ajoute une ligne pour chaque email
        @emails.each do |city, email|
          sheet.add_row([city, email])
        end
      end

      # On sauvegarde le fichier
      package.serialize(file_path)
    end

    puts "💾 Emails sauvegardés en Spreadsheet : #{file_path}"
    puts "   Tu peux l'importer dans Google Sheets via Fichier > Importer"
  end

  # ----------------------------------------------------------
  # MÉTHODE : emails (getter)
  # ----------------------------------------------------------
  # Permet d'accéder à @emails depuis l'extérieur de la classe.
  # Exemple : mon_scrapper.emails  => retourne le hash
  # ----------------------------------------------------------
  def emails
    @emails
  end

  # ----------------------------------------------------------
  # MÉTHODE PRIVÉE : Cette zone est "interne" à la classe.
  # Les méthodes ici ne peuvent pas être appelées de l'extérieur.
  # ----------------------------------------------------------
  private

  # Méthode utilitaire pour afficher un séparateur visuel
  def print_separator
    puts "-" * 50
  end

end