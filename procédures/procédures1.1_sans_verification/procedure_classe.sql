-- Procédure pour créer une classe
DELIMITER $$
CREATE PROCEDURE CreateClasse (
    IN p_Nom_Classe VARCHAR(255),
    IN p_Niveau VARCHAR(255)
)
BEGIN
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
    DELETE FROM Classe WHERE ID_Classe = p_ID_Classe;
END$$
DELIMITER ;
