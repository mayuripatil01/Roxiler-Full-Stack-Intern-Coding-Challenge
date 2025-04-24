-- users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(60) NOT NULL CHECK (char_length(name) >= 20),
  email VARCHAR(100) UNIQUE NOT NULL,
  password TEXT NOT NULL,
  address VARCHAR(400),
  role VARCHAR(20) CHECK (role IN ('admin', 'user', 'owner')),
  created_at TIMESTAMP DEFAULT NOW()
);

-- stores table
CREATE TABLE stores (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(400),
  owner_id INTEGER REFERENCES users(id)
);

-- ratings table
CREATE TABLE ratings (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  store_id INTEGER REFERENCES stores(id),
  rating INTEGER CHECK (rating >= 1 AND rating <= 5),
  created_at TIMESTAMP DEFAULT NOW()
);
