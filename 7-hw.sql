USE sakila;

/* 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence.
As an unintended consequence, films starting with the letters K and Q have also soared in popularity.
Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
*/

SELECT title FROM film
WHERE ((title LIKE 'K%' OR title LIKE 'Q%' ) AND language_id IN(
	SELECT language_id FROM language
    WHERE name = 'English'
));

/* 7b. Use subqueries to display all actors who appear in the film Alone Trip. */

SELECT actor_id AS 'Actor IDs in ALONE TRIP', first_name, last_name FROM actor
WHERE actor_id IN (
	SELECT actor_id FROM film_actor
    WHERE film_id IN (
		SELECT film_id FROM film
        WHERE title = 'ALONE TRIP'
    )
);

/* 7c. You want to run an email marketing campaign in Canada, for which you will need
the names and email addresses of all Canadian customers. Use joins to retrieve this information.
*/

SELECT first_name, last_name, email, country
FROM customer
LEFT JOIN address USING (address_id)
LEFT JOIN city USING (city_id)
LEFT JOIN country USING (country_id)
WHERE country = 'Canada'
;

/* 7d. Sales have been lagging among young families, and you wish to target
all family movies for a promotion. Identify all movies categorized as family films.
*/

SELECT title AS Film, category.name as Category
FROM film
LEFT JOIN film_category USING (film_id)
LEFT JOIN category USING (category_id)
WHERE category.name = 'Family'
;

/* 7e. Display the most frequently rented movies in descending order. */

SELECT film_id, title, COUNT(inventory_id) AS '# of times rented'
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
GROUP BY film_id
ORDER BY COUNT(inventory_id) DESC
;

/* 7f. Write a query to display how much business, in dollars, each store brought in. */

SELECT store_id, SUM(amount) as 'revenue ($)'
FROM payment
JOIN staff USING (staff_id)
JOIN store USING (store_id)
GROUP BY store_id
;

/* 7g. Write a query to display for each store its store ID, city, and country. */

SELECT store_id, city, country
FROM store
LEFT JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
;

/* 7h. List the top five genres in gross revenue in descending order.
(Hint: you may need to use the following tables:
category, film_category, inventory, payment, and rental.)
*/

SELECT category.name AS 'top categories', SUM(amount) AS 'gross revenue ($)'
FROM payment
JOIN rental USING (rental_id)
JOIN inventory USING (inventory_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
GROUP BY category.name
ORDER BY SUM(amount) DESC
LIMIT 5
;