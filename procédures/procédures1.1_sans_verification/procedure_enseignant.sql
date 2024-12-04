-- Procédure pour créer un enseignant
DELIMITER $$
CREATE PROCEDURE CreateEnseignant (
    IN p_ID_Utilisateur INT,
    IN p_Departement VARCHAR(255),
    IN p_Specialite VARCHAR(255)
)
BEGIN
    INSERT INTO Enseignant (ID_Utilisateur, Departement, Specialite)
    VALUES (p_ID_Utilisateur, p_Departement, p_Specialite);
END$$
DELIMITER ;

-- Procédure pour lire un enseignant
DELIMITER $$
CREATE PROCEDURE ReadEnseignant (
    IN p_ID_Enseignant INT
)
BEGIN
    SELECT * FROM Enseignant WHERE ID_Enseignant = p_ID_Enseignant;
END$$
DELIMITER ;

-- Procédure pour mettre à jour un enseignant
DELIMITER $$
CREATE PROCEDURE UpdateEnseignant (
    IN p_ID_Enseignant INT,
    IN p_Departement VARCHAR(255),
    IN p_Specialite VARCHAR(255)
)
BEGIN
    UPDATE Enseignant
    SET Departement = p_Departement,
        Specialite = p_Specialite
    WHERE ID_Enseignant = p_ID_Enseignant;
END$$
DELIMITER ;

-- Procédure pour supprimer un enseignant
DELIMITER $$
CREATE PROCEDURE DeleteEnseignant (
    IN p_ID_Enseignant INT
)
BEGIN
    DELETE FROM Enseignant WHERE ID_Enseignant = p_ID_Enseignant;
END$$
DELIMITER ;
