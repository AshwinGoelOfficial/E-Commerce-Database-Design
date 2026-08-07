-- Customers by City
SELECT
    city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY customer_count DESC;

-- Customers and their orders
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC;

-- Customers who have never placed an order
SELECT
    c.customer_id,
    c.name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Top customer by spend
SELECT c.name,
       SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.name
ORDER BY total_spent DESC;