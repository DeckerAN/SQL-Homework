USE sakila;

/* 8a. In your new role as an executive, you would like to have an easy way of viewing
the Top five genres by gross revenue. Use the solution from the problem above to create a view.
If you haven't solved 7h, you can substitute another query to create a view.
*/

CREATE VIEW top5_grossing_categories AS
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

/* 8b. How would you display the view that you created in 8a? */

SELECT * FROM top5_grossing_categories;

/* 8c. You find that you no longer need the view top_five_genres. Write a query to delete it. */

DROP VIEW top5_grossing_categories;