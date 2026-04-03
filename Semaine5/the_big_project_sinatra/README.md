# 🗞️ The Gossip Project - Sinatra

Une application web de potins construite avec Ruby et Sinatra.

## 📖 Description

The Gossip Project est une application web qui permet à des utilisateurs de partager des potins sur leurs camarades. Ce projet a été construit avec Sinatra, un framework Ruby minimaliste, dans le cadre d'une formation Rails.

## ✨ Fonctionnalités

- 📋 Afficher tous les potins sur la page d'accueil
- ✏️ Créer un nouveau potin via un formulaire
- 👁️ Voir le détail d'un potin sur sa propre page
- 💾 Sauvegarde des potins dans une base de données CSV

## 🏗️ Architecture MVC
```
the_big_project_sinatra/
├── Gemfile
├── Gemfile.lock
├── config.ru
├── db/
│   └── gossip.csv
└── lib/
    ├── controller.rb
    ├── gossip.rb
    └── views/
        ├── index.erb
        ├── new_gossip.erb
        └── show.erb
```

## 🚀 Installation

**1. Clone le projet :**
```bash
git clone https://github.com/DickoElhadjSekou4/the_big_project_sinatra.git
cd the_big_project_sinatra
```

**2. Installe les dépendances :**
```bash
bundle config set --local path 'vendor/bundle'
bundle install
```

**3. Lance le serveur :**
```bash
bundle exec rackup -p 4567
```

**4. Ouvre ton navigateur sur :**
```
http://localhost:4567
```

## 🛠️ Technologies utilisées

- **Ruby** 3.2.3
- **Sinatra** - Framework web Ruby
- **ERB** - Templates HTML dynamiques
- **CSV** - Base de données simple
- **WEBrick** - Serveur web local

## 📚 Ce que j'ai appris

- Créer et lancer un serveur local avec Sinatra
- Comprendre les requêtes HTTP GET et POST
- Organiser son code en architecture MVC
- Créer des routes et des vues ERB
- Utiliser les formulaires HTML pour envoyer des données
- Sauvegarder et lire des données dans un fichier CSV
- Passer des variables du controller aux vues
- Utiliser les URLs dynamiques avec `:id`

## 👨‍💻 Auteur

**Elhadj Sekou Dicko** - Formation Rails 2026