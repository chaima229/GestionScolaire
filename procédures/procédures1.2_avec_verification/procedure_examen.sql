-- Procédure pour créer un examen
DELIMITER $$
CREATE PROCEDURE CreateExamen (
    IN p_ID_Cours INT,
    IN p_Date_Examen DATE,
    IN p_Type VARCHAR(255)
)
BEGIN
    -- Vérifie si le cours existe
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE ID_Cours = p_ID_Cours) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cours non trouvé.';
    END IF;

    -- Vérifie que la date de l'examen est dans le futur
    IF p_Date_Examen <= CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "La date de l\'examen doit être dans le futur.";
    END IF;

    -- Insère l'examen
    INSERT INTO Examen (ID_Cours, Date_Examen, Type)
    VALUES (p_ID_Cours, p_Date_Examen, p_Type);
END$$
DELIMITER ;


-- Procédure pour lire un examen
DELIMITER $$
CREATE PROCEDURE ReadExamen (
    IN p_ID_Examen INT
)
BEGIN
    -- Vérifie si l'examen existe
    IF NOT EXISTS (SELECT 1 FROM Examen WHERE ID_Examen = p_ID_Examen) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Examen non trouvé.';
    END IF;

    -- Récupère les informations de l'examen
    SELECT * FROM Examen WHERE ID_Examen = p_ID_Examen;
END$$
DELIMITER ;


-- Procédure pour mettre à jour un examen
DELIMITER $$
CREATE PROCEDURE UpdateExamen (
    IN p_ID_Examen INT,
    IN p_ID_Cours INT,
    IN p_Date_Examen DATE,
    IN p_Type VARCHAR(255)
)
BEGIN
    -- Vérifie si l'examen existe
    IF NOT EXISTS (SELECT 1 FROM Examen WHERE ID_Examen = p_ID_Examen) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Examen non trouvé.';
    END IF;

    -- Vérifie si le cours existe
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE ID_Cours = p_ID_Cours) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cours non trouvé.';
    END IF;

    -- Vérifie que la date de l'examen est dans le futur
    IF p_Date_Examen <= CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La date de l\'examen doit être dans le futur.';
    END IF;

    -- Met à jour l'examen
    UPDATE Examen
    SET ID_Cours = p_ID_Cours,
        Date_Examen = p_Date_Examen,
        Type = p_Type
    WHERE ID_Examen = p_ID_Examen;
END$$
DELIMITER ;


-- Procédure pour supprimer un examen
DELIMITER $$
CREATE PROCEDURE DeleteExamen (
    IN p_ID_Examen INT
)
BEGIN
    -- Vérifie si l'examen existe
    IF NOT EXISTS (SELECT 1 FROM Examen WHERE ID_Examen = p_ID_Examen) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Examen non trouvé.';
    END IF;

    -- Supprime l'examen
    DELETE FROM Examen WHERE ID_Examen = p_ID_Examen;
END$$
DELIMITER ;

