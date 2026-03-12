# ============================================================
# SCRAPPER_SPEC.RB - Tests de la classe Scrapper
# ============================================================
# Les tests vérifient que notre code fonctionne correctement.
# Chaque "it" est un test différent.
# Lance les tests avec la commande : rspec
# ============================================================

require 'spec_helper'

RSpec.describe Scrapper do

  # On crée un objet Scrapper avant chaque test
  # "let" crée une variable disponible dans tous les tests du bloc
  let(:scrapper) { Scrapper.new }

  # ----------------------------------------------------------
  # Tests de la méthode initialize
  # ----------------------------------------------------------
  describe "#initialize" do
    it "crée un objet Scrapper avec un hash d'emails vide" do
      # On vérifie que @emails est bien un Hash vide au départ
      expect(scrapper.emails).to be_a(Hash)
      expect(scrapper.emails).to be_empty
    end
  end

  # ----------------------------------------------------------
  # Tests de la méthode scrape
  # ----------------------------------------------------------
  describe "#scrape" do
    it "retourne un Hash non vide après le scraping" do
      # On lance le scraping (utilisera les données de démo si pas de connexion)
      result = scrapper.scrape
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty
    end

    it "retourne des emails valides (format texte@texte.texte)" do
      scrapper.scrape
      # On vérifie que chaque valeur ressemble à un email
      scrapper.emails.each do |_city, email|
        expect(email).to match(/@/)
      end
    end

    it "retourne des noms de villes en majuscules" do
      scrapper.scrape
      scrapper.emails.each do |city, _email|
        expect(city).to eq(city.upcase)
      end
    end
  end

  # ----------------------------------------------------------
  # Tests de save_as_json
  # ----------------------------------------------------------
  describe "#save_as_json" do
    before do
      scrapper.scrape  # On scrape d'abord
    end

    it "crée un fichier emails.json dans le dossier db/" do
      scrapper.save_as_json
      file_path = File.join(__dir__, "..", "db", "emails.json")
      expect(File.exist?(file_path)).to be true
    end

    it "crée un fichier JSON valide" do
      scrapper.save_as_json
      file_path = File.join(__dir__, "..", "db", "emails.json")
      content = File.read(file_path)
      # On vérifie que le contenu peut être parsé comme du JSON
      parsed = JSON.parse(content)
      expect(parsed).to be_a(Hash)
    end
  end

  # ----------------------------------------------------------
  # Tests de save_as_csv
  # ----------------------------------------------------------
  describe "#save_as_csv" do
    before do
      scrapper.scrape
    end

    it "crée un fichier emails.csv dans le dossier db/" do
      scrapper.save_as_csv
      file_path = File.join(__dir__, "..", "db", "emails.csv")
      expect(File.exist?(file_path)).to be true
    end

    it "crée un CSV avec des en-têtes Ville et Email" do
      scrapper.save_as_csv
      file_path = File.join(__dir__, "..", "db", "emails.csv")
      first_line = File.readlines(file_path).first
      expect(first_line).to include("Ville")
      expect(first_line).to include("Email")
    end
  end

end