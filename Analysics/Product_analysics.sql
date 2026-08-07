-- Product by category
SELECT
    category,
    COUNT(*) AS product_count
FROM products
GROUP BY category
ORDER BY product_count DESC;

-- Most expensive product
SELECT
    product_name,
    category,
    price
FROM products
ORDER BY price DESC;

-- Best selling product
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC;

-- Low-Stock products
SELECT
    product_id,
    product_name,
    stock
FROM products
WHERE stock < 10
ORDER BY stock;