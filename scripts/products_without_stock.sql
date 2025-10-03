SELECT p.*
FROM products p
LEFT JOIN (
    SELECT product_id, SUM(CASE WHEN quantity > 0 THEN quantity ELSE 0 END) AS total_stock
    FROM stocks
    GROUP BY product_id
) AS stock_summary ON stock_summary.product_id = p.product_id
WHERE COALESCE(stock_summary.total_stock, 0) = 0;