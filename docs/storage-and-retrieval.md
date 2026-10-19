# PostgreSQL Storage and Query Retrieval

**Audience:** Readers new to database performance concepts.  
**Status:** Conceptual overview, not a performance benchmark.

## How data is stored

A PostgreSQL table contains rows. On disk, PostgreSQL stores table data in **pages** (usually 8 KB in a standard build). An **index** is an additional data structure that can help locate rows matching certain conditions.

## How PostgreSQL retrieves data

Consider this query:

```sql
SELECT customer_name
FROM portfolio_customers
WHERE city = 'Karachi';
```

PostgreSQL's **query planner** selects an execution plan based on estimated costs. It might use a **sequential scan** to read the table or an **index scan** to locate relevant rows. The choice depends on table size, available indexes, and planner statistics.

## Add an index

```sql
CREATE INDEX portfolio_customers_city_idx
ON portfolio_customers (city);
```

An index may improve lookups by city, but it also consumes storage and adds overhead when data changes. An index is not automatically the best plan for every query.

## Inspect a query plan

```sql
EXPLAIN
SELECT customer_name
FROM portfolio_customers
WHERE city = 'Karachi';
```

`EXPLAIN` displays the planned execution strategy. `EXPLAIN ANALYZE` executes the statement and reports actual runtime statistics. Use care with `EXPLAIN ANALYZE` on data-changing statements because those statements will execute.

## Transactions and MVCC

A **transaction** groups database operations into a logical unit of work. PostgreSQL uses **multi-version concurrency control** (MVCC) to support consistent data views and concurrent activity. Understanding `BEGIN`, `COMMIT`, and `ROLLBACK` is a good starting point before exploring MVCC internals.

## Questions to validate with an engineer

- Which PostgreSQL versions does the documentation support?
- What data sizes and query patterns were used in a performance example?
- Should the guide explain how to interpret an actual `EXPLAIN` output?

## References

- [Database physical storage](https://www.postgresql.org/docs/17/storage.html)
- [Using EXPLAIN](https://www.postgresql.org/docs/17/using-explain.html)
- [MVCC introduction](https://www.postgresql.org/docs/17/mvcc-intro.html)
