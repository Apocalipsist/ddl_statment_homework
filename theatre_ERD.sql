-- Teton Theater
CREATE TABLE theater (
	theater_id SERIAL PRIMARY KEY,
	theater_name VARCHAR(50),
	address VARCHAR(50),
	email_address VARCHAR(50)
);

SELECT *
FROM theater;

ALTER TABLE	theater RENAME theatre;

ALTER TABLE	theatre RENAME COLUMN theater_id TO theatre_id;


CREATE TABLE Customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address VARCHAR(150),
	email_address VARCHAR(50),
	loyalty_id BOOLEAN DEFAULT FALSE
);

SELECT * FROM customer;


CREATE TABLE Ticket (
	ticket_id SERIAL PRIMARY KEY,
	price NUMERIC(5,2),
	showtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	ticket_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

SELECT * FROM Ticket;

CREATE TABLE Movie (
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(50),
	rating VARCHAR(15),
	release_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	theatre_id INTEGER NOT NULL,
	FOREIGN KEY(theatre_id) REFERENCES Theatre(theatre_id)
);

SELECT * FROM Movie;


CREATE TABLE Movie_ticket (
	ticket_id INTEGER NOT NULL,
	FOREIGN KEY(ticket_id) REFERENCES Ticket(ticket_id),
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES Movie(movie_id)
);

SELECT * FROM Movie_ticket;