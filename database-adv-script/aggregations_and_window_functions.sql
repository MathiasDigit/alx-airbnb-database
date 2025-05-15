-- Get the total number of bookings made by each user
SELECT 
  users.user_id,
  users.first_name,
  users.last_name,
  COUNT(bookings.booking_id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id, users.first_name, users.last_name;

-- Rank properties by total number of bookings
SELECT
  properties.name,
  COUNT(bookings.booking_id) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(bookings.booking_id) DESC) AS booking_rank
FROM properties
LEFT JOIN bookings ON properties.property_id = bookings.property_id
GROUP BY properties.property_id, properties.name;

-- ROW_NUMBER properties by total number of bookings
SELECT
  properties.name,
  COUNT(bookings.booking_id) AS total_bookings,
  ROW_NUMBER() OVER (ORDER BY COUNT(bookings.booking_id) DESC) AS booking_rank
FROM properties
LEFT JOIN bookings ON properties.property_id = bookings.property_id
GROUP BY properties.property_id, properties.name;