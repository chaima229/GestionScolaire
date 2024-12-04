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
    -- Vérifie si le cours existe
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE ID_Cours = p_ID_Cours) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cours non trouvé.';
    END IF;

    -- Vérifie si l'enseignant existe
    IF NOT EXISTS (SELECT 1 FROM Enseignant WHERE ID_Enseignant = p_ID_Enseignant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Enseignant non trouvé.';
    END IF;

    -- Vérifie si la classe existe
    IF NOT EXISTS (SELECT 1 FROM Classe WHERE ID_Classe = p_ID_Classe) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Classe non trouvée.';
    END IF;

    -- Vérifie que l'heure de début est avant l'heure de fin
    IF p_Heure_Debut >= p_Heure_Fin THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L\'heure de début doit être avant l\'heure de fin.';
    END IF;

    -- Vérifie qu'il n'y a pas de conflit d'horaires pour la même classe et jour
    IF EXISTS (SELECT 1 FROM EmploiDuTemps WHERE ID_Classe = p_ID_Classe AND Jour = p_Jour 
               AND (p_Heure_Debut BETWEEN Heure_Debut AND Heure_Fin OR p_Heure_Fin BETWEEN Heure_Debut AND Heure_Fin)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Conflit d\'horaires avec un autre emploi du temps.";
    END IF;

    -- Insère l'emploi du temps
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
    -- Vérifie si l'emploi du temps existe
    IF NOT EXISTS (SELECT 1 FROM EmploiDuTemps WHERE ID_Edt = p_ID_Edt) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Emploi du temps non trouvé.';
    END IF;

    -- Récupère les informations de l'emploi du temps
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
    -- Vérifie si l'emploi du temps existe
    IF NOT EXISTS (SELECT 1 FROM EmploiDuTemps WHERE ID_Edt = p_ID_Edt) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Emploi du temps non trouvé.';
    END IF;

    -- Vérifie si le cours existe
    IF NOT EXISTS (SELECT 1 FROM Cours WHERE ID_Cours = p_ID_Cours) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cours non trouvé.';
    END IF;

    -- Vérifie si l'enseignant existe
    IF NOT EXISTS (SELECT 1 FROM Enseignant WHERE ID_Enseignant = p_ID_Enseignant) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Enseignant non trouvé.';
    END IF;

    -- Vérifie si la classe existe
    IF NOT EXISTS (SELECT 1 FROM Classe WHERE ID_Classe = p_ID_Classe) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Classe non trouvée.';
    END IF;

    -- Vérifie que l'heure de début est avant l'heure de fin
    IF p_Heure_Debut >= p_Heure_Fin THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L\'heure de début doit être avant l\'heure de fin.';
    END IF;

    -- Vérifie qu'il n'y a pas de conflit d'horaires pour la même classe et jour
    IF EXISTS (SELECT 1 FROM EmploiDuTemps WHERE ID_Classe = p_ID_Classe AND Jour = p_Jour 
               AND (p_Heure_Debut BETWEEN Heure_Debut AND Heure_Fin OR p_Heure_Fin BETWEEN Heure_Debut AND Heure_Fin) 
               AND ID_Edt != p_ID_Edt) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Conflit d\'horaires avec un autre emploi du temps.';
    END IF;

    -- Met à jour l'emploi du temps
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
    -- Vérifie si l'emploi du temps existe
    IF NOT EXISTS (SELECT 1 FROM EmploiDuTemps WHERE ID_Edt = p_ID_Edt) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Emploi du temps non trouvé.';
    END IF;

    -- Supprime l'emploi du temps
    DELETE FROM EmploiDuTemps WHERE ID_Edt = p_ID_Edt;
END$$
DELIMITER ;

