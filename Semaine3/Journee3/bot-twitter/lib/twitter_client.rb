# =============================================================
# FICHIER : lib/twitter_client.rb
# RÔLE    : Établit la connexion à Twitter avec tes clés API
#
# C'est le "badge d'entrée" de la boîte de nuit Twitter.
# Tous les autres fichiers vont utiliser ce client pour
# parler à Twitter.
# =============================================================

# Dotenv charge ton fichier .env et rend tes clés disponibles
# via ENV['NOM_DE_LA_CLE'] partout dans le programme
require 'dotenv/load'

# On charge la gem Twitter
require 'twitter'

# =============================================================
# La méthode create_twitter_client
#
# But    : Créer et retourner un objet "client" connecté à Twitter
# Entrée : rien (elle lit les clés depuis les variables d'environnement)
# Sortie : un objet Twitter::REST::Client prêt à l'emploi
#
# Pourquoi une méthode séparée ?
#   => Pour pouvoir la tester facilement (TDD !)
#   => Pour ne pas répéter la configuration partout dans le code
# =============================================================
def create_twitter_client

  # Twitter::REST::Client est la classe principale de la gem Twitter.
  # On lui passe un bloc "do...end" pour la configurer.
  # C'est comme remplir un formulaire d'accès.
  client = Twitter::REST::Client.new do |config|

    # On lit chaque clé depuis les variables d'environnement
    # ENV['NOM'] cherche la valeur dans le fichier .env chargé par dotenv
    # Si la clé n'existe pas dans .env, ENV['NOM'] retourne nil

    # La clé de ton APPLICATION
    config.consumer_key        = ENV['TWITTER_API_KEY']

    # Le secret de ton APPLICATION
    config.consumer_secret     = ENV['TWITTER_API_SECRET']

    # Le token de ton COMPTE TWITTER
    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']

    # Le secret de ton COMPTE TWITTER
    config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']

  end

  # On retourne le client configuré pour pouvoir l'utiliser ailleurs
  return client

end