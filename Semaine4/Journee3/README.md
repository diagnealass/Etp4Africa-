# 📧 Scrapper d'Emails - Val d'Oise

Projet de scraping des emails des mairies du Val d'Oise avec sauvegarde multi-formats.

## 🚀 Installation
```bash
# 1. Clone le projet
git clone <ton-repo>
cd mon_projet

# 2. Installe les dépendances
bundle install

# 3. Lance le programme
ruby app.rb
```

## 📋 Fonctionnalités

- **Scraping** : récupère les emails des mairies du Val d'Oise
- **JSON** : sauvegarde dans `db/emails.json`
- **CSV** : sauvegarde dans `db/emails.csv`  
- **Spreadsheet** : sauvegarde dans `db/emails.xlsx` (importable dans Google Sheets)

## 🧪 Tests
```bash
rspec
```

## 📁 Structure
```
mon_projet/
├── lib/app/scrapper.rb   ← Classe principale
├── db/                   ← Fichiers générés
├── spec/                 ← Tests
├── app.rb                ← Point d'entrée
└── Gemfile               ← Dépendances
```