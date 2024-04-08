create database atcanalysis;

create table flight_details(
flight_no varchar(30) not null,date date not null,
airline varchar(60) not null,flight_category varchar(40) not null,
aircraft_type varchar(40) not null,
primary key(flight_no,date)
);

create table crew_information_arrival(
pilot_id int not null,pilot_name varchar(80) not null,
copilot_id int not null,copilot_name varchar(80) not null,
flight_no varchar(30) not null,date date not null,
foreign key(flight_no,date)references flight_details
(flight_no,date)
);

create table crew_information_departure(
pilot_id int not null,pilot_name varchar(80) not null,
copilot_id int not null,copilot_name varchar(80) not null,
flight_no varchar(30) not null,date date not null,
foreign key(flight_no,date)references flight_details
(flight_no,date)
);

create table flight_departing(
departure_time time not null,delay_departure boolean not null,
new_departure_time time not null,
flight_no varchar(30) not null,date date not null,
foreign key(flight_no,date)references flight_details
(flight_no,date)
);

create table flight_arriving(
arrival_time time not null,arrival_departure boolean not null,
new_arrival_time time not null,
flight_no varchar(30) not null,date date not null,
foreign key(flight_no,date)references flight_details
(flight_no,date)
);


create table cancellation(
status boolean not null,
flight_no varchar(30) not null,date date not null,
foreign key(flight_no,date)references flight_details
(flight_no,date)
);

CREATE TABLE weatherinformationandfuelavailability (
  id INT NOT NULL AUTO_INCREMENT,
  wind_speed VARCHAR(20),
  cloud_cover VARCHAR(100),
  fuel_availability VARCHAR(15),
  conditions VARCHAR(30),
  visibility VARCHAR(15),
  PRIMARY KEY (id)
);

CREATE TABLE diversion (
diverted_airport VARCHAR(50),
wind_speed VARCHAR(20) ,
cloud_cover VARCHAR(90),
fuel_availability VARCHAR(15),
conditions VARCHAR(30),
visibility VARCHAR(15),
flight_no varchar(30) not null,date date not null,
foreign key(flight_no,date)references flight_details
(flight_no,date)
);

-- Inserting data into flight_details for flights
INSERT INTO flight_details (flight_no, date, airline, flight_category, aircraft_type)
VALUES 
('DEP123', '2024-04-01', 'Delta Airlines', 'Domestic', 'Boeing 737'),
('DEP456', '2024-04-02', 'United Airlines', 'International', 'Airbus A380'),
('DEP789', '2024-04-03', 'American Airlines', 'Domestic', 'Boeing 787'),
('DEP012', '2024-04-04', 'British Airways', 'International', 'Boeing 777'),
('DEP345', '2024-04-05', 'Lufthansa', 'Domestic', 'Airbus A320'),
('ARR678', '2024-04-06', 'Air France', 'International', 'Airbus A350'),
('ARR901', '2024-04-07', 'Qatar Airways', 'Domestic', 'Boeing 777'),
('ARR234', '2024-04-08', 'Emirates', 'International', 'Airbus A380'),
('ARR567', '2024-04-09', 'Singapore Airlines', 'Domestic', 'Airbus A330'),
('ARR890', '2024-04-10', 'Cathay Pacific', 'International', 'Boeing 787');

-- Inserting data into flight_departing
INSERT INTO flight_departing (departure_time, delay_departure, new_departure_time, flight_no, date)
VALUES
('08:00:00', 0, '08:00:00', 'DEP123', '2024-04-01'),
('13:30:00', 1, '14:00:00', 'DEP456', '2024-04-02'),
('09:45:00', 0, '09:45:00', 'DEP789', '2024-04-03'),
('11:00:00', 0, '11:00:00', 'DEP012', '2024-04-04'),
('10:20:00', 0, '10:40:00', 'DEP345', '2024-04-05');


-- Inserting data into flight_arriving for arriving flights
INSERT INTO flight_arriving (arrival_time, arrival_departure, new_arrival_time, flight_no, date)
VALUES

('21:55:00', 0, '21:55:00', 'ARR678', '2024-04-06'),
('11:30:00', 1, '11:45:00', 'ARR901', '2024-04-07'),
('18:20:00', 0, '18:20:00', 'ARR234', '2024-04-08'),
('16:45:00', 1, '17:00:00', 'ARR567', '2024-04-09'),
('12:10:00', 0, '12:10:00', 'ARR890', '2024-04-10');

-- Crew information
INSERT INTO crew_information_departure (pilot_id, pilot_name, copilot_id, copilot_name, flight_no, date)
VALUES
(101, 'John Smith', 201, 'Emily Johnson', 'DEP123', '2024-04-01'),
(102, 'Michael Davis', 202, 'Jessica Brown', 'DEP456', '2024-04-02'),
(103, 'Christopher Wilson', 203, 'Sarah Taylor', 'DEP789', '2024-04-03'),
(104, 'David Martinez', 204, 'Jennifer Miller', 'DEP012', '2024-04-04'),
(105, 'Daniel Anderson', 205, 'Lisa Hernandez', 'DEP345', '2024-04-05');

INSERT INTO crew_information_arrival (pilot_id, pilot_name, copilot_id, copilot_name, flight_no, date)
VALUES
(201, 'Emily Johnson', 101, 'John Smith', 'ARR678', '2024-04-06'),
(202, 'Jessica Brown', 102, 'Michael Davis', 'ARR901', '2024-04-07'),
(203, 'Sarah Taylor', 103, 'Christopher Wilson', 'ARR234', '2024-04-08'),
(204, 'Jennifer Miller', 104, 'David Martinez', 'ARR567', '2024-04-09'),
(205, 'Lisa Hernandez', 105, 'Daniel Anderson', 'ARR890', '2024-04-10');

