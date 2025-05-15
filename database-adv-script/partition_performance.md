# 📊 Query Performance Report: Partitioned vs. Non-Partitioned `bookings` Table

## 🌟 Goal

Evaluate query performance after applying **partitioning** on the `bookings` table using the `start_date` column.

---

## 🧪 Test Scenario

**Query Executed:**

```sql
SELECT *
FROM bookings
WHERE start_date >= '2025-01-01' AND start_date < '2025-06-01';
```

---

## ⚙️ Environment

* PostgreSQL version: 17+
* Dataset: 2 bookings (minimal test dataset)
* Partitioning method: Monthly (RANGE partition by `start_date`)
* Partition used: `bookings_2025_06`

---

## 📉 Performance Results

| Metric             | Before Partitioning | After Partitioning |
| ------------------ | ------------------- | ------------------ |
| Planning Time      | 0.579 ms            | 0.370 ms           |
| Execution Time     | 0.154 ms            | 0.084 ms           |
| Partitions Scanned | N/A                 | 1 of 1             |

---

## ✅ Key Observations

* **Planning and execution times slightly improved**, even with only 2 rows.
* PostgreSQL only scans the relevant monthly partition, reducing overhead.
* Structural benefits of partitioning will become more impactful with larger datasets.

---

## 🧠 Conclusion

Partitioning the `bookings` table by `start_date` is a strategic optimization:

* Provides modest gains on small datasets
* Scales efficiently for large, time-based data like bookings
* Ensures better query targeting and planner efficiency as data grows

> Recommended for applications expecting large volumes of date-based records.
