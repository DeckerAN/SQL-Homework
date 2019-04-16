USE sakila;

/* 6a. Use JOIN to display the first and last names, as well as the address, of each staff member.
Use the tables staff and address:
*/

SELECT first_name, last_name, address
FROM staff
LEFT JOIN address ON staff.address_id = address.address_id;

/* 6b. Use JOIN to display the total amount rung up by each staff member in August of 2005.
Use tables staff and payment.
*/

SELECT staff_id, first_name, last_name, SUM(amount)
FROM payment
LEFT JOIN staff USING (staff_id)
WHERE(payment_date >= '2005-08-01 00:00:00' AND payment_date < '2005-09-01 00:00:00')
GROUP BY staff_id;

/* 6c. List each film and the number of actors who are listed for that film.
Use tables film_actor and film. Use inner join.
*/

SELECT film_id, title, COUNT(film_id) as '# of actors'
FROM film_actor
LEFT JOIN film USING (film_id)
GROUP BY film_id;

/* 6d. How many copies of the film Hunchback Impossible exist in the inventory system? */

SELECT title, COUNT(film_id) as '# of copies'
FROM inventory
LEFT JOIN film USING (film_id)
WHERE title = 'HUNCHBACK IMPOSSIBLE'
GROUP BY title
;

/* 6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer.
List the customers alphabetically by last name:
*/

SELECT first_name, last_name, SUM(amount) as 'total paid'
FROM payment
LEFT JOIN customer USING (customer_id)
GROUP BY customer_id
ORDER BY last_name, first_name
;
