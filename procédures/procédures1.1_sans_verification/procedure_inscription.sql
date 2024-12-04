-- Procédure pour créer une inscription
DELIMITER $$
CREATE PROCEDURE CreateInscription (
    IN p_ID_Etudiant INT,
    IN p_ID_Classe INT,
    IN p_Date_inscription DATE
)
BEGIN
    INSERT INTO Inscription (ID_Etudiant, ID_Classe, Date_inscription)
    VALUES (p_ID_Etudiant, p_ID_Classe, p_Date_inscription);
END$$
DELIMITER ;

-- Procédure pour lire une inscription
DELIMITER $$
CREATE PROCEDURE ReadInscription (
    IN p_ID_Inscription INT
)
BEGIN
    SELECT * FROM Inscription WHERE ID_Inscription = p_ID_Inscription;
END$$
DELIMITER ;

-- Procédure pour mettre à jour une inscription
DELIMITER $$
CREATE PROCEDURE UpdateInscription (
    IN p_ID_Inscription INT,
    IN p_ID_Etudiant INT,
    IN p_ID_Classe INT,
    IN p_Date_inscription DATE
)
BEGIN
    UPDATE Inscription
    SET ID_Etudiant = p_ID_Etudiant,
        ID_Classe = p_ID_Classe,
        Date_inscription = p_Date_inscription
    WHERE ID_Inscription = p_ID_Inscription;
END$$
DELIMITER ;

-- Procédure pour supprimer une inscription
DELIMITER $$
CREATE PROCEDURE DeleteInscription (
    IN p_ID_Inscription INT
)
BEGIN
    DELETE FROM Inscription WHERE ID_Inscription = p_ID_Inscription;
END$$
DELIMITER ;
