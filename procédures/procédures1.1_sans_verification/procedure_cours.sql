-- Procédure pour créer un nouveau cours
DELIMITER $$
CREATE PROCEDURE CreateCours (
    IN p_Nom_Cours VARCHAR(255),
    IN p_Description TEXT,
    IN p_Credit INT
)
BEGIN
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
    DELETE FROM Cours WHERE ID_Cours = p_ID_Cours;
END$$
DELIMITER ;
