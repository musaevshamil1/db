---1---
SELECT 
category,
count(product_id) 
from products GROUP BY category

---2---
SELECT SUM(quantity * price_per_unit) 
FROM Order_Items;

---3---
SELECT
    full_name, 
    COUNT(order_id) 
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name

---4---
SELECT avg(vsevo)
FROM(
    SELECT order_id,
    sum(quantity * price_per_unit) as vsevo
    FROM order_items oi
    GROUP BY order_id
)

---5---
SELECT status,
COUNT(status)
FROM orders GROUP BY status

---6---
SELECT 
category,
count(product_id) AS banan
from products 
GROUP BY category
HAVING COUNT(product_id) > 1

---7---
SELECT full_name,
count(o.costomer_id)
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY full_name
HAVING count(o.costomer_id) > 1

----8---
SELECT product_name,
SUM(quantity) AS total
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total DESC
LIMIT 1;
