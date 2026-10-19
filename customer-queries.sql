-- PostgreSQL 17 practice script.
-- Run only in an isolated practice database.
-- Uses a dedicated table name to avoid collisions with other examples.
-- This script is intended to be run once; repeated CREATE TABLE will fail.

CREATE TABLE portfolio_customers (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name TEXT NOT NULL,
    city TEXT,
    email TEXT
);

INSERT INTO portfolio_customers (customer_name, city, email)
VALUES
    ('Ayesha Khan', 'Karachi', 'ayesha@example.com'),
    ('Sam Lee', 'Lahore', 'sam@example.com'),
    ('Sara Ali', 'Karachi', 'sara@example.com');

SELECT customer_id, customer_name, city
FROM portfolio_customers
WHERE city = 'Karachi'
ORDER BY customer_name;

UPDATE portfolio_customers
SET city = 'Islamabad'
WHERE customer_name = 'Sam Lee';

SELECT * FROM portfolio_customers ORDER BY customer_id;

EXPLAIN SELECT customer_name
FROM portfolio_customers
WHERE city = 'Karachi';
