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
    DELETE FROM Utilisateur WHERE ID_Utilisateur = p_ID_Utilisateur;
END$$
DELIMITER ;
