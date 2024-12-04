-- Procédure pour obtenir les notes d'un étudiant
DELIMITER $$
CREATE PROCEDURE GetNotesByEtudiant (
    IN p_ID_Etudiant INT
)
BEGIN
    SELECT 
        c.Nom_Cours,
        n.Note,
        e.Type AS Type_Examen,
        n.Date_Saisie
    FROM Note n
    JOIN Cours c ON n.ID_Cours = c.ID_Cours
    JOIN Examen e ON n.ID_Examen = e.ID_Examen
    WHERE n.ID_Etudiant = p_ID_Etudiant;
END$$
DELIMITER ;
