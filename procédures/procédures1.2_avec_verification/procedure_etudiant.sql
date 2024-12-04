-- Procédure pour créer un nouvel étudiant
DELIMITER $$
CREATE PROCEDURE CreateEtudiant (
    IN p_ID_Utilisateur INT,
    IN p_Date_naissance DATE,
    IN p_Adresse VARCHAR(255),
    IN p_Telephone VARCHAR(15)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Utilisateur WHERE ID_Utilisateur = p_ID_Utilisateur) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Utilisateur non valide.';
    END IF;

    IF p_Telephone NOT REGEXP '^[0-9]+$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Numéro de téléphone invalide.';
    END IF;

    INSERT INTO Etudiant (ID_Utilisateur, Date_naissance, Adresse, Telephone)
    VALUES (p_ID_Utilisateur, p_Date_naissance, p_Adresse, p_Telephone);
END$$
DELIMITER ;


-- Procédure pour lire un étudiant par ID
DELIMITER $$
CREATE PROCEDURE ReadEtudiant (
    IN p_ID_Etudiant INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Etudiant WHERE ID_Etudiant = p_ID_Etudiant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Étudiant non trouvé.';
    END IF;

    SELECT * FROM Etudiant WHERE ID_Etudiant = p_ID_Etudiant;
END$$
DELIMITER ;


-- Procédure pour mettre à jour un étudiant
DELIMITER $$
CREATE PROCEDURE UpdateEtudiant (
    IN p_ID_Etudiant INT,
    IN p_Date_naissance DATE,
    IN p_Adresse VARCHAR(255),
    IN p_Telephone VARCHAR(15)
)
BEGIN

    IF NOT EXISTS (SELECT 1 FROM Etudiant WHERE ID_Etudiant = p_ID_Etudiant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Étudiant non trouvé.';
    END IF;

    IF p_Telephone NOT REGEXP '^[0-9]+$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Numéro de téléphone invalide.';
    END IF;

    UPDATE Etudiant
    SET Date_naissance = p_Date_naissance,
        Adresse = p_Adresse,
        Telephone = p_Telephone
    WHERE ID_Etudiant = p_ID_Etudiant;
END$$
DELIMITER ;


-- Procédure pour supprimer un étudiant
DELIMITER $$
CREATE PROCEDURE DeleteEtudiant (
    IN p_ID_Etudiant INT
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Etudiant WHERE ID_Etudiant = p_ID_Etudiant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Étudiant non trouvé.';
    END IF;

    DELETE FROM Etudiant WHERE ID_Etudiant = p_ID_Etudiant;
END$$
DELIMITER ;

