-- Procédure pour créer une note
DELIMITER $$
CREATE PROCEDURE CreateNote (
    IN p_ID_Etudiant INT,
    IN p_ID_Cours INT,
    IN p_Note DECIMAL(5, 2),
    IN p_Date_Saisie DATE,
    IN p_ID_Examen INT
)
BEGIN
    INSERT INTO Note (ID_Etudiant, ID_Cours, Note, Date_Saisie, ID_Examen)
    VALUES (p_ID_Etudiant, p_ID_Cours, p_Note, p_Date_Saisie, p_ID_Examen);
END$$
DELIMITER ;

-- Procédure pour lire une note
DELIMITER $$
CREATE PROCEDURE ReadNote (
    IN p_ID_Note INT
)
BEGIN
    SELECT * FROM Note WHERE ID_Note = p_ID_Note;
END$$
DELIMITER ;

-- Procédure pour mettre à jour une note
DELIMITER $$
CREATE PROCEDURE UpdateNote (
    IN p_ID_Note INT,
    IN p_ID_Etudiant INT,
    IN p_ID_Cours INT,
    IN p_Note DECIMAL(5, 2),
    IN p_Date_Saisie DATE,
    IN p_ID_Examen INT
)
BEGIN
    UPDATE Note
    SET ID_Etudiant = p_ID_Etudiant,
        ID_Cours = p_ID_Cours,
        Note = p_Note,
        Date_Saisie = p_Date_Saisie,
        ID_Examen = p_ID_Examen
    WHERE ID_Note = p_ID_Note;
END$$
DELIMITER ;

-- Procédure pour supprimer une note
DELIMITER $$
CREATE PROCEDURE DeleteNote (
    IN p_ID_Note INT
)
BEGIN
    DELETE FROM Note WHERE ID_Note = p_ID_Note;
END$$
DELIMITER ;
