-- Indexes for users table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_name ON users(first_name);
-- Indexes for bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_status ON bookings(status);

-- Indexes for properties table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(pricepernight);
CREATE INDEX idx_properties_name ON properties(name);




