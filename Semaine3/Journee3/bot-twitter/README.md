# 🤖 Twitter Bot — Hello World

Bot Twitter développé en Ruby qui interagit avec le hashtag `#hello_world`.

## Fonctionnalités

- **2.1** Tweet automatique à 5 journalistes au hasard avec `#hello_world`
- **2.2** Like des 25 derniers tweets contenant `#hello_world`
- **2.3** Follow des 20 derniers comptes ayant tweeté `#hello_world`
- **2.4** Stream en temps réel : like + follow dès qu'un tweet `#hello_world` apparaît

## Installation

```bash
git clone <url_du_repo>
cd twitter_bot
bundle install
rspec --init
```

## Configuration des clés API

1. Crée un compte développeur sur https://developer.twitter.com
2. Crée une application Twitter
3. Copie le fichier `.env.example` en `.env` :
   ```bash
   cp .env.example .env
   ```
4. Remplis `.env` avec tes vraies clés API

⚠️ **Ne jamais commit le fichier `.env` !** Il est dans `.gitignore`.

## Utilisation

```bash
# Lancer le bot complet (tweets + likes + follows)
ruby run.rb

# Lancer uniquement le mode streaming (tourne en continu)
ruby run.rb stream

# Lancer les tests
rspec
```

## Structure du projet

```
twitter_bot/
├── .env                  ← clés secrètes (jamais sur GitHub)
├── .env.example          ← template à copier
├── .gitignore
├── Gemfile
├── README.md
├── run.rb                ← point d'entrée
├── lib/
│   ├── twitter_client.rb ← connexion à l'API
│   └── bot.rb            ← actions du bot
└── spec/
    └── bot_spec.rb       ← tests RSpec
```