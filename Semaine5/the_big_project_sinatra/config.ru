# Fichier de configuration pour lancer l'application "The Gossip Project"
# Ce fichier dit à l'ordinateur comment démarrer le site web.
# Il charge les outils nécessaires (comme Sinatra) et lance le contrôleur principal.

require 'bundler'  # Charge l'outil qui gère les extensions (gems) du projet
Bundler.require    # Active toutes les extensions listées dans le fichier Gemfile

$:.unshift File.expand_path("./../lib", __FILE__)  # Ajoute le dossier "lib" au chemin de recherche pour trouver nos fichiers Ruby

require 'controller'  # Importe le fichier qui gère les pages du site

run ApplicationController  # Lance l'application web en utilisant le contrôleur principal