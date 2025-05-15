-- Partitioned Bookings Table by start_date (monthly range partitions)

-- Step 1: Create the parent partitioned table
CREATE TABLE bookings (
  booking_id UUID NOT NULL,
  property_id UUID REFERENCES properties(property_id),
  user_id UUID REFERENCES users(user_id),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- Step 2: Create child partitions (example: for Jan, Feb, Mar 2025)
CREATE TABLE bookings_2025_01 PARTITION OF bookings
  FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE bookings_2025_02 PARTITION OF bookings
  FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE bookings_2025_03 PARTITION OF bookings
  FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');

-- Step 3: Add default partition to catch all unmatched dates (optional)
CREATE TABLE bookings_default PARTITION OF bookings
  DEFAULT;


