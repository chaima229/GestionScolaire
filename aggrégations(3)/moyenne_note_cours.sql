-- Procédure pour obtenir la moyenne des notes par cours
DELIMITER $$
CREATE PROCEDURE GetMoyenneParCours ()
BEGIN
    SELECT 
        c.Nom_Cours,
        AVG(n.Note) AS Moyenne_Note
    FROM Note n
    JOIN Cours c ON n.ID_Cours = c.ID_Cours
    GROUP BY c.Nom_Cours;
END$$
DELIMITER ;
