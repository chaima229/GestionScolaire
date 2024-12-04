-- Ajouter un index sur Email, car il est unique et souvent utilisé pour les recherches.
CREATE INDEX idx_email ON Utilisateur(Email);

-- Ajouter un index sur ID_Utilisateur pour améliorer les jointures avec la table Utilisateur.
CREATE INDEX idx_id_utilisateur_etudiant ON Etudiant(ID_Utilisateur);

-- Ajouter un index sur ID_Utilisateur pour les jointures avec la table Utilisateur.
CREATE INDEX idx_id_utilisateur_enseignant ON Enseignant(ID_Utilisateur);

-- Ajouter un index composite sur ID_Etudiant et ID_Classe pour les recherches fréquentes par étudiant et classe.
CREATE INDEX idx_etudiant_classe ON Inscription(ID_Etudiant, ID_Classe);

-- Ajouter un index composite sur ID_Cours, ID_Enseignant, et ID_Classe, car vous ferez probablement des recherches par ces critères.
CREATE INDEX idx_cours_enseignant_classe ON EmploiDuTemps(ID_Cours, ID_Enseignant, ID_Classe);

-- Ajouter un index composite sur ID_Etudiant et ID_Cours pour améliorer les recherches de notes d'un étudiant dans un cours spécifique.
CREATE INDEX idx_etudiant_cours ON Note(ID_Etudiant, ID_Cours);

-- Ajouter un index sur ID_Cours pour accélérer les recherches d'examens associés à un cours.
CREATE INDEX idx_cours_examens ON Examen(ID_Cours);

-- Ajouter un index sur ID_Etudiant pour améliorer les recherches d'absences par étudiant.
CREATE INDEX idx_etudiant_absences ON Absence(ID_Etudiant);







