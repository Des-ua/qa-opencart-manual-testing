-- Database model (simplified for QA practice)
-- Tables:
-- users (id, first_name, last_name, email, status)
-- products (id, name, price, quantity)
-- orders (id, user_id, order_date, status)
-- order_items (order_id, product_id, quantity)

-- Get all active users
SELECT *
FROM users
WHERE status = 'active';

-- Get products with price greater than 100
SELECT name, price
FROM products
WHERE price > 100;

-- Count orders per user
SELECT user_id, COUNT(*) AS total_orders
FROM orders
GROUP BY user_id;

-- Get order details with product names
SELECT o.id AS order_id,
       p.name AS product_name,
       oi.quantity
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

-- QA Test Scenarios using SQL

-- Verify user is created after registration
-- Expected: user record exists in users table

-- Verify order is created after checkout
-- Expected: new record exists in orders table

-- Verify product quantity decreases after order
-- Expected: products.quantity is reduced
