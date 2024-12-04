-- Procédure pour créer un emploi du temps
DELIMITER $$
CREATE PROCEDURE CreateEmploiDuTemps (
    IN p_ID_Cours INT,
    IN p_ID_Enseignant INT,
    IN p_ID_Classe INT,
    IN p_Jour VARCHAR(255),
    IN p_Heure_Debut TIME,
    IN p_Heure_Fin TIME
)
BEGIN
    INSERT INTO EmploiDuTemps (ID_Cours, ID_Enseignant, ID_Classe, Jour, Heure_Debut, Heure_Fin)
    VALUES (p_ID_Cours, p_ID_Enseignant, p_ID_Classe, p_Jour, p_Heure_Debut, p_Heure_Fin);
END$$
DELIMITER ;

-- Procédure pour lire un emploi du temps
DELIMITER $$
CREATE PROCEDURE ReadEmploiDuTemps (
    IN p_ID_Edt INT
)
BEGIN
    SELECT * FROM EmploiDuTemps WHERE ID_Edt = p_ID_Edt;
END$$
DELIMITER ;

-- Procédure pour mettre à jour un emploi du temps
DELIMITER $$
CREATE PROCEDURE UpdateEmploiDuTemps (
    IN p_ID_Edt INT,
    IN p_ID_Cours INT,
    IN p_ID_Enseignant INT,
    IN p_ID_Classe INT,
    IN p_Jour VARCHAR(255),
    IN p_Heure_Debut TIME,
    IN p_Heure_Fin TIME
)
BEGIN
    UPDATE EmploiDuTemps
    SET ID_Cours = p_ID_Cours,
        ID_Enseignant = p_ID_Enseignant,
        ID_Classe = p_ID_Classe,
        Jour = p_Jour,
        Heure_Debut = p_Heure_Debut,
        Heure_Fin = p_Heure_Fin
    WHERE ID_Edt = p_ID_Edt;
END$$
DELIMITER ;

-- Procédure pour supprimer un emploi du temps
DELIMITER $$
CREATE PROCEDURE DeleteEmploiDuTemps (
    IN p_ID_Edt INT
)
BEGIN
    DELETE FROM EmploiDuTemps WHERE ID_Edt = p_ID_Edt;
END$$
DELIMITER ;
