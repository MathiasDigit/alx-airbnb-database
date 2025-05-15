# Index Performance in PostgreSQL

This document explains how to improve query performance in PostgreSQL by creating indexes on frequently queried columns. It also demonstrates how to evaluate performance using `EXPLAIN` and `ANALYZE`.

---

## 🚀 Why Indexes Matter

Indexes make data retrieval faster by allowing the database engine to locate rows without scanning the entire table.

They are especially useful on columns frequently used in:

* `WHERE` conditions
* `JOIN` operations
* `ORDER BY` clauses
* Aggregate functions

---

## 🛠️ Creating Indexes

Here are some example `CREATE INDEX` statements based on common queries:

```sql
-- Index on user_id for faster lookup in the bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on status to speed up filtering
CREATE INDEX idx_bookings_status ON bookings(status);

-- Composite index on user_id and status
CREATE INDEX idx_bookings_user_status ON bookings(user_id, status);
```

---

## 📊 Measuring Performance with EXPLAIN and ANALYZE

### 1. Before Creating Index

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 'some-user-id' AND status = 'confirmed';
```

Look for:

* `Seq Scan` (sequential scan = slow)
* Total cost and execution time

### 2. After Creating Index

```sql
-- Now run the same query again
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 'some-user-id' AND status = 'confirmed';
```

Look for:

* `Index Scan` (much faster)
* Reduced execution time and cost

---

## ✅ Tips

* Use `EXPLAIN` for a query plan (no execution)
* Use `EXPLAIN ANALYZE` for real execution time (use with caution)
* Drop unused indexes to save storage and improve write performance

---



