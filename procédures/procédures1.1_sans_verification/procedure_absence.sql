-- Procédure pour créer une absence
DELIMITER $$
CREATE PROCEDURE CreateAbsence (
    IN p_ID_Etudiant INT,
    IN p_Date DATE,
    IN p_Motif VARCHAR(255)
)
BEGIN
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
    DELETE FROM Absence WHERE ID_Absence = p_ID_Absence;
END$$
DELIMITER ;
