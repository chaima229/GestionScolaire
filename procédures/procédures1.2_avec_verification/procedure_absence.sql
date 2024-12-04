-- Procédure pour créer une absence
DELIMITER $$
CREATE PROCEDURE CreateAbsence (
    IN p_ID_Etudiant INT,
    IN p_Date DATE,
    IN p_Motif VARCHAR(255)
)
BEGIN
    -- Vérifie si l'étudiant existe
    IF NOT EXISTS (SELECT 1 FROM Etudiant WHERE ID_Etudiant = p_ID_Etudiant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Étudiant non trouvé.';
    END IF;

    -- Vérifie que le motif n'est pas vide
    IF p_Motif IS NULL OR p_Motif = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le motif ne peut pas être vide.';
    END IF;

    -- Insère l'absence
    INSERT INTO Absence (ID_Etudiant, Date, Motif)
    VALUES (p_ID_Etudiant, p_Date, p_Motif);
END$$
DELIMITER ;


-- Procédure pour lire une absence
DELIMITER $$
CREATE PROCEDURE ReadAbsence (
    IN p_ID_Absence INT
)
BEGIN
    -- Vérifie si l'absence existe
    IF NOT EXISTS (SELECT 1 FROM Absence WHERE ID_Absence = p_ID_Absence) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Absence non trouvée.';
    END IF;

    -- Récupère les informations de l'absence
    SELECT * FROM Absence WHERE ID_Absence = p_ID_Absence;
END$$
DELIMITER ;


-- Procédure pour mettre à jour une absence
DELIMITER $$
CREATE PROCEDURE UpdateAbsence (
    IN p_ID_Absence INT,
    IN p_ID_Etudiant INT,
    IN p_Date DATE,
    IN p_Motif VARCHAR(255)
)
BEGIN
    -- Vérifie si l'absence existe
    IF NOT EXISTS (SELECT 1 FROM Absence WHERE ID_Absence = p_ID_Absence) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Absence non trouvée.';
    END IF;

    -- Vérifie si l'étudiant existe
    IF NOT EXISTS (SELECT 1 FROM Etudiant WHERE ID_Etudiant = p_ID_Etudiant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Étudiant non trouvé.';
    END IF;

    -- Vérifie que le motif n'est pas vide
    IF p_Motif IS NULL OR p_Motif = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le motif ne peut pas être vide.';
    END IF;

    -- Met à jour l'absence
    UPDATE Absence
    SET ID_Etudiant = p_ID_Etudiant,
        Date = p_Date,
        Motif = p_Motif
    WHERE ID_Absence = p_ID_Absence;
END$$
DELIMITER ;


-- Procédure pour supprimer une absence
DELIMITER $$
CREATE PROCEDURE DeleteAbsence (
    IN p_ID_Absence INT
)
BEGIN
    -- Vérifie si l'absence existe
    IF NOT EXISTS (SELECT 1 FROM Absence WHERE ID_Absence = p_ID_Absence) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Absence non trouvée.';
    END IF;

    -- Supprime l'absence
    DELETE FROM Absence WHERE ID_Absence = p_ID_Absence;
END$$
DELIMITER ;

