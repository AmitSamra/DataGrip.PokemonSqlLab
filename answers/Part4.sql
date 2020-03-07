--Part 4: Final Report

--Directions: Write a query that returns the following collumns:

--Pokemon Name		Trainer Name	Level			Primary Type		Secondary Type
--Pokemon's name	Trainer's name	Current Level	Primary Type Name	Secondary Type Name

--Sort the data by finding out which trainer has the strongest pokemon so that this will act 
--as a ranking of strongest to weakest trainer. You may interpret strongest in whatever way you 
--want, but you will have to explain your decision.

SELECT p.id, p.name AS pokeman_name,
       tr.trainername AS trainer_name,
       pt.pokelevel AS level,
       p.primary_type,
       ty.name AS primary_name,
       p.secondary_type,
       ty2.name AS secondary_name,
       SUM(pt.pokelevel) OVER(PARTITION BY p.name) as total_levels
FROM pokemons AS p
JOIN pokemon_trainer AS pt ON p.id = pt.pokemon_id
JOIN trainers AS tr ON pt.trainerID = tr.trainerID
JOIN types AS ty ON p.primary_type = ty.id
JOIN types AS ty2 ON p.secondary_type = ty2.id
GROUP BY p.id, p.name, tr.trainername, pt.pokelevel, p.primary_type, ty.name, p.secondary_type, ty2.name
ORDER BY total_levels DESC;

-- 158	Gyarados	Cipher R&D Kaller	42	Water	Flying	6129
-- Gyarados is the most powerful Pokemon due to having a summed total levels of 6129