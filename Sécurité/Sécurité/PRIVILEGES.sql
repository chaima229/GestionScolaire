-- Créer l'utilisateur admin
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Admin@479@';

-- Attribuer tous les privilèges à l'admin sur la base de données
GRANT ALL PRIVILEGES ON projet_bdd.* TO 'admin_user'@'localhost';


-- Créer l'utilisateur enseignant
CREATE USER 'enseignant_user'@'localhost' IDENTIFIED BY 'enseignant@pass168';

-- Attribuer des privilèges pour l'enseignant (par exemple, lire et écrire dans les tables liées aux cours et examens)
GRANT SELECT, INSERT, UPDATE ON projet_bdd.Cours TO 'enseignant_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON projet_bdd.Examen TO 'enseignant_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON projet_bdd.Note TO 'enseignant_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON projet_bdd.EmploiDuTemps TO 'enseignant_user'@'localhost';
GRANT SELECT, INSERT ON projet_bdd.Absence TO 'enseignant_user'@'localhost';



-- Créer l'utilisateur étudiant
CREATE USER 'etudiant_user'@'localhost' IDENTIFIED BY 'etudiant_password';

-- Attribuer des privilèges de lecture uniquement pour l'étudiant
GRANT SELECT ON projet_bdd.Examen TO 'etudiant_user'@'localhost';
GRANT SELECT ON projet_bdd.Note TO 'etudiant_user'@'localhost';
GRANT SELECT ON projet_bdd.EmploiDuTemps TO 'etudiant_user'@'localhost';
GRANT SELECT ON projet_bdd.Absence TO 'etudiant_user'@'localhost';

-- Appliquer les privilèges
FLUSH PRIVILEGES;


