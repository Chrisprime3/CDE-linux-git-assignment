

SELECT id, standard_qty, gloss_qty, poster_qty
FROM orders
WHERE standard_qty = 0
  AND (gloss_qty > 1000 OR poster_qty > 1000);
