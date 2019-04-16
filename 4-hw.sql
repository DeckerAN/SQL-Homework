USE sakila;

/* 4a. List the last names of actors, as well as how many actors have that last name. */

SELECT last_name, COUNT(*) AS last_name_count
FROM actor
GROUP BY last_name;

/* 4b. List last names of actors and the number of actors who have that last name,
but only for names that are shared by at least two actors.
*/

SELECT last_name, COUNT(*) AS last_name_count
FROM actor
GROUP BY last_name
HAVING last_name_count >= 2;

/* 4c. The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS.
Write a query to fix the record.
*/

SELECT * FROM actor
WHERE (first_name = 'GROUCHO' AND last_name = 'WILLIAMS');

UPDATE actor
SET first_name = 'HARPO'
WHERE (first_name = 'GROUCHO' AND last_name = 'WILLIAMS');

SELECT * FROM actor
WHERE (first_name = 'HARPO' AND last_name = 'WILLIAMS');

/* 4d. Perhaps we were too hasty in changing GROUCHO to HARPO.
It turns out that GROUCHO was the correct name after all! In a single query,
if the first name of the actor is currently HARPO, change it to GROUCHO.
*/

UPDATE actor
SET first_name = 'GROUCHO'
WHERE (first_name = 'HARPO' AND last_name = 'WILLIAMS');

SELECT * FROM actor
WHERE (first_name = 'GROUCHO' AND last_name = 'WILLIAMS');