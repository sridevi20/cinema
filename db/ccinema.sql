DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;
DROP TABLE movies;

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT,
  total INT
);

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT
);

CREATE TABLE movies(
  id SERIAL4 PRIMARY KEY,
  show_time INT,
  year INT
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT REFERENCES films(id) ON DELETE CASCADE,
  movie_id INT REFERENCES movies(id) ON DELETE CASCADE
);
