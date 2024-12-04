-- Procédure pour créer un nouveau cours
DELIMITER $$
CREATE PROCEDURE CreateCours (
    IN p_Nom_Cours VARCHAR(255),
    IN p_Description TEXT,
    IN p_Credit INT
)
BEGIN
    -- Vérifie que le nom du cours n'est pas vide
    IF p_Nom_Cours IS NULL OR p_Nom_Cours = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le nom du cours ne peut pas être vide.';
    END IF;

    -- Vérifie que le crédit est positif
    IF p_Credit <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le crédit doit être un nombre positif.';
    END IF;

    -- Insère le cours
    INSERT INTO Cours (Nom_Cours, Description, Credit)
    VALUES (p_Nom_Cours, p_Description, p_Credit);
END$$
DELIMITER ;


-- Procédure pour lire un cours par ID
DELIMITER $$
CREATE PROCEDURE ReadCours (
    IN p_ID_Cours INT
)
BEGIN
    -- Vérifie si le cours existe
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE ID_Cours = p_ID_Cours) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cours non trouvé.';
    END IF;

    -- Récupère les informations du cours
    SELECT * FROM Cours WHERE ID_Cours = p_ID_Cours;
END$$
DELIMITER ;


-- Procédure pour mettre à jour un cours
DELIMITER $$
CREATE PROCEDURE UpdateCours (
    IN p_ID_Cours INT,
    IN p_Nom_Cours VARCHAR(255),
    IN p_Description TEXT,
    IN p_Credit INT
)
BEGIN
    -- Vérifie si le cours existe
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE ID_Cours = p_ID_Cours) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cours non trouvé.';
    END IF;

    -- Vérifie que le nom du cours n'est pas vide
    IF p_Nom_Cours IS NULL OR p_Nom_Cours = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le nom du cours ne peut pas être vide.';
    END IF;

    -- Vérifie que le crédit est positif
    IF p_Credit <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le crédit doit être un nombre positif.';
    END IF;

    -- Met à jour le cours
    UPDATE Cours
    SET Nom_Cours = p_Nom_Cours,
        Description = p_Description,
        Credit = p_Credit
    WHERE ID_Cours = p_ID_Cours;
END$$
DELIMITER ;


-- Procédure pour supprimer un cours
DELIMITER $$
CREATE PROCEDURE DeleteCours (
    IN p_ID_Cours INT
)
BEGIN
    -- Vérifie si le cours existe
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE ID_Cours = p_ID_Cours) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cours non trouvé.';
    END IF;

    -- Supprime le cours
    DELETE FROM Cours WHERE ID_Cours = p_ID_Cours;
END$$
DELIMITER ;

