SELECT COUNT(*) AS not_buyers
FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);