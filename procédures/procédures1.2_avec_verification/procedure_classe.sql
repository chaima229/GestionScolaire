-- Procédure pour créer une classe
DELIMITER $$
CREATE PROCEDURE CreateClasse (
    IN p_Nom_Classe VARCHAR(255),
    IN p_Niveau VARCHAR(255)
)
BEGIN
    -- Vérifie que le nom de la classe n'est pas vide
    IF p_Nom_Classe IS NULL OR p_Nom_Classe = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le nom de la classe ne peut pas être vide.';
    END IF;

    -- Vérifie que le niveau n'est pas vide
    IF p_Niveau IS NULL OR p_Niveau = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le niveau ne peut pas être vide.';
    END IF;

    -- Insère la classe
    INSERT INTO Classe (Nom_Classe, Niveau)
    VALUES (p_Nom_Classe, p_Niveau);
END$$
DELIMITER ;


-- Procédure pour lire une classe
DELIMITER $$
CREATE PROCEDURE ReadClasse (
    IN p_ID_Classe INT
)
BEGIN
    -- Vérifie si la classe existe
    IF NOT EXISTS (SELECT 1 FROM Classe WHERE ID_Classe = p_ID_Classe) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Classe non trouvée.';
    END IF;

    -- Récupère les informations de la classe
    SELECT * FROM Classe WHERE ID_Classe = p_ID_Classe;
END$$
DELIMITER ;


-- Procédure pour mettre à jour une classe
DELIMITER $$
CREATE PROCEDURE UpdateClasse (
    IN p_ID_Classe INT,
    IN p_Nom_Classe VARCHAR(255),
    IN p_Niveau VARCHAR(255)
)
BEGIN
    -- Vérifie si la classe existe
    IF NOT EXISTS (SELECT 1 FROM Classe WHERE ID_Classe = p_ID_Classe) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Classe non trouvée.';
    END IF;

    -- Vérifie que le nom de la classe n'est pas vide
    IF p_Nom_Classe IS NULL OR p_Nom_Classe = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le nom de la classe ne peut pas être vide.';
    END IF;

    -- Vérifie que le niveau n'est pas vide
    IF p_Niveau IS NULL OR p_Niveau = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le niveau ne peut pas être vide.';
    END IF;

    -- Met à jour les informations de la classe
    UPDATE Classe
    SET Nom_Classe = p_Nom_Classe,
        Niveau = p_Niveau
    WHERE ID_Classe = p_ID_Classe;
END$$
DELIMITER ;


-- Procédure pour supprimer une classe
DELIMITER $$
CREATE PROCEDURE DeleteClasse (
    IN p_ID_Classe INT
)
BEGIN
    -- Vérifie si la classe existe
    IF NOT EXISTS (SELECT 1 FROM Classe WHERE ID_Classe = p_ID_Classe) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Classe non trouvée.';
    END IF;

    -- Supprime la classe
    DELETE FROM Classe WHERE ID_Classe = p_ID_Classe;
END$$
DELIMITER ;

