-- =============================================================
-- SQL for QA: data verification on a simple e-commerce model
-- Author: Denys Yanovskyi (github.com/Des-ua)
--
-- Runs as-is in SQLite (no setup required):
--     sqlite3 :memory: < sql_tasks.sql
-- Also runs in PostgreSQL and MySQL with minimal changes.
--
-- The file is split into four parts:
--   1. Schema and test data  - so every query below can be executed
--   2. Basic queries         - reading data
--   3. Data quality checks   - finding broken data
--   4. QA verification       - checking expected results after an action
-- =============================================================


-- =============================================================
-- 1. SCHEMA AND TEST DATA
-- The data is intentionally "dirty": it contains a duplicate
-- email, an order line pointing to a deleted product, and a
-- negative quantity. The checks in part 3 are meant to find them.
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
    status     TEXT    NOT NULL          -- 'active' | 'inactive'
);

CREATE TABLE products (
    id       INTEGER PRIMARY KEY,
    name     TEXT    NOT NULL,
    price    REAL    NOT NULL,
    quantity INTEGER NOT NULL            -- stock on hand
);

CREATE TABLE orders (
    id         INTEGER PRIMARY KEY,
    user_id    INTEGER NOT NULL,
    order_date TEXT    NOT NULL,
    status     TEXT    NOT NULL          -- 'new' | 'paid' | 'cancelled'
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
    (4, 'Jakub',  'Zielinski', 'piotr.nowak@example.com',    'active'),  -- duplicate email
    (5, 'Ewa',    'Lewandowska', NULL,                       'active');  -- missing email

INSERT INTO products (id, name, price, quantity) VALUES
    (10, 'Wireless mouse',   89.99,  40),
    (11, 'Mechanical keyboard', 349.00, 12),
    (12, 'USB-C hub',        129.50,   0),
    (13, 'Laptop stand',     149.00,  -3),   -- negative stock
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
    (104, 99, 1);   -- product 99 does not exist
