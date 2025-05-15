-- Create the database
CREATE DATABASE airbnb;
SET SEARCH_PATH = "I_AIR";
-- Table: users
CREATE TABLE users (
user_id UUID PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
password_hash VARCHAR(255) NOT NULL,
phone_number VARCHAR(20),
role VARCHAR(10) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: properties
CREATE TABLE properties (
property_id UUID PRIMARY KEY,
host_id UUID REFERENCES users(user_id),
name VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
location VARCHAR(255) NOT NULL,
pricepernight DECIMAL(10,2) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: bookings
CREATE TABLE bookings (
booking_id UUID PRIMARY KEY,
property_id UUID REFERENCES properties(property_id),
user_id UUID REFERENCES users(user_id),
start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_price DECIMAL(10,2) NOT NULL,
status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: payments
CREATE TABLE payments (
payment_id UUID PRIMARY KEY,
booking_id UUID REFERENCES bookings(booking_id),
amount DECIMAL(10,2) NOT NULL,
payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
payment_method VARCHAR(20) CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')) NOT NULL
);

-- Table: reviews
CREATE TABLE reviews (
review_id UUID PRIMARY KEY,
property_id UUID REFERENCES properties(property_id),
user_id UUID REFERENCES users(user_id),
rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
comment TEXT NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: messages
CREATE TABLE messages (
message_id UUID PRIMARY KEY,
sender_id UUID REFERENCES users(user_id),
recipient_id UUID REFERENCES users(user_id),
message_body TEXT NOT NULL,
sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
