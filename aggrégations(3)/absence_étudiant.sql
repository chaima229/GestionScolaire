-- Nombre total d'absences par étudiant
DELIMITER $$
CREATE PROCEDURE GetNombreAbsencesParEtudiant ()
BEGIN
    SELECT 
        e.ID_Etudiant,
        u.Nom,
        u.Prenom,
        COUNT(a.ID_Absence) AS Total_Absences
    FROM Absence a
    JOIN Etudiant e ON a.ID_Etudiant = e.ID_Etudiant
    JOIN Utilisateur u ON e.ID_Utilisateur = u.ID_Utilisateur
    GROUP BY e.ID_Etudiant;
END$$
DELIMITER ;