SELECT*FROM crew_information_arrival;

UPDATE crew_information_arrival
SET pilot_id=210, pilot_name='Aryan Gupte', copilot_id=113, copilot_name='Jasleen Singh'
WHERE filght_no='ARR234';

-- Inserting into cancellation
INSERT INTO cancellation (status, flight_no, date)
VALUES
(0,'DEP123', '2024-04-01'),
(1,'DEP456','2024-04-02'),
(0,'DEP789','2024-04-03'),
(0,'DEP012','2024-04-04'),
(0,'DEP345','2024-04-05'),
(0,'ARR678','2024-04-06'),
(1,'ARR901','2024-04-07'),
(0,'ARR234','2024-04-08'),
(1,'ARR567','2024-04-09'),
(0,'ARR890','2024-04-10');

-- Inserting into weatherinformationandfuelavailability
INSERT INTO weatherinformationandfuelavailability (wind_speed, cloud_cover, fuel_availability, 
conditions, visibility)
VALUES
('10 knots', 'Partly cloudy', 'Sufficient', 'Fair weather', '10 miles'),
('15 knots', 'Clear', 'Sufficient', 'Clear sky', '15 miles'),
('5 knots', 'Overcast', 'Limited', 'Foggy', '5 miles'),
('20 knots', 'Scattered clouds', 'Sufficient', 'Moderate weather', '8 miles'),
('25 knots', 'Clear', 'Insufficient', 'Stormy', '3 miles'),
('12 knots', 'Mostly cloudy', 'Sufficient', 'Variable weather', '12 miles'),
('8 knots', 'Partly cloudy', 'Sufficient', 'Mild weather', '10 miles'),
('18 knots', 'Clear', 'Sufficient', 'Sunny', '20 miles'),
('22 knots', 'Overcast', 'Limited', 'Windy', '7 miles'),
('7 knots', 'Scattered clouds', 'Sufficient', 'Calms', '10 miles');


-- Inserting into diversion
INSERT INTO diversion (diverted_airport, wind_speed, cloud_cover, fuel_availability, conditions, 
visibility, flight_no, date)
VALUES
('Airport B', '12 knots', 'Scattered clouds', 'Limited', 'Variable weather', '8 miles', 'ARR678', 
'2024-04-06'),
('Airport C', '25 knots', 'Clear', 'Insufficient', 'Stormy', '3 miles', 'ARR901', '2024-04-07'),
('Airport D', '10 knots', 'Partly cloudy', 'Sufficient', 'Fair weather', '10 miles', 'ARR234', '2024-04-08');
UPDATE diversion
SET diverted_airport='Dubai International Airport', fuel_availability='sufficient'
WHERE flight_no='ARR678';
SELECT*FROM diversion;

-- Number of flihts departing

SELECT COUNT(*) AS number_of_flights_departing
FROM flight_departing;

-- Number of flihts arriving

SELECT COUNT(*) AS number_of_flights_arriving
FROM flight_arriving;

-- number of flights that are cancelled

SELECT COUNT(*) AS number_of_cancelled_flights
FROM cancellation
WHERE status=1;

-- Crew information for departing flights

SELECT*FROM crew_information_departure;

-- Crew information for arriving flights

SELECT*FROM crew_information_arrival;

-- flight details for arriving flights

SELECT fd.flight_no, fd.airline, fd.flight_category, fd.aircraft_type
FROM flight_arriving fa
INNER JOIN flight_details fd ON fa.flight_no = fd.flight_no AND fa.date = fd.date;

-- flight details for departing flights

SELECT fd.flight_no, fd.airline, fd.flight_category, fd.aircraft_type
FROM flight_departing fd
INNER JOIN flight_details fd ON fd.flight_no = fd.flight_no AND fd.date = fd.date;

-- information of delayed departure

SELECT flight_no, departure_time, delay_departure, new_departure_time
FROM flight_departing
WHERE delay_departure = 1;

-- information of delayed arrival

SELECT flight_no, arrival_time, arrival_departure, new_arrival_time
FROM flight_arriving
WHERE arrival_departure = 1;

-- flights diverted

SELECT flight_no, diverted_airport
FROM diversion;

-- weather info and fuel availability of diverted flight

SELECT d.flight_no, w.wind_speed, w.cloud_cover, w.fuel_availability, w.conditions, w.visibility
FROM diversion d
INNER JOIN weatherinformationandfuelavailability w ON d.conditions = w.conditions;

-- ground info of arriving flights

-- Assuming there are tables for runway, parking, gate, and terminal with appropriate fields.
SELECT ra.runway_no, ra.runway_type, ps.parking_slot_no, g.gate_no, t.terminal_no
FROM flight_arriving fa
INNER JOIN runway ra ON fa.flight_no = ra.flight_no AND fa.date = ra.date
INNER JOIN parking_slot ps ON fa.flight_no = ps.flight_no AND fa.date = ps.date
INNER JOIN gate g ON fa.flight_no = g.flight_no AND fa.date = g.date
INNER JOIN terminal t ON fa.flight_no = t.flight_no AND fa.date = t.date;

-- ground info of departing flights

-- Assuming there are tables for runway, parking, gate, and terminal with appropriate fields.
SELECT rd.runway_no, rd.runway_type, ps.parking_slot_no, g.gate_no, t.terminal_no
FROM flight_departing fd
INNER JOIN runway rd ON fd.flight_no = rd.flight_no AND fd.date = rd.date
INNER JOIN parking_slot ps ON fd.flight_no = ps.flight_no AND fd.date = ps.date
INNER JOIN gate g ON fd.flight_no = g.flight_no AND fd.date = g.date
INNER JOIN terminal t ON fd.flight_no = t.flight_no AND fd.date = t.date;