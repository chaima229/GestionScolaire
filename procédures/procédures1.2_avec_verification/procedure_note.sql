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
    -- Vérifie si l'étudiant existe
    IF NOT EXISTS (SELECT 1 FROM Etudiant WHERE ID_Etudiant = p_ID_Etudiant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Étudiant non trouvé.';
    END IF;

    -- Vérifie si le cours existe
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE ID_Cours = p_ID_Cours) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cours non trouvé.';
    END IF;

    -- Vérifie si l'examen existe
    IF NOT EXISTS (SELECT 1 FROM Examen WHERE ID_Examen = p_ID_Examen) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Examen non trouvé.';
    END IF;

    -- Vérifie que la note est dans une plage valide (par exemple 0-20)
    IF p_Note < 0 OR p_Note > 20 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La note doit être entre 0 et 20.';
    END IF;

    -- Insère la note
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
    -- Vérifie si la note existe
    IF NOT EXISTS (SELECT 1 FROM Note WHERE ID_Note = p_ID_Note) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Note non trouvée.';
    END IF;

    -- Récupère les informations de la note
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
    -- Vérifie si la note existe
    IF NOT EXISTS (SELECT 1 FROM Note WHERE ID_Note = p_ID_Note) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Note non trouvée.';
    END IF;

    -- Vérifie si l'étudiant existe
    IF NOT EXISTS (SELECT 1 FROM Etudiant WHERE ID_Etudiant = p_ID_Etudiant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Étudiant non trouvé.';
    END IF;

    -- Vérifie si le cours existe
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE ID_Cours = p_ID_Cours) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cours non trouvé.';
    END IF;

    -- Vérifie si l'examen existe
    IF NOT EXISTS (SELECT 1 FROM Examen WHERE ID_Examen = p_ID_Examen) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Examen non trouvé.';
    END IF;

    -- Vérifie que la note est dans une plage valide
    IF p_Note < 0 OR p_Note > 20 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La note doit être entre 0 et 20.';
    END IF;

    -- Met à jour la note
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
    -- Vérifie si la note existe
    IF NOT EXISTS (SELECT 1 FROM Note WHERE ID_Note = p_ID_Note) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Note non trouvée.';
    END IF;

    -- Supprime la note
    DELETE FROM Note WHERE ID_Note = p_ID_Note;
END$$
DELIMITER ;

