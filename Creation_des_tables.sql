-- creation de la base de données
CREATE DATABASE IF NOT EXISTS projet_bdd;
USE projet_bdd;
 -- Table Utilisateur
CREATE TABLE Utilisateur (
  ID_Utilisateur INT PRIMARY KEY AUTO_INCREMENT,
  Nom VARCHAR(255),
  Prenom VARCHAR(255),
  Email VARCHAR(255) UNIQUE,
  Mot_de_passe VARCHAR(255),
  Role VARCHAR(255)
);

-- Table Etudiant
CREATE TABLE Etudiant (
  ID_Etudiant INT PRIMARY KEY,
  ID_Utilisateur INT,
  Date_naissance DATE,
  Adresse VARCHAR(255),
  Telephone VARCHAR(15),
  FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID_Utilisateur)
);

-- Table Enseignant
CREATE TABLE Enseignant (
  ID_Enseignant INT PRIMARY KEY,
  ID_Utilisateur INT,
  Departement VARCHAR(255),
  Specialite VARCHAR(255),
  FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID_Utilisateur)
);

-- Table Cours
CREATE TABLE Cours (
  ID_Cours INT PRIMARY KEY AUTO_INCREMENT,
  Nom_Cours VARCHAR(255),
  Description TEXT,
  Credit INT
);

-- Table Classe
CREATE TABLE Classe (
  ID_Classe INT PRIMARY KEY AUTO_INCREMENT,
  Nom_Classe VARCHAR(255),
  Niveau VARCHAR(255)
);

-- Table Inscription
CREATE TABLE Inscription (
  ID_Inscription INT PRIMARY KEY AUTO_INCREMENT,
  ID_Etudiant INT,
  ID_Classe INT,
  Date_inscription DATE,
  FOREIGN KEY (ID_Etudiant) REFERENCES Etudiant(ID_Etudiant),
  FOREIGN KEY (ID_Classe) REFERENCES Classe(ID_Classe)
);

-- Table EmploiDuTemps
CREATE TABLE EmploiDuTemps (
  ID_Edt INT PRIMARY KEY AUTO_INCREMENT,
  ID_Cours INT,
  ID_Enseignant INT,
  ID_Classe INT,
  Jour VARCHAR(255),
  Heure_Debut TIME,
  Heure_Fin TIME,
  FOREIGN KEY (ID_Cours) REFERENCES Cours(ID_Cours),
  FOREIGN KEY (ID_Enseignant) REFERENCES Enseignant(ID_Enseignant),
  FOREIGN KEY (ID_Classe) REFERENCES Classe(ID_Classe)
);



-- Table Examen
CREATE TABLE Examen (
  ID_Examen INT PRIMARY KEY AUTO_INCREMENT,
  ID_Cours INT,
  Date_Examen DATE,
  Type VARCHAR(255),
  FOREIGN KEY (ID_Cours) REFERENCES Cours(ID_Cours)
);
-- Table Note
CREATE TABLE Note (
  ID_Note INT PRIMARY KEY AUTO_INCREMENT,
  ID_Etudiant INT,
  ID_Cours INT,
  Note DECIMAL(5, 2),
  Date_Saisie DATE,
  ID_Examen INT,
  FOREIGN KEY (ID_Etudiant) REFERENCES Etudiant(ID_Etudiant),
  FOREIGN KEY (ID_Cours) REFERENCES Cours(ID_Cours),
  FOREIGN KEY (ID_Examen) REFERENCES Examen(ID_Examen)
);

-- Table Absence
CREATE TABLE Absence (
  ID_Absence INT PRIMARY KEY AUTO_INCREMENT,
  ID_Etudiant INT,
  Date DATE,
  Motif VARCHAR(255),
  FOREIGN KEY (ID_Etudiant) REFERENCES Etudiant(ID_Etudiant)
);
