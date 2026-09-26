-- =============================================================
-- SQL for QA: data verification on a simple e-commerce model
--   1. Schema and test data  - so every query below can be executed
--   2. Basic queries         - reading data
--   3. Data quality checks   - finding broken data
--   4. QA verification       - checking expected results after an action
-- =============================================================
-- =============================================================
-- 1. SCHEMA AND TEST DATA
-- =============================================================

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id         INTEGER PRIMARY KEY,
    first_name TEXT    NOT NULL,
    last_name  TEXT    NOT NULL,
    email      TEXT,
    status     TEXT    NOT NULL        
);

CREATE TABLE products (
    id       INTEGER PRIMARY KEY,
    name     TEXT    NOT NULL,
    price    REAL    NOT NULL,
    quantity INTEGER NOT NULL            
);

CREATE TABLE orders (
    id         INTEGER PRIMARY KEY,
    user_id    INTEGER NOT NULL,
    order_date TEXT    NOT NULL,
    status     TEXT    NOT NULL         
);

CREATE TABLE order_items (
    order_id   INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity   INTEGER NOT NULL
);

INSERT INTO users (id, first_name, last_name, email, status) VALUES
    (1, 'Anna',   'Kowalska',  'anna.kowalska@example.com',  'active'),
    (2, 'Piotr',  'Nowak',     'piotr.nowak@example.com',    'active'),
    (3, 'Maria',  'Wisniewska','maria.w@example.com',        'inactive'),
    (4, 'Jakub',  'Zielinski', 'piotr.nowak@example.com',    'active'), 
    (5, 'Ewa',    'Lewandowska', NULL,                       'active');  

INSERT INTO products (id, name, price, quantity) VALUES
    (10, 'Wireless mouse',   89.99,  40),
    (11, 'Mechanical keyboard', 349.00, 12),
    (12, 'USB-C hub',        129.50,   0),
    (13, 'Laptop stand',     149.00,  -3),   
    (14, 'Webcam 1080p',     219.00,   7);

INSERT INTO orders (id, user_id, order_date, status) VALUES
    (100, 1, '2026-09-01', 'paid'),
    (101, 2, '2026-09-02', 'paid'),
    (102, 1, '2026-09-10', 'cancelled'),
    (103, 3, '2026-09-15', 'new'),
    (104, 4, '2026-09-20', 'paid');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
    (100, 10, 2),
    (100, 11, 1),
    (101, 12, 1),
    (102, 14, 3),
    (103, 10, 1),
    (104, 99, 1);   

-- =============================================================
-- 2. BASIC QUERIES
-- =============================================================

-- 2.1 All active users.
SELECT id, first_name, last_name, email
FROM users
WHERE status = 'active';

-- 2.2 Products more expensive than 100, most expensive first.
SELECT name, price
FROM products
WHERE price > 100
ORDER BY price DESC;

-- 2.3 Number of orders per user, including users with no orders.
SELECT u.id,
       u.first_name || ' ' || u.last_name AS customer,
       COUNT(o.id)                        AS total_orders
FROM users u
LEFT JOIN orders o ON o.user_id = u.id
GROUP BY u.id, customer
ORDER BY total_orders DESC;

-- 2.4 Order contents with product names and line value.
SELECT o.id              AS order_id,
       o.order_date,
       p.name            AS product_name,
       oi.quantity,
       p.price,
       oi.quantity * p.price AS line_total
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN products p     ON p.id        = oi.product_id
ORDER BY o.id;

-- 2.5 Order totals, only for orders above 200.
SELECT o.id AS order_id,
       SUM(oi.quantity * p.price) AS order_total
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN products p     ON p.id        = oi.product_id
WHERE o.status <> 'cancelled'
GROUP BY o.id
HAVING SUM(oi.quantity * p.price) > 200
ORDER BY order_total DESC;
