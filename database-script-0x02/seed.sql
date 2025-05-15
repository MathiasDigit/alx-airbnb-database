-- Create sample users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('00000000-0000-0000-0000-000000000001', 'Alice', 'Dupont', 'alice@example.com', 'hashed_password1', '0612345678', 'host'),
  ('00000000-0000-0000-0000-000000000002', 'Bob', 'Martin', 'bob@example.com', 'hashed_password2', '0698765432', 'guest'),
  ('00000000-0000-0000-0000-000000000003', 'Claire', 'Admin', 'admin@example.com', 'hashed_password3', '0600000000', 'admin');

-- Create sample properties listed by the host Alice
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '00000000-0000-0000-0000-000000000001', 'Appartement Paris Centre', 'Beau studio proche de la Tour Eiffel', 'Paris, France', 120.00),
  ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '00000000-0000-0000-0000-000000000002', 'Chalet Montagne', 'Chalet confortable dans les Alpes', 'Chamonix, France', 200.00);


-- Create sample bookings made by the guest
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '00000000-0000-0000-0000-000000000001', '2025-06-01', '2025-06-05', 480.00, 'confirmed'),
  ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '00000000-0000-0000-0000-000000000002', '2025-07-10', '2025-07-12', 400.00, 'pending');


-- Create sample payments related to the bookings
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('ccccccc1-cccc-cccc-cccc-cccccccccccc', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 480.00, 'credit_card'),
  ('ccccccc2-cccc-cccc-cccc-cccccccccccc', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 400.00, 'paypal');

-- Create sample reviews submitted by the guest
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('ddddddd1-dddd-dddd-dddd-dddddddddddd', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '00000000-0000-0000-0000-000000000001', 5, 'Super séjour, hôte très accueillant !'),
  ('ddddddd2-dddd-dddd-dddd-dddddddddddd', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '00000000-0000-0000-0000-000000000002', 4, 'Très beau chalet mais un peu loin du centre');

-- Create sample messages between guest and host
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeeee', '22222222-2222-2222-2222-222222222222', '00000000-0000-0000-0000-000000000001', 'Bonjour, est-ce que votre logement est disponible en juin ?'),
  ('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000002', 'Oui, il est libre du 1er au 5 juin.');
