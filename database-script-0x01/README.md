<h1 align="center">🏠 Airbnb Database Schema</h1>

<p align="center">
  A complete and normalized relational database designed to power a rental platform like Airbnb.
  <br/>
  <strong>Technologies:</strong> PostgreSQL | SQL | ERD | Relational Modeling
</p>

---

## 📚 Project Description

This project is a well-structured **relational database schema** designed for an **Airbnb-style booking platform**. It supports user management, property listings, reservations, reviews, payments, and messaging between users.

The schema is designed following **3rd Normal Form (3NF)** principles for data integrity, scalability, and maintainability.

---

## 🧩 Entities and Relationships

<h3>🧑 Users</h3>

- Stores user data (guests, hosts, admins)
- Roles managed via ENUM
- Used for property ownership, bookings, messaging, and reviews

<h3>🏡 Properties</h3>

- Each property is listed by a user (host)
- Contains key attributes like description, location, and price
- Linked to reviews and bookings

<h3>📅 Bookings</h3>

- Connects users to properties with start and end dates
- Includes total price and booking status
- One-to-many relationship from user and property

<h3>💳 Payments</h3>

- Linked to a single booking
- Tracks payment method and amount
- Supports credit cards, PayPal, and Stripe

<h3>⭐ Reviews</h3>

- Users can leave a review on a property they booked
- Stores rating (1 to 5) and comment
- Enforces review constraints using CHECK

<h3>💬 Messages</h3>

- Enables user-to-user communication
- Messages are timestamped and linked to sender and recipient

---

## 🧱 Database Structure (ER Diagram Overview)

<details>
<summary><strong>Click to expand</strong></summary>

- <strong>users</strong> → <i>user_id (PK)</i>
- <strong>properties</strong> → <i>host_id (FK → users)</i>
- <strong>bookings</strong> → <i>property_id (FK), user_id (FK)</i>
- <strong>payments</strong> → <i>booking_id (FK)</i>
- <strong>reviews</strong> → <i>property_id (FK), user_id (FK)</i>
- <strong>messages</strong> → <i>sender_id (FK), recipient_id (FK)</i>

</details>

---

## 🔐 Data Integrity

- ✅ **UUID primary keys** for uniqueness across tables
- ✅ **Foreign keys** with ON DELETE CASCADE (optional for flexibility)
- ✅ **ENUMs and CHECK constraints** to validate role, status, rating
- ✅ **Timestamps** for tracking actions like creation or message sent time

---

## 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/yourusername/airbnb-database-schema.git
cd airbnb-database-schema

# Access PostgreSQL and create the database
psql
CREATE DATABASE airbnb;
\c airbnb

# Run schema.sql to create all tables
\i schema.sql
