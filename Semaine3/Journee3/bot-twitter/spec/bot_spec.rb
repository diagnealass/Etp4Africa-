# =============================================================
# FICHIER : spec/bot_spec.rb
# RÔLE    : Tests RSpec — on ne teste QUE la méthode de login
#           comme demandé dans l'exercice 2.5
#
# Pourquoi on ne teste pas les tweets/likes/follows ?
#   => Tester des appels API réels en tests automatisés c'est
#      une mauvaise pratique : ça coûte des crédits API,
#      c'est lent, et ça enverrait de vrais tweets à chaque test !
#      Pour aller plus loin, on utiliserait des "mocks" (faux objets
#      qui simulent l'API sans vraiment l'appeler) — c'est du niveau avancé.
# =============================================================

# On charge les gems nécessaires pour les tests
require 'dotenv/load'   # Pour charger le .env pendant les tests
require 'twitter'       # Pour avoir accès aux classes Twitter

# On charge notre fichier de connexion
require_relative '../lib/twitter_client'


# =============================================================
# DESCRIBE : Tests de la méthode create_twitter_client
# =============================================================
describe "create_twitter_client" do

  # On crée le client UNE FOIS pour tous les tests de ce bloc
  # "let" est une façon RSpec de définir une variable réutilisable.
  # Elle n'est calculée que la première fois qu'on l'appelle.
  let(:client) { create_twitter_client }

  # --- TEST 1 : Le client est du bon type ---
  # On vérifie que la méthode retourne bien un objet Twitter::REST::Client
  # et pas nil, un String, ou n'importe quoi d'autre.
  it "should return a Twitter::REST::Client object" do
    expect(client).to be_a(Twitter::REST::Client)
  end

  # --- TEST 2 : Les clés sont bien configurées ---
  # On vérifie que le client a bien reçu les clés depuis le .env
  # Si .env est mal configuré, ces valeurs seront nil.
  it "should be configured with API credentials from .env" do
    # Le client expose ses clés de configuration
    # On vérifie qu'elles ne sont pas nil (= qu'elles ont bien été lues)
    expect(client.consumer_key).not_to be_nil
    expect(client.consumer_secret).not_to be_nil
    expect(client.access_token).not_to be_nil
    expect(client.access_token_secret).not_to be_nil
  end

  # --- TEST 3 : Les clés correspondent bien à ce qu'il y a dans .env ---
  it "should use the correct API key from environment variables" do
    # ENV['TWITTER_API_KEY'] lit directement le .env (chargé par dotenv)
    # On compare avec ce que le client a reçu
    expect(client.consumer_key).to eq(ENV['TWITTER_API_KEY'])
    expect(client.consumer_secret).to eq(ENV['TWITTER_API_SECRET'])
  end

end