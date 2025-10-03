SELECT p.*
FROM products AS p
LEFT JOIN (
    SELECT DISTINCT oi.product_id
    FROM order_items AS oi
    JOIN orders AS o ON oi.order_id = o.order_id
    WHERE o.status = 'completed'
) AS sold_products ON sold_products.product_id = p.product_id
WHERE sold_products.product_id IS NULL;