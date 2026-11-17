-- 1---
SELECT 
    c.full_name,
    o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

----2-
SELECT c.full_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.customer_id is NULL

----3---
SELECT 
    p.product_name,
    oi.quantity,
    oi.price_per_unit
FROM Order_Items oi 
JOIN Products p ON oi.product_id = p.product_id
WHERE oi.order_id = 1

--4--
SELECT c.full_name
FROM Customers c
WHERE c.customer_id IN(
    SELECT o.customer_id
    FROM Orders o 
    JOIN Order_Items oi ON oi.order_id = o.order_id
    JOIN Products p ON oi.product_id = p.product_id
    WHERE p.product_name = 'Смартфон'
)

--5--
SELECT product_name, price
FROM Products
WHERE price > (SELECT AVG(price) FROM Products);

---6-----
SELECT o.order_id, o.order_date 
FROM Orders o
WHERE EXISTS (
    SELECT * 
    FROM Order_Items oi
    WHERE oi.order_id = o.order_id AND oi.price_per_unit > 100000
);

---7---
--1--
SELECT c.full_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Order_Items oi ON oi.order_id = o.order_id
LEFT JOIN Products p ON oi.product_id = p.product_id AND p.product_name = 'Ноутбук'
WHERE p.product_name IS NULL

--2--
SELECT c.full_name
FROM Customers c
WHERE c.customer_id NOT IN(
    SELECT o.customer_id
    FROM orders o
    JOIN Order_Items oi ON oi.order_id = o.order_id
    JOIN Products p ON oi.product_id = p.product_id
    WHERE p.product_name = 'Ноутбук'
)

---8---
SELECT p.product_name
FROM Order_Items oi
RIGHT JOIN Products p ON oi.product_id = p.product_id
WHERE oi.product_id IS NULL

--9--
SELECT 
c.full_name,
p.product_name,
oi.quantity
FROM Customers c
FULL OUTER JOIN Orders o ON c.customer_id = o.customer_id
FULL OUTER JOIN Order_Items oi ON o.order_id = oi.order_id
FULL OUTER JOIN Products p ON oi.product_id = p.product_id;

---10---
--1--
SELECT c.full_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON oi.order_id = o.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE p.price = (SELECT max(price) FROM Products)

--2--
SELECT c.full_name
FROM Customers c
WHERE c.customer_id IN(
    SELECT o.customer_id
    FROM orders o 
    WHERE o.order_id IN(
        SELECT order_id
        FROM order_items 
        WHERE product_id IN(
            SELECT product_id
            FROM products
            WHERE price = (SELECT MAX(price)
                FROM products
             )
        )
    )
)
    
---11---
SELECT DISTINCT
full_name,
category
FROM Customers 
CROSS JOIN Products p 
ORDER BY full_name

---12---
SELECT 
    customer.full_name AS new_customer, 
    recommender.full_name AS recommended_by 
FROM Customers customer
JOIN Customers recommender ON customer.recommended_by = recommender.customer_id;
