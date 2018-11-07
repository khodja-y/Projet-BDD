--Requête 4: 
--Afficher le nombre de trajets proposés en effectuant un 
--group by sur la ville de départ et la ville de destination,
--et le comparer au nombre de trajets rechercher 
--selon la même ville de départ et de destination.

SELECT 	ville_dim1.nom,ville_dim2.nom,
		COUNT(proposition.id_date,proposition.id_dateDep,proposition.id_heureDep,proposition.id_villeDep,proposition.id_villeArr,proposition.id_conducteur) AS nbr_trajets_prop,
		COUNT(recherche.id_date,recherche.id_dateDep,recherche.id_heureDep,recherche.id_villeDep,recherche.id_villeArr,recherche.id_conducteur)AS nbr_trajets_rech
FROM ville_dim1,ville_dim2,recherche,proposition 
WHERE 		ville_dim1.id=recherche.id_villeDep
	AND 	ville_dim2.id=recherche.id_villeArr
	AND	ville_dim1.id=proposition.id_villeDep
	AND 	ville_dim2.id=proposition.id_villeDep	
GROUP BY ville_dim1,ville_dim2,nbr_trajets_prop,nbr_trajets_rech;


--Requête 6: Afficher le nombre de cartes carburant et 
--le nombre de cartes lavage prises par les utilisateurs 
--ayant proposés un premier trajet et comparer les deux nombres.

SELECT COUNT(utilisateur1.cadeau),COUNT(utilisateur2.cadeau)
FROM utilisateur,proposition
WHERE 		utilisateur1.cadeau='LAVAGE'
	AND	utilisateur2.cadeau='CARBURANT'
	AND	utilisateur1.id=proposition.id_conducteur
	AND  	utilisateur2.id=proposition.id_conducteur;
	
--2eme solution plus correcte
SELECT *
FROM (SELECT count(utilisateur_dim.id) as nbr_lavage
      FROM utilisateur_dim
      WHERE cadeau = 'LAVAGE' ) as LAVAGE, (SELECT count(utilisateur_dim.id) as nbr_carburant
                                 FROM utilisateur_dim
                                 WHERE cadeau = 'CARBURANT' ) as CARBURANT;

--requête 2:
-- Afficher le nombre de trajets réservés ayant le prix minimum en effectuant un group by sur la ville de départ et la ville de destination.
select id_villeDep, id_villeArr, MIN(prix_place)
    from reservation
    group by id_villeDep,id_villeArr;
    
--requête 8:
--Afficher le nombre de trajets réservés complets selon la ville de départ et ville d'arrivée
select id_villeDep, id_villeArr, COUNT(num_trajet)
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
