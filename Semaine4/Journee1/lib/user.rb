# =============================================================
# CLASSE USER
# Une classe, c'est un "moule" pour créer des objets.
# Ici, notre moule va créer des utilisateurs (User).
# =============================================================

class User

  # ----------------------------------------------------------
  # VARIABLE DE CLASSE : @@all
  # ----------------------------------------------------------
  # Les variables qui commencent par @@ sont des "variables de classe".
  # Elles sont PARTAGÉES par TOUS les objets User créés.
  # C'est comme un registre commun à tous les utilisateurs.
  # On initialise un tableau vide [] qui contiendra tous les users.
  # ----------------------------------------------------------
  @@all = []

  # ----------------------------------------------------------
  # attr_accessor
  # ----------------------------------------------------------
  # attr_accessor crée AUTOMATIQUEMENT deux méthodes pour chaque
  # attribut listé :
  #   - un "getter" : permet de LIRE la valeur   → julie.email
  #   - un "setter" : permet de MODIFIER la valeur → julie.email = "new@email.com"
  # ----------------------------------------------------------
  attr_accessor :email, :age

  # ----------------------------------------------------------
  # MÉTHODE INITIALIZE (le constructeur)
  # ----------------------------------------------------------
  # initialize est appelée AUTOMATIQUEMENT quand on fait User.new(...)
  # Les paramètres reçoivent les valeurs passées à .new() :
  #   → User.new("julie@email.com", 32)
  #              ↑ email            ↑ age
  # ----------------------------------------------------------
  def initialize(email, age)
    # @email : variable d'instance. Le @ = appartient à CET objet.
    # Chaque User a son propre @email, indépendant des autres.
    @email = email

    # Idem pour @age
    @age = age

    # self = l'objet en cours de création.
    # On l'ajoute au tableau commun @@all avec <<
    @@all << self
  end

  # ----------------------------------------------------------
  # MÉTHODE DE CLASSE : User.all
  # ----------------------------------------------------------
  # "self." devant le nom = méthode DE CLASSE.
  # On l'appelle sur la classe elle-même : User.all
  # Elle retourne simplement le tableau de tous les users.
  # ----------------------------------------------------------
  def self.all
    @@all
  end

  # ----------------------------------------------------------
  # MÉTHODE DE CLASSE : User.find_by_email
  # ----------------------------------------------------------
  # .find parcourt chaque élément du tableau et retourne
  # le PREMIER qui satisfait la condition du bloc.
  # |user| = variable temporaire représentant chaque user.
  # ----------------------------------------------------------
  def self.find_by_email(email_recherche)
    @@all.find { |user| user.email == email_recherche }
  end

end