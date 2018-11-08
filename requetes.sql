--Requête1:
--Afficher le nombre de trajets réservés en effectuant un group by
 --sur la ville de départ et la ville de destination
select id_villeDep, id_villeArr, count(num_trajet) 
from reservation
group by id_villeDep,id_villeArr; 

--Requête2:
--Afficher le nombre de trajets réservés ayant le prix minimum en effectuant un 
--group by sur la ville de départ et la ville de destination

select id_villeDep, id_villeArr, MIN(prixPlace)
from reservation
group by id_villeDep,id_villeArr;


--Requête3:
--Nombre de places vendues et prix total 
--des réservations avec Ouibus par jour

select d.fullDate, sum(nombrePlace) as placeVendue, sum(prixTotal) as prixTotal
from reservation r, date_dim d
where r.id_conducteur = 10
and r.id_dateResa = d.id
group by d.fullDate;
    

--Requête 4: 
--Afficher le nombre de trajets proposés, le nombre de trajets recherchés et le rapport entre les deux en pourcentages 
--à la même date selon la ville de départ et la ville de destination

select p.id_dateDep, p.id_villeDep, p.id_villeArr,
	(select count(*) FROM proposition p2
    where p.id_dateDep = p2.id_dateDep
          and p.id_villeDep = p2.id_villeDep
          and p.id_villeArr = p2.id_villeArr ) as nbProp,
    (select count(*) FROM recherche r2
    where p.id_dateDep = r2.id_dateDep
    and p.id_villeDep = r2.id_villeDep
    and p.id_villeArr = r2.id_villeArr ) as nbRech,
    (select ((nbProp / nbRech) * 100)) as satisfaction
from proposition p, recherche r
where p.id_dateDep = r.id_dateDep
          and p.id_villeDep = r.id_villeDep
          and p.id_villeArr = r.id_villeArr
group by p.id_dateDep, p.id_villeDep, p.id_villeArr;
    


--Requête 5:
--Afficher les trajets recherchés en effectuant un group by sur la ville de départ et la ville de destination qui n’ont 
--jamais été proposés (Trajets recherchés - trajets proposés).
select id_villeDep, id_villeArr
from recherche 
MINUS 
(select id_villeDep, id_villeArr from proposition);

--Requête 6: 
--Afficher le rapport en pourcentages entre le nombre d'utilisateurs ayant 
--pris une carte cadeau après leur premier trajet et le nombre d'utilisateurs 
--ayant proposé un trajet au minimum et comparer les deux nombres
select *
    from(select 
        ((select count(DISTINCT id_conducteur) AS nbr_lavage
        from utilisateur_dim, proposition
        where id_conducteur = utilisateur_dim.id 
              and utilisateur_dim.cadeau = 'LAVAGE')
        /(select count(distinct id_conducteur) 
         from proposition) * 100) as pourcentage_lavage) 
         as LAVAGE,
         (select ((select count(distinct id_conducteur) 
         as nbr_carburant
         from utilisateur_dim, proposition
         where id_conducteur = utilisateur_dim.id 
         and utilisateur_dim.cadeau = 'CARBURANT')
         /(select count(distinct id_conducteur) 
         from proposition) 
         * 100) as pourcentage_carburant) as CARBURANT,
         (select(
         (select count(distinct id_conducteur) AS nbr_aucun
         from utilisateur_dim, proposition
         where id_conducteur = utilisateur_dim.id 
         and utilisateur_dim.cadeau IS NULL ) 
         /(select count(distinct id_conducteur) 
         from proposition) 
         * 100) as pourcentage_aucun) as AUCUN;

--Requête 7:
--Afficher le nombre de trajets réservés annulés selon 
--la ville de départ et ville d'arrivée
-- Afficher le nombre de trajets réservés ayant le prix minimum en effectuant un group by sur la ville de départ et la ville de destination.
select id_villeDep, id_villeArr, count(num_trajet)
from reservation
where statut = '2'
group by id_villeDep, id_villeArr;
      


--Requête 8:
--Les utilisateurs réserve-t-il souvent des trajets fumeur?
select id_villeDep, id_villeArr, count(num_trajets)
from reservation, utilisateur
where utilisateur.niv_fumeur = '1' 
or utilisateur.niv_fumeur = '1'
group by id_villeDep, id_villeArr;

--Requête 9 :
--Estimer le nombre de réservation faites par jour
select date_dim.fullDate, reservation.id_villeDep,
    reservation.id_villeArr
from reservation, date_dim
where reservation.id_dateResa=date_dim.id
group by reservation.id_dateResa, id_villeDep, id_villeArr;
        

--Requête 10:
--Comparer le nombre de trajets fait que par des filles et les autres
select id_villeDep, id_villeAr, count(num_trajet1)
    , count(num_trajet2)
from reservation num_trajet1, reservation num_trajet2, 
         junk_dim
where 		junk_dim.id = reservation.id_junk
      and 	junk_dim.onlyGirls = '1'
group by id_villeDep, id_villeAr;