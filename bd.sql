DROP TABLE reservation;
DROP TABLE proposition;
DROP TABLE recherche;
DROP TABLE date_dim;
DROP TABLE time_dim;
DROP TABLE utilisateur_dim;
DROP TABLE ville_dim;

CREATE TABLE date_dim (
	id       NUMBER,
	fullDate DATE,
	day      VARCHAR2(2),
	month    VARCHAR2(9),
	monthNum VARCHAR2(2),
	year     VARCHAR2(4),
	CONSTRAINT date_dimension_pk PRIMARY KEY (id)
);

CREATE TABLE time_dim (
	id         NUMBER(5,0),
	timeFull   VARCHAR2(12),
	timeFull24 VARCHAR2(9),
	heure      NUMBER(2,0),
	heure24    NUMBER(2,0),
	minute     NUMBER(2,0),
	am_pm      CHAR(2),
	CONSTRAINT time_dimension_pk PRIMARY KEY (id)
);

CREATE TABLE utilisateur_dim (
	id             NUMBER(5,0),
	nom            VARCHAR2(10),
	prenom         VARCHAR2(10),
	pseudo         VARCHAR2(10),
	anneeNaissance CHAR(4),
	sexe           CHAR(1),
	statue         VARCHAR2(15),
	niv_bavard     NUMBER(1,0),
	niv_fumeur     NUMBER(1,0),
	niv_animaux    NUMBER(1,0),
	niv_musique    NUMBER(1,0),
	CONSTRAINT utilisateur_dimension_pk PRIMARY KEY (id)
);

CREATE TABLE ville_dim (
	id          NUMBER(5,0),
	nom         VARCHAR2(20),
	superficie  NUMBER(5,2),
	population  NUMBER(8,0),
	departement NUMBER(3,0),
	region      VARCHAR2(30),
	CONSTRAINT ville_dimension_pk PRIMARY KEY (id)
);

CREATE TABLE reservation (
	id_dateResa   NUMBER NOT NULL,
	id_heureResa  NUMBER(5,0) NOT NULL,
	id_villeDep   NUMBER(5,0) NOT NULL,
	id_villeArr   NUMBER(5,0) NOT NULL,
	id_dateDep    NUMBER NOT NULL,
	id_passager   NUMBER(5,0) NOT NULL,
	id_conducteur NUMBER(5,0) NOT NULL,
	num_trajet    NUMBER(5,0) NOT NULL,
	nombrePlace   NUMBER(2,0) NOT NULL,
	prixPlace     NUMBER(3,2) NOT NULL,
	prixTotal     NUMBER(4,2) NOT NULL,
	CONSTRAINT reservation_dateResa_fk   FOREIGN KEY (id_dateResa)   REFERENCES date_dim(id),
	CONSTRAINT reservation_heureResa_fk  FOREIGN KEY (id_heureResa)  REFERENCES time_dim(id),
	CONSTRAINT reservation_villeDep_fk   FOREIGN KEY (id_villeDep)   REFERENCES ville_dim(id),
	CONSTRAINT reservation_villeArr_fk   FOREIGN KEY (id_villeArr)   REFERENCES ville_dim(id),
	CONSTRAINT reservation_dateDep_fk    FOREIGN KEY (id_dateDep)    REFERENCES date_dim(id),
	CONSTRAINT reservation_passager_fk   FOREIGN KEY (id_passager)   REFERENCES utilisateur_dim(id),
	CONSTRAINT reservation_conducteur_fk FOREIGN KEY (id_conducteur) REFERENCES utilisateur_dim(id),
	CONSTRAINT reservation_fait_pk PRIMARY KEY (
		id_dateResa, 
		id_heureResa, 
		id_villeDep,
		id_villeArr,
		id_dateDep,
		id_passager,
		id_conducteur,
		num_trajet)
);

CREATE TABLE proposition (
	id_date       NUMBER NOT NULL,
	id_dateDep    NUMBER NOT NULL,
	id_heureDep   NUMBER(5,0) NOT NULL,
	id_villeDep   NUMBER(5,0) NOT NULL,
	id_villeArr   NUMBER(5,0) NOT NULL,
	id_conducteur NUMBER(5,0) NOT NULL,
	CONSTRAINT proposition_date_fk       FOREIGN KEY (id_date)       REFERENCES date_dim(id),
	CONSTRAINT proposition_dateDep_fk    FOREIGN KEY (id_dateDep)    REFERENCES date_dim(id),
	CONSTRAINT proposition_heureDep_fk   FOREIGN KEY (id_heureDep)   REFERENCES time_dim(id),
	CONSTRAINT proposition_villeDep_fk   FOREIGN KEY (id_villeDep)   REFERENCES ville_dim(id),
	CONSTRAINT proposition_villeArr_fk   FOREIGN KEY (id_villeArr)   REFERENCES ville_dim(id),
	CONSTRAINT proposition_conducteur_fk FOREIGN KEY (id_conducteur) REFERENCES utilisateur_dim(id),
	CONSTRAINT proposition_fait_pk PRIMARY KEY (
		id_date,
		id_villeDep,
		id_villeArr,
		id_conducteur,
		id_heureDep)
);

CREATE TABLE recherche (
	id_date        NUMBER NOT NULL,
	id_dateDep     NUMBER NOT NULL,
	id_heureDep    NUMBER(5,0) NOT NULL,
	id_villeDep    NUMBER(5,0) NOT NULL,
	id_villeArr    NUMBER(5,0) NOT NULL,
	id_utilisateur NUMBER(5,0) NOT NULL,
	CONSTRAINT recherche_date_fk        FOREIGN KEY (id_date)        REFERENCES date_dim(id),
	CONSTRAINT recherche_dateDep_fk     FOREIGN KEY (id_dateDep)     REFERENCES date_dim(id),
	CONSTRAINT recherche_heureDep_fk    FOREIGN KEY (id_heureDep)    REFERENCES time_dim(id),
	CONSTRAINT recherche_villeDep_fk    FOREIGN KEY (id_villeDep)    REFERENCES ville_dim(id),
	CONSTRAINT recherche_villeArr_fk    FOREIGN KEY (id_villeArr)    REFERENCES ville_dim(id),
	CONSTRAINT recherche_utilisateur_fk FOREIGN KEY (id_utilisateur) REFERENCES utilisateur_dim(id),
	CONSTRAINT recherche_fait_pk PRIMARY KEY (
		id_date,
		id_villeDep,
		id_villeArr,
		id_utilisateur,
		id_heureDep)
);
