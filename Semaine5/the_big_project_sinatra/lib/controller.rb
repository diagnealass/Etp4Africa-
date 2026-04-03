require 'gossip'  # Importe la classe qui gère les potins

# Le contrôleur principal : c'est comme le chef d'orchestre du site web
# Il décide quoi afficher quand quelqu'un visite une page
class ApplicationController < Sinatra::Base

  # Page d'accueil : quand quelqu'un va sur le site, on montre tous les potins
  get '/' do
    erb :index, locals: { gossips: Gossip.all }  # Charge la page d'accueil avec la liste des potins
  end

  # Page pour créer un nouveau potin : affiche le formulaire
  get '/gossips/new' do
    erb :new_gossip  # Montre la page avec le formulaire pour écrire un potin
  end

  # Quand on envoie le formulaire : sauvegarde le nouveau potin et retourne à l'accueil
  post '/gossips/new' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save  # Crée et enregistre le potin
    redirect '/'  # Redirige vers la page d'accueil
  end

  # Page pour voir un potin spécifique : trouve le potin par son numéro et l'affiche
  get '/gossips/:id' do
    gossip = Gossip.find(params['id'])  # Cherche le potin demandé
    erb :show, locals: { gossip: gossip }  # Montre la page de détail du potin
  end

end