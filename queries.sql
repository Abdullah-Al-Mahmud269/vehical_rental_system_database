CREATE TYPE vehical_status AS ENUM ('available', 'rented', 'maintenance');
CREATE TYPE booking_status AS ENUM('pending','confirmed','completed');
CREATE TYPE vehical_type AS ENUM('car','bike','truck');

CREATE TABLE "Users" (
  "user_id" BIGINT,
  "role" VARCHAR(50),
  "name" VARCHAR(50),
  "email" VARCHAR(50) UNIQUE,
  "password" VARCHAR(50),
  "phone_number" VARCHAR(50),
  PRIMARY KEY ("user_id")
);

CREATE TABLE "Vehicals" (
  "vehical_id" BIGINT,
  "type" vahical_type,
  "model" VARCHAR(50),
  "registration_number" VARCHAR(100) UNIQUE,
  "rental_price" BIGINT,
  "status" vehicle_status,
  PRIMARY KEY ("vehicle_id")
);

CREATE TABLE "Bookings" (
  "booking_id" BIGINT,
  "user_id" BIGINT REFERENCES "Users" (user_id),
  "vehical_id" BIGINT REFERENCES "Users" (vehical_id),
  "start_date" DATE,
  "end_date" DATE,
  "status" booking_status,
  "total_cost" BIGINT,
CONSTRAINT "FK_Booking_user_id" FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id")
CONSTRAINT "FK_Booking_vehical_id" FOREIGN KEY ("vehical_id") REFERENCES "Vehicals" ("vehicals_id")
  )

--User Data 
SELECT 
user_id,name,email,phone_number,role
FROM "Users"

--vehicals DATA
SELECT * TABLE "Vehicals";

--Booking Data
SELECT * TABLE "Bookings";


--1. Retrieve booking information along with customer name and vehical name
SELECT 
b.booking_id,
u.name AS customer_name,
v.name AS vehicle_name,
b.start_date,
b.end_date,
b.status
FROM "Booking" AS b 
INNER JOIN "Users" AS u USING (user_id)
inner JOIN "vehicals" AS v USING (vehical_id);

--2. Find all vehicales that have never been booked.
SELECT * FROM "Vehicals" AS v
WHERE NOT EXISTS (
  SELECT 1 FROM "Vehicals" AS v2
  WHERE 
  v.vehical_id = v2.vehical_id
  AND v.status = 'rented'
);

--3. Retrieve all available vehicals of a specific type
CREATE OR REPLACE FUNCTION search_vehiale_type(type_search vehical_type)
RETURNS SETOF "Vehicals" AS $$
  BEGIN
  RETURN QUERY
  SELECT * FORM "Vehicals" AS v WHERE v.type = type_search;
  END;
  $$ LANGUAGE PLPGSQL;

SELECT * FROM search_vehical_type ('bike');

--4. Find the total number of booking for each vehical and display only those vehicales that have more than 2 booking.
SELECT 
v.name AS vehical_name,
COUNT(*) AS total_booking
FROM "Booking" AS b
INNER JOIN "Vehicals" AS v USING (vehical_id)
GROUP by v.vehicals
HAVING 
COUNT(*) > 2;















