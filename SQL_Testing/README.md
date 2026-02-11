## Overview
This section demonstrates basic SQL knowledge from a **QA perspective**.

The queries are written based on a simplified e-commerce database model and are intended to show how SQL can be used by a QA engineer to validate application data and business logic.

---

## Database Model (Simplified)
The following tables are assumed:
- users (id, first_name, last_name, email, status)
- products (id, name, price, quantity)
- orders (id, user_id, order_date, status)
- order_items (order_id, product_id, quantity)

---

## What is Covered
- Basic SELECT queries
- Filtering using WHERE
- Aggregation using COUNT and GROUP BY
- JOINs between multiple tables
- QA-oriented test scenarios using SQL

---

## QA Use Cases
Examples of what a QA en
