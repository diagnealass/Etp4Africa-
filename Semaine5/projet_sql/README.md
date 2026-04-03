# Projet SQL — Bases de données relationnelles

## Introduction

Ce projet a été réalisé dans le cadre d'une formation avec ETP4 Il constitue ma première expérience concrète avec les bases de données relationnelles et le langage SQL. L'objectif était de comprendre comment concevoir, créer et interroger des bases de données en utilisant SQLite3 sous Ubuntu.

---

## Structure du projet

### 1. BDD Blog (`blog.sqlite`)
La première base de données modélise une application de blogging. Elle contient une table `users` pour les utilisateurs, une table `articles` liée aux utilisateurs via une clé étrangère `user_id`, une table `categories` et une table `tags`. Les relations N-N entre `articles` et `categories` d'une part, et entre `categories` et `tags` d'autre part, sont gérées via des tables intermédiaires (`articles_categories` et `categories_tags`).

### 2. Conception des BDD (`conception_bdd.txt`)
Ce fichier contient la conception écrite (tables, attributs, relations) de quatre applications différentes : MOOCademy (plateforme de cours en ligne), The Pinterest (partage d'images avec commentaires), The News (message board avec commentaires imbriqués) et The Class (inscription d'élèves à des cours). Cette étape de conception sans code est essentielle avant toute implémentation.

### 3. Requêtes sur la BDD musicale (`chinook.db`)
La base de données Chinook est une base existante représentant une boutique de musique en ligne. J'ai effectué une dizaine de requêtes SQL dessus : récupération d'albums, filtrage avec `LIKE`, comptage avec `COUNT`, suppression avec `DELETE`, jointures entre plusieurs tables avec `JOIN`, et agrégations avec `SUM`. J'ai également ajouté mon artiste favori et ses données dans les tables `artists`, `albums` et `tracks`.

### 4. BDD des applications conçues (`moocademy.db`, `pinterest.db`, `thenews.db`, `theclass.db`)
Après les avoir conçues sur papier, j'ai implémenté en SQLite3 les quatre bases de données. La plus intéressante est celle de The News, qui utilise une auto-référence dans la table `comments` via une colonne `parent_comment_id` — ce qui permet à un commentaire de savoir s'il répond à un lien ou à un autre commentaire.

---

## Comment explorer ce projet

Pour ouvrir et explorer n'importe quelle base de données du projet, il suffit d'avoir SQLite3 installé sur sa machine et de taper dans le terminal :

```bash
sqlite3 nom_du_fichier.db
```

Puis d'activer un affichage lisible avec :

```sql
.mode column
.headers on
.tables
```

---

## Auteur

**Elhadj Sekou Dicko**
