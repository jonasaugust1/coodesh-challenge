SELECT s.*
FROM staffs AS s
WHERE NOT EXISTS (
    SELECT 1
    FROM orders AS o
    WHERE o.staff_id = s.staff_id
);