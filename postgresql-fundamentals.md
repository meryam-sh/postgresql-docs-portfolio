# PostgreSQL Fundamentals: Create and Query a Table

**Audience:** A beginner learning how relational databases work.  
**Environment:** PostgreSQL 17, isolated practice database.  
**Status:** Illustrative examples; validate in your own practice database before marking complete.

## Overview

PostgreSQL is an open-source **relational database management system** (RDBMS). It stores information in tables. **SQL** (Structured Query Language) is the language used to define, retrieve, and modify that information.

A **database** contains **schemas**, a schema groups objects such as **tables**, and a table consists of **rows** (records) and **columns** (fields). A **primary key** uniquely identifies a row. A **foreign key** links data between related tables.

## Prerequisites

- A PostgreSQL 17 practice database, not a production system.
- Permission to create tables in the target schema.
- A SQL editor or the `psql` command-line client.

## Step 1: Create a table

```sql
CREATE TABLE portfolio_customers (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name TEXT NOT NULL,
    city TEXT,
    email TEXT
);
```

`GENERATED ALWAYS AS IDENTITY` assigns an ID when you insert a record. `PRIMARY KEY` requires unique, non-null values. `NOT NULL` means a customer name is required.

## Step 2: Insert fictional records

```sql
INSERT INTO portfolio_customers (customer_name, city, email)
VALUES
    ('Ayesha Khan', 'Karachi', 'ayesha@example.com'),
    ('Sam Lee', 'Lahore', 'sam@example.com'),
    ('Sara Ali', 'Karachi', 'sara@example.com');
```

**Expected result:** Three new rows. The database generates their IDs automatically.

## Step 3: Retrieve matching rows

```sql
SELECT customer_id, customer_name, city
FROM portfolio_customers
WHERE city = 'Karachi'
ORDER BY customer_name;
```

**Expected result:** Two records, ordered alphabetically: Ayesha Khan and Sara Ali.

- `SELECT` identifies the columns to retrieve.
- `FROM` identifies the table.
- `WHERE` filters rows.
- `ORDER BY` sorts the results.

## Step 4: Update one row

```sql
UPDATE portfolio_customers
SET city = 'Islamabad'
WHERE customer_name = 'Sam Lee';
```

**Warning:** `UPDATE` and `DELETE` without an appropriate `WHERE` clause can affect every row in a table. Inspect your filter before modifying data.

## Step 5: Try a transaction

```sql
BEGIN;
UPDATE portfolio_customers
SET city = 'Rawalpindi'
WHERE customer_name = 'Sam Lee';
ROLLBACK;
```

`BEGIN` starts a transaction; `ROLLBACK` undoes changes made within it. `COMMIT` would make the transaction's changes permanent.

## Validation checklist

- [ ] Run the commands against an isolated practice database.
- [ ] Verify the two-row result from Step 3.
- [ ] Confirm the update changed only one row.
- [ ] Record the server version used for testing.

## References

- [PostgreSQL 17 tutorial](https://www.postgresql.org/docs/17/tutorial.html)
- [PostgreSQL SQL command reference](https://www.postgresql.org/docs/17/sql-commands.html)
