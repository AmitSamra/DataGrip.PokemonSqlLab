--Part 2: Simple Selects and Counts

--Directions: Write a sql query or sql queries that can answer the following questions

--What are all the types of pokemon that a pokemon can have?

SELECT * FROM types;
--18 distinct types
--This isn't ideal since the output area has multiple pages. Use next method.

SELECT count(DISTINCT name) FROM types;
--18

--What is the name of the pokemon with id 45?

SELECT * FROM pokemons
WHERE id = 45;
--Eevee

--How many pokemon are there?

SELECT count(*) FROM pokemons;
--656

--How many types are there?

SELECT count(distinct(primary_type)) FROM pokemons;
--18

--How many pokemon have a secondary type?

SELECT count(*)
FROM pokemons
WHERE secondary_type IS NOT NULL;