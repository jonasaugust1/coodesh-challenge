SELECT
    s.store_id,
    s.store_name,
    b.brand_id,
    b.brand_name,
    COUNT(DISTINCT oi.product_id) AS sales_count
FROM orders AS o
JOIN order_items AS oi ON o.order_id = oi.order_id
JOIN products AS p ON oi.product_id = p.product_id
JOIN brands AS b ON p.brand_id = b.brand_id
JOIN stores AS s ON o.store_id = s.store_id
WHERE o.status = 'completed' 
GROUP BY s.store_id, s.store_name, b.brand_id, b.brand_name
ORDER BY sales_count DESC;