-- Procédure pour créer un nouvel utilisateur
DELIMITER $$
CREATE PROCEDURE CreateUtilisateur (
    IN p_Nom VARCHAR(255),
    IN p_Prenom VARCHAR(255),
    IN p_Email VARCHAR(255),
    IN p_Mot_de_passe VARCHAR(255),
    IN p_Role ENUM('admin', 'utilisateur')
)
BEGIN
    -- Vérifie que l'email est unique
    IF EXISTS (SELECT 1 FROM Utilisateur WHERE Email = p_Email) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email déjà utilisé.';
    END IF;

    -- Valide le format de l'email
    IF p_Email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Format de l\'email invalide.";
    END IF;

    -- Vérifie que le rôle est valide
    IF p_Role NOT IN ('admin', 'utilisateur') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rôle invalide.';
    END IF;

    -- Insère l'utilisateur
    INSERT INTO Utilisateur (Nom, Prenom, Email, Mot_de_passe, Role)
    VALUES (p_Nom, p_Prenom, p_Email, p_Mot_de_passe, p_Role);
END$$
DELIMITER ;



-- Procédure pour lire un utilisateur par ID
DELIMITER $$
CREATE PROCEDURE ReadUtilisateur (
    IN p_ID_Utilisateur INT
)
BEGIN
    -- Vérifie que l'utilisateur existe
    IF NOT EXISTS (SELECT 1 FROM Utilisateur WHERE ID_Utilisateur = p_ID_Utilisateur) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Utilisateur non trouvé.';
    END IF;

    -- Récupère les informations de l'utilisateur
    SELECT * FROM Utilisateur WHERE ID_Utilisateur = p_ID_Utilisateur;
END$$
DELIMITER ;


-- Procédure pour mettre à jour un utilisateur
DELIMITER $$
CREATE PROCEDURE UpdateUtilisateur (
    IN p_ID_Utilisateur INT,
    IN p_Nom VARCHAR(255),
    IN p_Prenom VARCHAR(255),
    IN p_Email VARCHAR(255),
    IN p_Mot_de_passe VARCHAR(255),
    IN p_Role ENUM('admin', 'utilisateur')
)
BEGIN
    -- Vérifie que l'utilisateur existe
    IF NOT EXISTS (SELECT 1 FROM Utilisateur WHERE ID_Utilisateur = p_ID_Utilisateur) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Utilisateur non trouvé.';
    END IF;

    -- Vérifie que l'email est unique s'il est modifié
    IF EXISTS (SELECT 1 FROM Utilisateur WHERE Email = p_Email AND ID_Utilisateur != p_ID_Utilisateur) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email déjà utilisé.';
    END IF;

    -- Valide le format de l'email
    IF p_Email NOT REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Format de l\'email invalide.";
    END IF;

    -- Vérifie que le rôle est valide
    IF p_Role NOT IN ('admin', 'utilisateur') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Rôle invalide.';
    END IF;

    -- Met à jour les informations de l'utilisateur
    UPDATE Utilisateur
    SET Nom = p_Nom,
        Prenom = p_Prenom,
        Email = p_Email,
        Mot_de_passe = p_Mot_de_passe,
        Role = p_Role
    WHERE ID_Utilisateur = p_ID_Utilisateur;
END$$
DELIMITER ;


-- Procédure pour supprimer un utilisateur
DELIMITER $$
CREATE PROCEDURE DeleteUtilisateur (
    IN p_ID_Utilisateur INT
)
BEGIN
    -- Vérifie que l'utilisateur existe
    IF NOT EXISTS (SELECT 1 FROM Utilisateur WHERE ID_Utilisateur = p_ID_Utilisateur) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Utilisateur non trouvé.';
    END IF;

    -- Supprime l'utilisateur
    DELETE FROM Utilisateur WHERE ID_Utilisateur = p_ID_Utilisateur;
END$$
DELIMITER ;

