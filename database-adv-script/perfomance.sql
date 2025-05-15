-- Initial query to retrieve all bookings with user, property, and payment details

SELECT
  bookings.booking_id,
  bookings.start_date,
  bookings.end_date,
  bookings.total_price,
  bookings.status,
  bookings.created_at AS booking_created_at,

  users.user_id,
  users.first_name,
  users.last_name,
  users.email,

  properties.property_id,
  properties.name AS property_name,
  properties.location,
  properties.pricepernight,

  payments.payment_id,
  payments.amount,
  payments.payment_method

FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id
INNER JOIN properties ON bookings.property_id = properties.property_id
LEFT JOIN payments ON bookings.booking_id = payments.booking_id;

-- Optimized query to fetch confirmed bookings with related user, property, and payment details,
-- applying filters and limits to reduce execution time
EXPLAIN ANALYZE
SELECT
  bookings.booking_id,
  bookings.start_date,
  bookings.end_date,
  bookings.total_price,
  bookings.status,
  bookings.created_at AS booking_created_at,

  users.user_id,
  users.first_name,
  users.last_name,
  users.email,

  properties.property_id,
  properties.name AS property_name,
  properties.location,
  properties.pricepernight,

  payments.payment_id,
  payments.amount,
  payments.payment_method

FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id
INNER JOIN properties ON bookings.property_id = properties.property_id
LEFT JOIN payments ON bookings.booking_id = payments.booking_id

WHERE bookings.status = 'confirmed'  -- Filter only confirmed bookings early to reduce rows processed

ORDER BY bookings.start_date DESC

LIMIT 100;  -- Limit result set size for faster response
