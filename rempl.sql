-- /*****************************************************************************************************
-- BD mise à jour !!
-- documentation pour faire la dimension date :
-- https://ginoscheppers.wordpress.com/2011/01/30/how-to-create-a-oracle-date-dimension-table-on-the-fly/
-- ******************************************************************************************************/

-- /******************************************************************************
-- Création de la dimension date avec un stockage de la date sur 3 ans depuis 2017 
-- *******************************************************************************/

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

-- /**********************************!*************************************************
-- Création de la dimension temps avec un stockage de toutes les minutes sur une journée 
-- *************************************************************************************/

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

-- /****************************************************************************
-- faites les insertions additionnelles nécessaires à vos requêtes ça sera mieux
-- *****************************************************************************/

INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (1, 'ALLON', 'LEVY', 'AL', 1986, 'F', 'debutant', 2, 0, 1, 2);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (2, 'BACARD', 'HUGO', 'BH', 1966, 'M', 'expert', 2, 1, 2, 2);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (3, 'CEBALLOS', 'CESAR', 'CC', 1991, 'F', 'confirme', 1, 0, 1, 1);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (4, 'DOCOMPO', 'ROI', 'DR', 1985, 'M', 'ambassadeur', 2, 0, 1, 0);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (5, 'ERIKSON', 'DENIS', 'ED', 1978, 'H', 'debutant', 1, 1, 0, 2);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (6, 'HERBLOT', 'MATHILDE', 'HM', 1982, 'F', 'confirme', 2, 0, 1, 2);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (7, 'KOOL', 'JANNE', 'KJ', 1979, 'F', 'confirme', 2, 0, 2, 2);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (8, 'LEMOINE', 'THIBAUT', 'LT', 1993, 'M', 'expert', 1, 1, 2, 2);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (9, 'MANTOVAN', 'ELENA', 'ME', 1987, 'F', 'debutant', 2, 0, 1, 0);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (10, 'RYDH', 'DAVID', 'AL', 1986, 'F', 'debutant', 0, 1, 1, 1);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (11, 'ELHADI', 'SALAH', 'DI', 1995, 'H', 'debutant', 1, 1, 0, 1);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (12, 'CLAUDE', 'LAURENT', 'CL', 1980, 'H', 'habitue', 0, 1, 0, 1);
INSERT INTO utilisateur_dim (id, nom, prenom, pseudo, anneeNaissance, sexe, statue, niv_bavard, niv_fumeur, niv_animaux, niv_musique)
VALUES (13, 'JULIE-ANNE', 'LIEVRE', 'JA', 1988, 'F', 'ambassadeur', 2, 0, 0, 1);

INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (1, 'Montpellier', 56.88, 277639, 34, 'Occitanie');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (2, 'Paris', 105.04, 2206488, 75, 'Ile-de-France');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (3, 'Marseille', 240.62, 861635, 13, 'Provence-Alpes-Cote d''Azu');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (4, 'Lyon', 47.87, 513275, 69, 'Auvergne-Rhone-Alpes');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (5, 'Toulouse', 118.30, 471941, 31, 'Occitanie');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (6, 'NICE', 71.92, 340735, 06, 'Porvence-Alpes-Côte Azur');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (7, 'Nantes', 65.19, 282047, 44, 'Pays de la Loire');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (8, 'Strasbourg',78.29, 271708, 67, 'Alsace');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (9, 'Bordeaux', 49.36, 236725, 33, 'Aquitaine');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (10, 'Lille', 34.83, 226827, 59, 'Nord-Pas-de-Calais');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (11, 'Rennes',50.39, 206604, 35, 'Bretagne');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (12, 'Reims',49.90, 180842, 51, 'Champagne-Ardenne');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (13, 'Le havre',46.95, 177259, 76, 'Haute-Normandie');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (14, 'Saint-Etienne',79.97, 171961, 42, 'Rhône-Alpes');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (15, 'Toulon',42.83, 165514, 83, 'Provence-Alpes-Côte Azur');
INSERT INTO ville_dim (id, nom, superficie, population, departement, region)
VALUES (8, 'Strasbourg',78.29, 271708, 67, 'Alsace');




	
	
	
	
-- /*************************
-- RESERVATION FACT INSERTION
-- **************************/

INSERT INTO reservation (id_dateResa, id_heureResa, id_villeDep, id_villeArr, id_dateDep, id_passager, id_conducteur, num_trajet, nombrePlace, complet, deux_places_ar, only_girls, prixPlace, prixTotal)
VALUES ();

-- /*************************
-- PROPOSITION FACT INSERTION
-- **************************/

INSERT INTO proposition (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr)
VALUES ();

-- /***********************
-- RECHERCHE FACT INSERTION
-- ************************/

INSERT INTO recherche (id_date, id_dateDep, id_heureDep, id_villeDep, id_villeArr, id_utilisateur)
VALUES ();
