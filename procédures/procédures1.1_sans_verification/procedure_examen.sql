-- Procédure pour créer un examen
DELIMITER $$
CREATE PROCEDURE CreateExamen (
    IN p_ID_Cours INT,
    IN p_Date_Examen DATE,
    IN p_Type VARCHAR(255)
)
BEGIN
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
    DELETE FROM Examen WHERE ID_Examen = p_ID_Examen;
END$$
DELIMITER ;
