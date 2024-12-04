-- Durée moyenne des cours par jour.
DELIMITER $$
CREATE PROCEDURE GetDureeMoyenneCoursParJour ()
BEGIN
    SELECT 
        Jour,
        AVG(TIMESTAMPDIFF(MINUTE, Heure_Debut, Heure_Fin)) AS Duree_Moyenne_Minutes
    FROM EmploiDuTemps
    GROUP BY Jour;
END$$
DELIMITER ;
