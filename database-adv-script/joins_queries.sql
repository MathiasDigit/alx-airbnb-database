-- INNER JOIN between bookings and users
SELECT 
  users.first_name, 
  users.last_name, 
  bookings.start_date, 
  bookings.status
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;

-- LEFT JOIN between properties and their reviews
SELECT 
    properties.name, 
    reviews.rating, 
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;

-- FULL OUTER JOIN between bookings and users
SELECT 
    users.first_name, 
    users.last_name, 
    bookings.start_date, 
    bookings.status
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;

