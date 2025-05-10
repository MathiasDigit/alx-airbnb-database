-- Create sample users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  -- Guest user
  ('00000000-0000-0000-0000-000000000001', 'Alice', 'Smith', 'alice@example.com', 'hashed_pwd1', '1234567890', 'guest'),
  -- Host user
  ('00000000-0000-0000-0000-000000000002', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pwd2', '2345678901', 'host'),
  -- Admin user
  ('00000000-0000-0000-0000-000000000003', 'Carol', 'Williams', 'carol@example.com', 'hashed_pwd3', '3456789012', 'admin');

-- Create sample properties listed by the host
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
  ('10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Cozy Cottage', 'A cozy cottage in the countryside.', 'Bordeaux, France', 75.00),
  ('10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', 'Modern Loft', 'Modern loft downtown with amenities.', 'Paris, France', 120.00);

-- Create sample bookings made by the guest
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
  ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '2025-06-10', '2025-06-15', 375.00, 'confirmed'),
  ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', '2025-07-01', '2025-07-04', 360.00, 'pending');

-- Create sample payments related to the bookings
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES 
  ('30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 375.00, 'credit_card'),
  ('30000000-0000-0000-0000-000000000002', '20000000-0000-0000-0000-000000000002', 360.00, 'paypal');

-- Create sample reviews submitted by the guest
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES 
  ('40000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 5, 'Amazing stay! Very clean and peaceful.'),
  ('40000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 4, 'Nice place, great location.');

-- Create sample messages between guest and host
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES 
  ('50000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Hi! Is your loft available for early check-in?'),
  ('50000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Yes, check-in from 1 PM is fine.');
