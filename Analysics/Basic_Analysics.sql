-- Display all customers
SELECT *
FROM customers;

-- Display all products
SELECT *
FROM products;

-- Find products costing more than ₹1,000
SELECT *
FROM products
WHERE price > 1000;

-- Find currently available products
SELECT *
FROM products
WHERE stock > 0;

-- Count total customers
SELECT COUNT(*) AS total_customers
FROM customers;