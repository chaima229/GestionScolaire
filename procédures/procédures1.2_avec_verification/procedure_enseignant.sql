-- Procédure pour créer un enseignant
DELIMITER $$
CREATE PROCEDURE CreateEnseignant (
    IN p_ID_Utilisateur INT,
    IN p_Departement VARCHAR(255),
    IN p_Specialite VARCHAR(255)
)
BEGIN
    -- Vérifie si l'utilisateur existe
    IF NOT EXISTS (SELECT 1 FROM Utilisateur WHERE ID_Utilisateur = p_ID_Utilisateur) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Utilisateur non trouvé.';
    END IF;

    -- Insère l'enseignant
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
    -- Vérifie si l'enseignant existe
    IF NOT EXISTS (SELECT 1 FROM Enseignant WHERE ID_Enseignant = p_ID_Enseignant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Enseignant non trouvé.';
    END IF;

    -- Récupère les informations de l'enseignant
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
    -- Vérifie si l'enseignant existe
    IF NOT EXISTS (SELECT 1 FROM Enseignant WHERE ID_Enseignant = p_ID_Enseignant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Enseignant non trouvé.';
    END IF;

    -- Vérifie que le département et la spécialité ne sont pas vides
    IF p_Departement IS NULL OR p_Departement = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le département ne peut pas être vide.';
    END IF;

    IF p_Specialite IS NULL OR p_Specialite = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La spécialité ne peut pas être vide.';
    END IF;

    -- Met à jour les informations de l'enseignant
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
    -- Vérifie si l'enseignant existe
    IF NOT EXISTS (SELECT 1 FROM Enseignant WHERE ID_Enseignant = p_ID_Enseignant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Enseignant non trouvé.';
    END IF;

    -- Supprime l'enseignant
    DELETE FROM Enseignant WHERE ID_Enseignant = p_ID_Enseignant;
END$$
DELIMITER ;

