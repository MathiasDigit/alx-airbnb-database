# Optimization Report: SQL Query Performance Improvement

## Overview

This report outlines the performance optimization carried out on a SQL query used to retrieve detailed booking information from an Airbnb-like system. The query initially included multiple joins, unfiltered data, and no explicit limits, leading to potentially higher resource consumption as the dataset grows.

---

## Original Query Performance

Before optimization, the query exhibited the following performance metrics:

* **Planning Time:** 0.579 ms
* **Execution Time:** 0.154 ms

While these numbers seem low for a small dataset, they could become significantly worse with larger data volumes due to:

* Unfiltered joins on large tables.
* No LIMIT clause.
* No usage of partial indexes or indexed filtering conditions.

---

## Optimizations Applied

### ✅ **Added Filtering Early in the Query**

We included a `WHERE` clause to restrict results to `bookings.status = 'confirmed'`. Filtering early in the query reduces the number of rows processed by the joins and sorting operations.

### ✅ **Limited the Result Set**

Added a `LIMIT 100` clause to avoid retrieving more data than needed. This significantly reduces the memory and I/O footprint, especially when paginating through results.

### ✅ **Improved Sorting Performance**

Used `ORDER BY bookings.start_date DESC` in combination with the filtering condition to take advantage of a composite index for sorting filtered data.

### ✅ **Index Recommendations**

To support the optimizations, we recommend the following indexes:

```sql
CREATE INDEX idx_bookings_status_start_date ON bookings(status, start_date DESC);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
```

---

## Optimized Query Performance

After the optimization, the query showed improved performance metrics:

* **Planning Time:** 0.370 ms
* **Execution Time:** 0.084 ms

This reflects a:

* **\~36% reduction in planning time**
* **\~45% reduction in execution time**

---

## Conclusion

By applying targeted optimizations—filtering early, limiting results, and recommending indexes—we achieved faster planning and execution. These changes make the system more scalable and responsive, especially under heavy workloads or growing data sizes.

---
