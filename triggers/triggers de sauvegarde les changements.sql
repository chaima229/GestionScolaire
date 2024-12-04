-- Création de la table Historique_Utilisateur
CREATE TABLE Historique_Utilisateur (
    ID_Historique INT PRIMARY KEY AUTO_INCREMENT,
    ID_Utilisateur INT,
    Operation VARCHAR(50), -- INSERT, UPDATE, DELETE
    Ancien_Nom VARCHAR(255),
    Ancien_Prenom VARCHAR(255),
    Ancien_Email VARCHAR(255),
    Ancien_Role VARCHAR(255),
    Date_Operation DATETIME
);

-- Trigger pour l'insertion d'un utilisateur
DELIMITER $$
CREATE TRIGGER Trigger_After_Insert_Utilisateur
AFTER INSERT ON Utilisateur
FOR EACH ROW
BEGIN
    INSERT INTO Historique_Utilisateur (
        ID_Utilisateur, Operation, Ancien_Nom, Ancien_Prenom, Ancien_Email, Ancien_Role, Date_Operation
    )
    VALUES (
        NEW.ID_Utilisateur, 'INSERT', NEW.Nom, NEW.Prenom, NEW.Email, NEW.Role, NOW()
    );
END $$ 
DELIMITER ;

-- Trigger pour la mise à jour d'un utilisateur
DELIMITER $$
CREATE TRIGGER Trigger_After_Update_Utilisateur
AFTER UPDATE ON Utilisateur
FOR EACH ROW
BEGIN
    INSERT INTO Historique_Utilisateur (
        ID_Utilisateur, Operation, Ancien_Nom, Ancien_Prenom, Ancien_Email, Ancien_Role, Date_Operation
    )
    VALUES (
        OLD.ID_Utilisateur, 'UPDATE', OLD.Nom, OLD.Prenom, OLD.Email, OLD.Role, NOW()
    );
END $$ 
DELIMITER ;

-- Trigger pour la suppression d'un utilisateur
DELIMITER $$
CREATE TRIGGER Trigger_After_Delete_Utilisateur
AFTER DELETE ON Utilisateur
FOR EACH ROW
BEGIN
    INSERT INTO Historique_Utilisateur (
        ID_Utilisateur, Operation, Ancien_Nom, Ancien_Prenom, Ancien_Email, Ancien_Role, Date_Operation
    )
    VALUES (
        OLD.ID_Utilisateur, 'DELETE', OLD.Nom, OLD.Prenom, OLD.Email, OLD.Role, NOW()
    );
END $$ 
DELIMITER ;

-- Création de la table Historique_Cours
CREATE TABLE Historique_Cours (
    ID_Historique INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cours INT,
    Operation VARCHAR(50),
    Ancien_Nom_Cours VARCHAR(255),
    Ancienne_Description TEXT,
    Ancien_Credit INT,
    Date_Operation DATETIME
);

-- Trigger pour la mise à jour d'un cours
DELIMITER $$
CREATE TRIGGER Trigger_After_Update_Cours
AFTER UPDATE ON Cours
FOR EACH ROW
BEGIN
    INSERT INTO Historique_Cours (
        ID_Cours, Operation, Ancien_Nom_Cours, Ancienne_Description, Ancien_Credit, Date_Operation
    )
    VALUES (
        OLD.ID_Cours, 'UPDATE', OLD.Nom_Cours, OLD.Description, OLD.Credit, NOW()
    );
END $$ 
DELIMITER ;
