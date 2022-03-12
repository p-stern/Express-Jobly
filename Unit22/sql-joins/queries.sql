-- Join the two tables so that every column and record appears,
-- regardless of if there is not an owner_id.
SELECT *
FROM owners
FULL OUTER JOIN vehicles ON
owners.id = vehicles.owner_id
;


-- Count the number of cars for each owner. Display the owners first_name, last_name 
-- and count of vehicles. The first_name should be ordered in ascending order. 
SELECT first_name, last_name, count(*)
FROM owners
JOIN vehicles ON
owners.id = vehicles.owner_id
GROUP BY first_name, last_name
ORDER BY first_name
;
