--Requête 4: 
--Afficher le nombre de trajets proposés en effectuant un 
--group by sur la ville de départ et la ville de destination,
--et le comparer au nombre de trajets rechercher 
--selon la même ville de départ et de destination.

--on a besoin d'une dimensions dégénrées dans les tables de fait pour cette requete comme "numéro de recherche"


CREATE MATERIALIZED VIEW MV4
AS SELECT 	vd1.nom,vd2.nom,
		COUNT(proposition.id_date||proposition.id_dateDep||proposition.id_heureDep||proposition.id_villeDep||proposition.id_villeArr||proposition.id_conducteur) AS nbr_trajets_prop,
		COUNT(recherche.id_date||recherche.id_dateDep||recherche.id_heureDep||recherche.id_villeDep||recherche.id_villeArr||recherche.id_utilisateur) AS nbr_trajets_rech
FROM        ville_dim vd1,ville_dim vd2,recherche,proposition 
WHERE 		vd1.id=recherche.id_villeDep
	AND 	vd2.id=recherche.id_villeArr
	AND	    vd1.id=proposition.id_villeDep
	AND 	vd2.id=proposition.id_villeArr	
GROUP BY vd1.nom,vd2.nom;


--Requête 6: Afficher le nombre de cartes carburant et 
--le nombre de cartes lavage prises par les utilisateurs 
--ayant proposés un premier trajet et comparer les deux nombres.

CREATE MATERIALIZED VIEW MV6
AS SELECT COUNT(u1.cadeau) AS LAVAGE,COUNT(u2.cadeau) AS CARBURANT
FROM    utilisateur_dim u1,utilisateur_dim u2,proposition
WHERE 	u1.cadeau='LAVAGE'
	AND	u2.cadeau='CARBURANT'
	AND	u1.id=proposition.id_conducteur
	AND u2.id=proposition.id_conducteur;
--2eme solution plus correcte
CREATE MATERIALIZED VIEW MV6
AS SELECT *
FROM (SELECT count(utilisateur_dim.id) as nbr_lavage
      FROM utilisateur_dim
      WHERE cadeau = 'LAVAGE' ), (SELECT count(utilisateur_dim.id) as nbr_carburant
                                 FROM utilisateur_dim
                                 WHERE cadeau = 'CARBURANT' );

--requête 2:
-- Afficher le nombre de trajets réservés ayant le prix minimum en effectuant un group by sur la ville de départ et la ville de destination.
CREATE MATERIALIZED VIEW MV2
AS select id_villeDep, id_villeArr, MIN(prix_place)
    from reservation
    group by id_villeDep,id_villeArr;
    
--requête 8:
--Afficher le nombre de trajets réservés complets selon la ville de départ et ville d'arrivée
CREATE MATERIALIZED VIEW MV8
AS select id_villeDep, id_villeArr, COUNT(num_trajet)
from reservation
where complet = '1'
group by id_villeDep, id_villeArr;

--requête ***
--Afficher le nombre de trajets réservés complets effectués dans un véhicule fumeur selon la ville de départ et la ville d'arrivée
select id_villeDep, id_villeArr, COUNT(num_trajets)
from reservation, utilisateur
where 	complet = '1',
	and utilisateur.niv_fumeur = '1'
group by id_villeDep, id_villeArr;


-- requête 3:
-- Nombre de places vendues et prix total des réservations avec Ouibus par jour  
CREATE MATERIALIZED VIEW MV3
AS SELECT d.fullDate, SUM(nombrePlace) as placeVendue, SUM(prixTotal) as prixTotal
FROM reservation r, date_dim d
WHERE r.id_conducteur = 10
	AND r.id_dateResa = d.id
GROUP BY d.fullDate;
