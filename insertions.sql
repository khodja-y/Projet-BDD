INSERT INTO date_dim (id, fullDate, day, month, monthNum, year)
SELECT n,
	TO_DATE('31/12/2016','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),
	TO_CHAR(TO_DATE('31/12/2016','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'DD'),
	TO_CHAR(TO_DATE('31/12/2016','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'Month'),
	TO_CHAR(TO_DATE('31/12/2016','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'MM'),
	TO_CHAR(TO_DATE('31/12/2016','DD/MM/YYYY') + NUMTODSINTERVAL(n,'day'),'YYYY')
FROM (
	SELECT level n
	FROM dual
	connect by level <= 365 * 3
);

INSERT INTO time_dim (id, timeFull, timeFull24, heure, heure24, minute, am_pm)
SELECT n as id,
	to_char(t, 'HH:MI:SS AM'),
	to_char(t, 'HH24:MI:SS'),
	to_number(to_char(t, 'HH'), '00'),
	to_number(to_char(t, 'HH24'), '00'),
	to_number(to_char(t, 'MI'), '00'),
	to_char(t, 'AM')
FROM (
	SELECT level n, trunc(sysdate) + (level - 1)/1440 as t
	FROM dual
	connect by level <= 1440
);


INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (1, 'reserve', 0, 0);
INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (2, 'reserve', 0, 1);
INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (3, 'reserve', 1, 0);
INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (4, 'reserve', 1, 1);
INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (5, 'confirme', 0, 0);
INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (6, 'confirme', 0, 1);
INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (7, 'confirme', 1, 0);
INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (8, 'confirme', 1, 1);
INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (9, 'annule', 0, 0);
INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (10, 'annule', 0, 1);
INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (11, 'annule', 1, 0);
INSERT INTO junk_dim (id, statue, deuxPlaces, onlyGirls) VALUES (12, 'annule', 1, 1);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (1, 18, 736, 10, 28, 1);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (23, 25, 1000, 45, 78, 17);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (5, 26, 1211, 65, 45, 2);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (26, 31, 789, 54, 65, 15);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (41, 46, 555, 19, 25, 5);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (45, 46, 870, 12, 13, 10);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (46, 48, 736, 59, 69, 6);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (46, 49, 120, 36, 43, 7);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (56, 60, 600, 1, 5, 1);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (56, 60, 665, 89, 74, 9);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (63, 65, 785, 12, 65, 17);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (65, 84, 265, 95, 45, 8);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (87, 90, 991, 25, 42, 4);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (90, 91, 1021, 42, 78, 3);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (78, 96, 1021, 42, 35, 2);
INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_conducteur) VALUES (90, 98, 991, 78, 35, 4);
INSERT INTO recherche (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_utilisateur) VALUES (1, 18, 780, 10, 28, 9);
INSERT INTO recherche (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_utilisateur) VALUES (1, 18, 500, 10, 28, 13);
INSERT INTO recherche (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_utilisateur) VALUES (5, 26, 250, 65, 45, 15);
INSERT INTO recherche (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_utilisateur) VALUES (222, 224, 1020, 78, 96, 16);
INSERT INTO recherche (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_utilisateur) VALUES (475, 478, 265, 73, 15, 16);
INSERT INTO recherche (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_utilisateur) VALUES (566, 568, 1000, 45, 97, 16);
INSERT INTO recherche (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_utilisateur) VALUES (658, 660, 985, 82, 85, 3);
INSERT INTO recherche (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_utilisateur) VALUES (1000, 1001, 500, 1, 10, 1);
INSERT INTO recherche (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_utilisateur) VALUES (1050, 1050, 999, 36, 54, 19);
INSERT INTO recherche (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_utilisateur) VALUES (1080, 1085, 982, 24, 45, 9);
INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, id_junk, num_trajet, nombrePlace, prixPlace, prixTotal) VALUES (17, 600, 10, 28, 18, 2, 1, 1, 1, 2, 12, 24);
INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, id_junk, num_trajet, nombrePlace, prixPlace, prixTotal) VALUES (17, 800, 10, 28, 18, 19, 1, 1, 1, 1, 12, 12);
INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, id_junk, num_trajet, nombrePlace, prixPlace, prixTotal) VALUES (24, 500, 45, 78, 25, 1, 17, 5, 2, 1, 15, 15);
INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, id_junk, num_trajet, nombrePlace, prixPlace, prixTotal) VALUES (25, 450, 45, 78, 25, 2, 17, 5, 2, 2, 15, 30);
INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, id_junk, num_trajet, nombrePlace, prixPlace, prixTotal) VALUES (25, 900, 65, 45, 26, 6, 2, 4, 3, 2, 10, 20);
INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, id_junk, num_trajet, nombrePlace, prixPlace, prixTotal) VALUES (30, 650, 54, 65, 31, 4, 15, 9, 4, 1, 45, 45);
INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, id_junk, num_trajet, nombrePlace, prixPlace, prixTotal) VALUES (30, 895, 54, 65, 31, 5, 15, 9, 4, 2, 45, 90);
INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, id_junk, num_trajet, nombrePlace, prixPlace, prixTotal) VALUES (45, 350, 19, 25, 46, 1, 5, 2, 5, 1, 17, 17);
INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, id_junk, num_trajet, nombrePlace, prixPlace, prixTotal) VALUES (45, 480, 19, 25, 46, 8, 5, 2, 5, 1, 17, 17);
INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, id_junk, num_trajet, nombrePlace, prixPlace, prixTotal) VALUES (46, 400, 19, 25, 46, 19, 5, 2, 5, 1, 17, 17);
INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, id_junk, num_trajet, nombrePlace, prixPlace, prixTotal) VALUES (46, 557, 12, 13, 46, 3, 10, 2, 6, 2, 13, 26);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (1, 'ALLON', 'LEVY', 'AL', '1986', 'F', 'debutant', 2, 0, 1, 2, 'LAVAGE');
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (2, 'BACARD', 'HUGO', 'BH', '1966', 'M', 'expert', 2, 1, 2, 2, 'LAVAGE');
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (3, 'CEBALLOS', 'CESAR', 'CC', '1991', 'F', 'confirme', 1, 0, 1, 1, 'LAVAGE');
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (4, 'DOCOMPO', 'ROI', 'DR', '1985', 'M', 'ambassadeur', 2, 0, 1, 0, 'LAVAGE');
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (5, 'ERIKSON', 'DENIS', 'ED', '1978', 'H', 'debutant', 1, 1, 0, 2, 'CARBURANT');
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (6, 'HERBLOT', 'MATHILDE', 'HM', '1982', 'F', 'confirme', 2, 0, 1, 2, 'CARBURANT');
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (7, 'KOOL', 'JANNE', 'KJ', '1979', 'F', 'confirme', 2, 0, 2, 2, 'CARBURANT');
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (8, 'LEMOINE', 'THIBAUT', 'LT', '1993', 'M', 'expert', 1, 1, 2, 2, 'CARBURANT');
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (9, 'MANTOVAN', 'ELENA', 'ME', '1987', 'F', 'debutant', 2, 0, 1, 0, 'LAVAGE');
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (10, 'RYDH', 'DAVID', 'AL', '1986', 'F', 'debutant', 0, 1, 1, 1, null);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (11, 'ELHADI', 'SALAH', 'DI', '1995', 'H', 'debutant', 1, 1, 0, 1, null);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (12, 'CLAUDE', 'LAURENT', 'CL', '1980', 'H', 'habitue', 0, 1, 0, 1, null);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (13, 'JULIE-ANNE', 'LIEVRE', 'JA', '1988', 'F', 'ambassadeur', 2, 0, 0, 1, null);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (14, 'BENGHEZAL', 'INES', 'IN', '1996', 'F', 'debutant', 2, 1, 0, 2, null);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (15, 'KHODJA', 'YASMINE', 'YA', '1996', 'F', 'habitue', 1, 2, 0, 2, null);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (16, 'ANONYME', 'ANONYME', 'AN', '0000', null, null, null, null, null, null, null);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (17, 'OUIBUS', 'OUIBUS', 'OB', '0000', null, null, 0, 0, 0, 0, null);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (18, 'AISSAOUI', 'SALEH', 'AS', '1995', 'F', 'debutant', 1, 0, 2, 2, null);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique, cadeau) VALUES (19, 'EMILE', 'YOUSSEF', 'EY', '1994', 'H', 'ambassadeur', 1, 2, 1, 1, null);
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (1, 'Montpellier', 57, 277639, 34, 'Occitanie', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (2, 'Paris', 105, 2206488, 75, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (3, 'Marseille', 241, 861635, 13, 'Provence-Alpes-Cote d''Azu', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (4, 'Lyon', 48, 513275, 69, 'Auvergne-Rhone-Alpes', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (5, 'Toulouse', 118, 471941, 31, 'Occitanie', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (6, 'NICE', 72, 340735, 6, 'Porvence-Alpes-Côte Azur', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (7, 'Nantes', 65, 282047, 44, 'Pays de la Loire', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (8, 'Strasbourg', 78, 271708, 67, 'Alsace', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (9, 'Bordeaux', 49, 236725, 33, 'Aquitaine', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (10, 'Lille', 35, 226827, 59, 'Nord-Pas-de-Calais', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (11, 'Rennes', 50, 206604, 35, 'Bretagne', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (12, 'Reims', 50, 180842, 51, 'Champagne-Ardenne', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (13, 'Le havre', 47, 177259, 76, 'Haute-Normandie', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (14, 'Saint-Etienne', 80, 171961, 42, 'Rhône-Alpes', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (15, 'Toulon', 43, 165514, 83, 'Provence-Alpes-Côte Azur', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (16, 'Grenoble', 18, 155632, 38, 'Rhône-Alpes', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (17, 'Angers', 42, 147305, 49, 'Pays de la loire', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (18, 'Dijon', 40, 152110, 21, 'Bourgogne', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (19, 'Brest', 49, 141315, 29, 'Bretagne', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (20, 'Le Mans', 52, 142281, 72, 'Pays de la loire', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (21, 'Nîmes', 161, 140747, 30, 'Languedoc-Roussillon', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (22, 'Aix-En-Provence', 186, 141895, 13, 'Provence-Alpes-Côte Azur', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (23, 'Clermont-Ferrand', 42, 138588, 63, 'Auvergne', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (24, 'Tours', 34, 135218, 37, 'Centre', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (25, 'Amiens', 49, 133998, 80, 'Picardie', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (26, 'Limoges', 78, 139216, 87, 'Limousin', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (27, 'Villeurbanne', 14, 144751, 69, 'Rhône-Alpes', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (28, 'Metz', 41.94, 121841, 57, 'Lorraine', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (29, 'Besançon', 65.05, 117392, 25, 'Franche-Comté', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (30, 'Perpignan', 68.07, 117905, 66, 'Languedoc-Roussillon', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (31, 'Orléans', 27.48, 113224, 45, 'Centre', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (32, 'Caen', 25.7, 109312, 14, 'Basse Normandie', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (33, 'Mulhouse', 22.18, 111156, 68, 'Alsace', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (34, 'Boulogne-Bilancourt', 6.17, 113085, 92, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (35, 'Rouen', 21.38, 110688, 76, 'Haute-Normandie', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (36, 'Nancy', 15.01, 106318, 54, 'Lorraine', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (37, 'Argenteuil', 17.22, 102844, 95, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (38, 'Montreuil', 8.92, 103192, 93, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (39, 'Saint-Denis', 12.36, 105749, 93, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (40, 'Roubaix', 13.23, 95028, 59, 'Nord-pas-de-Calais', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (41, 'Avignon', 64.91, 89592, 84, 'Provence-Alpes-Côte Azur', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (42, 'Tourcoing', 15.19, 92389, 59, 'Nord-pas-de-Calais', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (43, 'Poitiers', 42.11, 88795, 86, 'Poitou-Charentes', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (44, 'Nanterre', 12.19, 89966, 92, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (45, 'Creteil', 11.46, 89359, 94, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (46, 'Versailles', 26.18, 89477, 78, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (47, 'Pau', 31.51, 82763, 64, 'Aquitaine', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (48, 'Courbevoie', 4.17, 86947, 92, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (49, 'Vitry-sur-seine', 11.67, 85380, 94, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (50, 'Asnières-sur-Seine', 4.82, 81603, 92, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (51, 'Colombe', 7.81, 84572, 92, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (52, 'Aulnay-sous-Bois', 16.2, 82525, 93, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (53, 'La Rochelle', 28.43, 74707, 17, 'Poitou-Charente', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (54, 'Rueil-Malmaison', 14.7, 79065, 92, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (55, 'Antibes', 26.48, 75553, 6, 'Provence-Alpes-Côte Azur', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (56, 'SaintMaurDesFossés', 11.25, 75251, 94, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (57, 'Calais', 33.5, 74336, 62, 'Nord-pas-de-Calais', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (58, 'Champigny-sur-Marne', 11.3, 75090, 94, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (59, 'Aubervilliers', 5.76, 74701, 93, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (60, 'Beziers', 95.48, 70957, 34, 'Languedoc-Roussillon', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (61, 'Bourges', 68.74, 66786, 18, 'Centre', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (62, 'Cannes', 19.62, 73372, 6, 'Provence-Alpes-Côte Azur', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (63, 'Saint-Nazaire', 46.79, 66348, 44, 'Pays de la loire', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (64, 'Dunkerque', 37.34, 92923, 59, 'Nord-pas-de-Calais', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (65, 'Quimper', 84.47, 63387, 29, 'Bretagne', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (66, 'Valence', 36.69, 64364, 26, 'Rhône-Alpes', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (67, 'Colmar', 66.57, 67214, 68, 'Alsace', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (68, 'Drancy', 7.76, 66670, 93, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (69, 'Merignac', 48.17, 66488, 33, 'Aquitaine', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (70, 'Ajaccio', 82.03, 64306, 20, 'Corse', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (71, 'Levallois-Perret', 2.41, 63436, 92, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (72, 'Troyes', 13.2, 61188, 10, 'Champagne-Ardennes', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (73, 'Neuilly-sur-Seine', 3.73, 60501, 92, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (74, 'Issy-Les-Moulineaux', 4.25, 65027, 92, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (75, 'Villeneuve-d''Ascq', 27.46, 63844, 59, 'Nord-pas-de-Calais', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (76, 'Noisy-le-Grand', 12.95, 63405, 93, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (77, 'Antony', 9.56, 61393, 92, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (78, 'Niort', 68.2, 56878, 79, 'Poitou-Charente', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (79, 'Lorient', 17.48, 57812, 56, 'Bretagne', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (80, 'Sarcelles', 8.45, 56421, 95, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (81, 'Chambery', 20.99, 56476, 73, 'Rhône-Alpes', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (82, 'Saint-Quentin', 22.56, 55971, 2, 'Picardie', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (83, 'Pessac', 38.82, 57593, 33, 'Aquitaine', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (84, 'Vénissieux', 15.33, 58643, 69, 'Rhône-Alpes', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (85, 'Cergy', 11.65, 57247, 95, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (86, 'La Seyne-sur-Mer', 22.17, 61514, 83, 'Provence-Alpes-Côte Azur', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (87, 'Clichy', 3.08, 58200, 92, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (88, 'Beauvais', 33.31, 56461, 60, 'Picardie', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (89, 'Cholet', 87.47, 54121, 49, 'Pays de la loire', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (90, 'Hyères', 132.38, 54686, 83, 'Provence-Alpes-Côte Azur', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (91, 'Ivry-sur-Seine', 6.1, 57254, 94, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (92, 'Montauban', 135.17, 56126, 82, 'Midi-Pyrénées', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (93, 'Vannes', 32.3, 52683, 56, 'Bretagne', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (94, 'La Roche-sur-Yon', 87.52, 52234, 85, 'Pays de la loire', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (95, 'Charleville-Mézières', 31.44, 49975, 8, 'Champagne-Ardegne', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (96, 'Pantin', 5.01, 52161, 93, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (97, 'Laval', 34.22, 51182, 53, 'Pays de la loire', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (98, 'Maisons-Alfort', 5.35, 52619, 94, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (99, 'Bondy', 5.47, 53448, 93, 'Ile-de-France', 'France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region, pays) VALUES (100, 'Evry', 8.33, 52403, 91, 'Ile-de-France', 'France');
