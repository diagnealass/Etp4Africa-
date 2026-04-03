require 'csv'  # Outil pour lire et écrire des fichiers CSV (comme Excel mais en texte)

# La classe Gossip représente un potin
# C'est comme une fiche qui contient l'auteur et le contenu du potin
# Elle sait aussi sauvegarder et retrouver les potins dans un fichier
class Gossip
  attr_accessor :author, :content  # Permet de lire et modifier l'auteur et le contenu

  # Crée un nouveau potin avec un auteur et un contenu
  def initialize(author, content)
    @author = author
    @content = content
  end

  # Trouve un potin spécifique par son numéro (comme chercher la ligne X dans une liste)
  def self.find(id)
    all[id.to_i]  # Retourne le potin à la position demandée
    end

  # Sauvegarde ce potin dans le fichier des potins
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|  # Ouvre le fichier en mode ajout
      csv << [@author, @content]  # Ajoute une nouvelle ligne avec auteur et contenu
    end
  end

  # Récupère tous les potins du fichier et les transforme en objets Gossip
  def self.all
    all_gossips = []  # Liste vide pour stocker les potins
    CSV.read("./db/gossip.csv").each do |line|  # Lit chaque ligne du fichier
      all_gossips << Gossip.new(line[0], line[1])  # Crée un objet Gossip pour chaque ligne
    end
    return all_gossips  # Retourne la liste complète
  end

end