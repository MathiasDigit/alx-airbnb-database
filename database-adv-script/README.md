# SQL Query Collection for Property Booking System

This repository contains a set of practical SQL queries used for data analysis and reporting within a property booking system. The queries demonstrate common SQL techniques such as joins, aggregations, subqueries, and window functions.

---

## 🔗 INNER JOIN — Bookings and Users

```sql
SELECT 
  users.first_name, 
  users.last_name, 
  bookings.start_date, 
  bookings.status
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;
```

**Description**: Retrieves bookings along with the first and last name of users who made them. Only includes bookings that are linked to existing users.

---

## 🏠 LEFT JOIN — Properties and Their Reviews

```sql
SELECT 
  properties.name, 
  reviews.rating, 
  reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;
```

**Description**: Lists all properties with their reviews. Properties with no reviews are still shown, with `NULL` in the review fields.

---

## 🌐 FULL OUTER JOIN — Bookings and Users

```sql
SELECT 
  users.first_name, 
  users.last_name, 
  bookings.start_date, 
  bookings.status
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;
```

**Description**: Combines all users and all bookings, including users with no bookings and bookings not linked to any user.

---

## ⭐ Filter Properties with High Ratings

```sql
SELECT *
FROM properties
WHERE property_id IN (
  SELECT property_id
  FROM reviews
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);
```

**Description**: Returns all property records where the average review rating is greater than 4.0. Uses a subquery with `GROUP BY` and `HAVING`.

---

## 👤 Users with More Than 3 Bookings

```sql
SELECT *
FROM users u
WHERE (
  SELECT COUNT(*)
  FROM bookings b
  WHERE b.user_id = u.user_id
) > 3;
```

**Description**: Finds users who have made more than three bookings using a correlated subquery.

---

## 📊 Total Bookings per User

```sql
SELECT 
  users.user_id,
  users.first_name,
  users.last_name,
  COUNT(bookings.booking_id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id, users.first_name, users.last_name;
```

**Description**: Shows the total number of bookings made by each user. Includes users with zero bookings.

---

## 🏆 Rank Properties by Booking Volume

```sql
SELECT
  properties.name,
  COUNT(bookings.booking_id) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(bookings.booking_id) DESC) AS booking_rank
FROM properties
LEFT JOIN bookings ON properties.property_id = bookings.property_id
GROUP BY properties.property_id, properties.name;
```

**Description**: Uses a window function to assign a ranking to properties based on how many bookings they've received.

---

### 🧪 Database Compatibility

These queries are designed for **PostgreSQL**, but can be adapted for other relational databases with minor syntax adjustments.

Feel free to fork and e
