-- Version SQL de conception_bdd.txt
-- Chaque section correspond a un exercice independant.

-- =========================================================
-- MOOCademy
-- =========================================================
CREATE TABLE courses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE lessons (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  course_id INTEGER NOT NULL,
  FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Relation: 1-N entre courses et lessons
-- Un cours a plusieurs lecons, une lecon appartient a un seul cours.

-- =========================================================
-- The Pinterest
-- =========================================================
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL
);

CREATE TABLE pins (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  image_url TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  pin_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (pin_id) REFERENCES pins(id)
);

-- Relations:
-- 1-N entre users et pins
-- 1-N entre pins et comments
-- 1-N entre users et comments

-- =========================================================
-- The News
-- =========================================================
CREATE TABLE news_users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL
);

CREATE TABLE links (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  url TEXT NOT NULL,
  title TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES news_users(id)
);

CREATE TABLE news_comments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  link_id INTEGER NOT NULL,
  parent_comment_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES news_users(id),
  FOREIGN KEY (link_id) REFERENCES links(id),
  FOREIGN KEY (parent_comment_id) REFERENCES news_comments(id)
);

-- Relations:
-- 1-N entre users et links
-- 1-N entre links et comments
-- 1-N entre comments et comments (auto-reference)
-- parent_comment_id NULL = commentaire direct sur le lien
-- parent_comment_id rempli = reponse a un autre commentaire

-- =========================================================
-- The Class
-- =========================================================
CREATE TABLE class_courses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL
);

CREATE TABLE students (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  course_id INTEGER NOT NULL,
  FOREIGN KEY (course_id) REFERENCES class_courses(id)
);

-- Relation: 1-N entre class_courses et students
-- Un cours a plusieurs eleves, un eleve est inscrit a un seul cours.
