-- Total revenue
SELECT SUM(amount) AS total_revenue
FROM payments;

-- Revenue by product
SELECT
    p.product_name,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;

-- Revenue by category
SELECT
    p.category,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Revenue by customers
SELECT
    c.customer_id,
    c.name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

