-- Procédure pour créer une inscription
DELIMITER $$
CREATE PROCEDURE CreateInscription (
    IN p_ID_Etudiant INT,
    IN p_ID_Classe INT,
    IN p_Date_inscription DATE
)
BEGIN
    -- Vérifie si l'étudiant existe
    IF NOT EXISTS (SELECT 1 FROM Etudiant WHERE ID_Etudiant = p_ID_Etudiant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Étudiant non trouvé.';
    END IF;

    -- Vérifie si la classe existe
    IF NOT EXISTS (SELECT 1 FROM Classe WHERE ID_Classe = p_ID_Classe) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Classe non trouvée.';
    END IF;

    -- Vérifie que l'étudiant n'est pas déjà inscrit dans cette classe
    IF EXISTS (SELECT 1 FROM Inscription WHERE ID_Etudiant = p_ID_Etudiant AND ID_Classe = p_ID_Classe) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Étudiant déjà inscrit dans cette classe.';
    END IF;

    -- Insère l'inscription
    INSERT INTO Inscription (ID_Etudiant, ID_Classe, Date_inscription)
    VALUES (p_ID_Etudiant, p_ID_Classe, p_Date_inscription);
END$$
DELIMITER ;

-- Procédure pour lire une inscription
DELIMITER $$
CREATE PROCEDURE ReadInscription (
    IN p_ID_Inscription INT
)
BEGIN
    -- Vérifie si l'inscription existe
    IF NOT EXISTS (SELECT 1 FROM Inscription WHERE ID_Inscription = p_ID_Inscription) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Inscription non trouvée.';
    END IF;

    -- Récupère les informations de l'inscription
    SELECT * FROM Inscription WHERE ID_Inscription = p_ID_Inscription;
END$$
DELIMITER ;

-- Procédure pour mettre à jour une inscription
DELIMITER $$
CREATE PROCEDURE UpdateInscription (
    IN p_ID_Inscription INT,
    IN p_ID_Etudiant INT,
    IN p_ID_Classe INT,
    IN p_Date_inscription DATE
)
BEGIN
    -- Vérifie si l'inscription existe
    IF NOT EXISTS (SELECT 1 FROM Inscription WHERE ID_Inscription = p_ID_Inscription) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Inscription non trouvée.';
    END IF;

    -- Vérifie si l'étudiant existe
    IF NOT EXISTS (SELECT 1 FROM Etudiant WHERE ID_Etudiant = p_ID_Etudiant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Étudiant non trouvé.';
    END IF;

    -- Vérifie si la classe existe
    IF NOT EXISTS (SELECT 1 FROM Classe WHERE ID_Classe = p_ID_Classe) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Classe non trouvée.';
    END IF;

    -- Vérifie qu'il n'y a pas de duplication d'inscription
    IF EXISTS (
        SELECT 1 
        FROM Inscription 
        WHERE ID_Etudiant = p_ID_Etudiant AND ID_Classe = p_ID_Classe AND ID_Inscription != p_ID_Inscription
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Étudiant déjà inscrit dans cette classe.';
    END IF;

    -- Met à jour l'inscription
    UPDATE Inscription
    SET ID_Etudiant = p_ID_Etudiant,
        ID_Classe = p_ID_Classe,
        Date_inscription = p_Date_inscription
    WHERE ID_Inscription = p_ID_Inscription;
END$$
DELIMITER ;

-- Procédure pour supprimer une inscription
DELIMITER $$
CREATE PROCEDURE DeleteInscription (
    IN p_ID_Inscription INT
)
BEGIN
    -- Vérifie si l'inscription existe
    IF NOT EXISTS (SELECT 1 FROM Inscription WHERE ID_Inscription = p_ID_Inscription) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Inscription non trouvée.';
    END IF;

    -- Supprime l'inscription
    DELETE FROM Inscription WHERE ID_Inscription = p_ID_Inscription;
END$$
DELIMITER ;
