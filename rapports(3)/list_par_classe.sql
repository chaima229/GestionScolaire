DELIMITER $$
CREATE PROCEDURE GetEtudiantsByClasse (
    IN p_ID_Classe INT
)
BEGIN
    SELECT 
        e.ID_Etudiant,
        u.Nom,
        u.Prenom,
        u.Email,
        c.Nom_Classe,
        i.Date_inscription
    FROM Inscription i
    JOIN Etudiant e ON i.ID_Etudiant = e.ID_Etudiant
    JOIN Utilisateur u ON e.ID_Utilisateur = u.ID_Utilisateur
    JOIN Classe c ON i.ID_Classe = c.ID_Classe
    WHERE c.ID_Classe = p_ID_Classe;
END$$
DELIMITER ;
