-- Emploi du Temps d’un Enseignant
DELIMITER $$
CREATE PROCEDURE GetEmploiDuTempsByEnseignant (
    IN p_ID_Enseignant INT
)
BEGIN
    SELECT 
        e.ID_Enseignant,
        u.Nom AS Nom_Enseignant,
        c.Nom_Cours,
        cl.Nom_Classe,
        edt.Jour,
        edt.Heure_Debut,
        edt.Heure_Fin
    FROM EmploiDuTemps edt
    JOIN Enseignant e ON edt.ID_Enseignant = e.ID_Enseignant
    JOIN Utilisateur u ON e.ID_Utilisateur = u.ID_Utilisateur
    JOIN Cours c ON edt.ID_Cours = c.ID_Cours
    JOIN Classe cl ON edt.ID_Classe = cl.ID_Classe
    WHERE e.ID_Enseignant = p_ID_Enseignant;
END$$
DELIMITER ;
