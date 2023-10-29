-- 1.This is to see the actor and the film they were in 
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_name, title
FROM actor AS a
LEFT JOIN actor_film AS af ON a.actor_id = af.actor_id
LEFT JOIN film AS f ON f.film_id=af.film_id;

-- 2.This is to see what actors have the most movies in the video rental shop
SELECT actor_name, total_movies
FROM (
    SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
           COUNT(f.title) AS total_films
    FROM actor AS a
    LEFT JOIN actor_film AS af ON a.actor_id = af.actor_id
    LEFT JOIN film AS f ON f.film_id = af.film_id
    GROUP BY actor_name
) AS subquery
WHERE total_films > 0
ORDER BY total_films DESC;

-- 3.This is to see the category of each film 
SELECT title, category_name 
FROM film AS f
LEFT JOIN category AS c on f.category_id=c.category_id
WHERE category_name not in ("UNKNOWN");

-- 4.This is to see the most popular categories 
SELECT COUNT(title) AS total_films, category_name 
FROM film AS f
LEFT JOIN category AS c ON f.category_id=c.category_id
WHERE category_name NOT IN ("UNKNOWN")
GROUP BY category_name
ORDER BY total_films DESC;

-- 5. This is to see the most popular day to rent a film. 
SELECT rental_dow, COUNT(store_id) AS totals
FROM rental AS r
LEFT JOIN inventory AS i ON r.inventory_id=i.inventory_id
GROUP BY rental_dow
ORDER BY totals DESC;

-- 6. This is to see the most popular day to return a film. 
SELECT return_dow, COUNT(store_id) AS totals
FROM rental AS r
LEFT JOIN inventory AS i ON r.inventory_id=i.inventory_id
GROUP BY return_dow
ORDER BY totals DESC;

-- 7. This is to see which films are returned late. 
SELECT COUNT(days_kept) AS late_returns , title
FROM rental as r
LEFT JOIN inventory AS i on r.inventory_id=i.inventory_id
LEFT JOIN film AS f on i.film_id=f.film_id
WHERE rental_duration_days < days_kept
GROUP BY title
ORDER BY late_returns DESC;

-- 8. This is to see how many films have been returned late.
SELECT COUNT(*) AS row_count
FROM 
(SELECT COUNT(days_kept) AS late_returns , title
FROM rental as r
LEFT JOIN inventory AS i on r.inventory_id=i.inventory_id
LEFT JOIN film AS f on i.film_id=f.film_id
WHERE rental_duration_days < days_kept
GROUP BY title
ORDER BY late_returns DESC) AS subquery;

-- 9. This is to see what customer has had the most late returns. 
SELECT COUNT(days_kept) AS late_returns , customer_id
FROM rental as r
LEFT JOIN inventory AS i on r.inventory_id=i.inventory_id
LEFT JOIN film AS f on i.film_id=f.film_id
WHERE rental_duration_days < days_kept
GROUP BY customer_id
ORDER BY late_returns DESC;












