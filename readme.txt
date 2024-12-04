```sql
-- Création de la base de données
CREATE DATABASE IF NOT EXISTS projet_bdd;

-- Utilisation de la base de données
USE projet_bdd;

-- Création de la table Utilisateur
CREATE TABLE IF NOT EXISTS Utilisateur (
  ID_Utilisateur INT AUTO_INCREMENT,
  Nom VARCHAR(50) NOT NULL,
  Prenom VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Mot_de_passe VARCHAR(255) NOT NULL,
  Role ENUM('etudiant', 'enseignant', 'administrateur') NOT NULL,
  PRIMARY KEY (ID_Utilisateur)
);

-- Création de la table Etudiant
CREATE TABLE IF NOT EXISTS Etudiant (
  ID_Etudiant INT AUTO_INCREMENT,
  ID_Utilisateur INT NOT NULL,
  PRIMARY KEY (ID_Etudiant),
  FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID_Utilisateur)
);

-- Création de la table Inscription
CREATE TABLE IF NOT EXISTS Inscription (
  ID_Inscription INT AUTO_INCREMENT,
  ID_Etudiant INT NOT NULL,
  ID_Classe INT NOT NULL,
  PRIMARY KEY (ID_Inscription),
  FOREIGN KEY (ID_Etudiant) REFERENCES Etudiant(ID_Etudiant)
);

-- Création de la table Classe
CREATE TABLE IF NOT EXISTS Classe (
  ID_Classe INT AUTO_INCREMENT,
  Nom VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID_Classe)
);

-- Insertion de données dans la table Utilisateur
INSERT INTO Utilisateur (Nom, Prenom, Email, Mot_de_passe, Role)
VALUES ('Dupont', 'Jean', 'jean.dupont@example.com', 'password123', 'etudiant');

-- Insertion de données dans la table Etudiant
INSERT INTO Etudiant (ID_Utilisateur)
VALUES (1);

-- Insertion de données dans la table Inscription
INSERT INTO Inscription (ID_Etudiant, ID_Classe)
VALUES (1, 1);

-- Insertion de données dans la table Classe
INSERT INTO Classe (Nom)
VALUES ('Classe 1');

-- Requête pour lister les étudiants inscrits dans une classe
SELECT Etudiant.ID_Etudiant, Utilisateur.Nom, Utilisateur.Prenom
FROM Inscription
JOIN Etudiant ON Inscription.ID_Etudiant = Etudiant.ID_Etudiant
JOIN Utilisateur ON Etudiant.ID_Utilisateur = Utilisateur.ID_Utilisateur
WHERE Inscription.ID_Classe = 1;
```

Base de Données : projet_bdd

Ce fichier explique comment installer et utiliser la base de données `projet_bdd` à partir des fichiers SQL inclus dans ce dossier, en utilisant MySQL Workbench.

---



## Prérequis
1. Logiciels nécessaires :
   - [MySQL Server](https://dev.mysql.com/downloads/mysql/) (version 8.0 ou supérieure recommandée).
   - [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) (dernière version recommandée).
   
2. Configuration MySQL :
   - Assurez-vous que MySQL Server est en cours d’exécution.
   - Disposez des informations d'accès au serveur MySQL : hôte, port, nom d'utilisateur et mot de passe.

---

## Étapes d'Installation

### 1. Ouvrir le fichier `.sql`
1. Lancez MySQL Workbench.
2. Dans le menu principal, sélectionnez **File > Open SQL Script...**.
3. Naviguez vers le dossier contenant ce fichier et sélectionnez `projet_bdd.sql`.

2. Configurer la connexion à MySQL
 1. Dans MySQL Workbench, configurez une connexion à votre serveur MySQL :
   - Cliquez sur **Database > Manage Connections > New**.
   - Fournissez les détails du serveur MySQL.
   - Testez la connexion pour vérifier son accessibilité.
   
2. Une fois la connexion configurée, cliquez sur **Connect to Database** pour vous connecter.

### 3. Exécuter le script SQL
1. Chargez le fichier `projet_bdd.sql` dans MySQL Workbench.
2. Cliquez sur l’icône **Execute (éclair)** pour exécuter le script et créer la base de données et ses tables.
3. Vérifiez la création avec la commande suivante :
   ```sql
   SHOW DATABASES;
   ```

---

## Utilisation

### 1. Ajouter des données
Pour insérer des données dans les tables, utilisez des requêtes SQL. Exemple :
```sql
INSERT INTO Utilisateur (Nom, Prenom, Email, Mot_de_passe, Role)
VALUES ('Dupont', 'Jean', 'jean.dupont@example.com', 'password123', 'etudiant');
```

### 2. Effectuer des requêtes
Interrogez les tables pour consulter ou manipuler les données. Exemple pour lister les étudiants inscrits dans une classe :
```sql
SELECT Etudiant.ID_Etudiant, Utilisateur.Nom, Utilisateur.Prenom
FROM Inscription
JOIN Etudiant ON Inscription.ID_Etudiant = Etudiant.ID_Etudiant
JOIN Utilisateur ON Etudiant.ID_Utilisateur = Utilisateur.ID_Utilisateur
WHERE Inscription.ID_Classe = 1;
```

---
