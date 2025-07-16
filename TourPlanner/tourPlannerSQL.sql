CREATE DATABASE tourPlanner;
USE tourPlanner;

CREATE TABLE `users` (
  `user_id` integer PRIMARY KEY AUTO_INCREMENT,
  `email` varchar(255) UNIQUE NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'traveler' COMMENT 'traveler|admin|vendor',
  `created_at` timestamp DEFAULT (now()),
  `last_login` timestamp
);

CREATE TABLE `profiles` (
  `profile_id` integer PRIMARY KEY AUTO_INCREMENT,
  `user_id` integer UNIQUE,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `passport_number` varchar(50),
  `address` jsonb,
  `phone` varchar(20)
);

CREATE TABLE `preferences` (
  `preference_id` integer PRIMARY KEY AUTO_INCREMENT,
  `user_id` integer,
  `category` varchar(50) NOT NULL,
  `value` jsonb NOT NULL
);

CREATE TABLE `trips` (
  `trip_id` integer PRIMARY KEY AUTO_INCREMENT,
  `user_id` integer,
  `title` varchar(100) NOT NULL,
  `destination` jsonb NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(20) DEFAULT 'draft' COMMENT 'draft|planned|completed',
  `notes` text
);

CREATE TABLE `vendors` (
  `vendor_id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact_email` varchar(255),
  `service_type` varchar(20) COMMENT 'hotel|car_rental|tour'
);

CREATE TABLE `hotels` (
  `hotel_id` integer PRIMARY KEY AUTO_INCREMENT,
  `vendor_id` integer,
  `name` varchar(100) NOT NULL,
  `location` geography(point) NOT NULL,
  `amenities` text[] NOT NULL,
  `price_per_night` numeric(10,2) NOT NULL
);

CREATE TABLE `flights` (
  `flight_id` integer PRIMARY KEY AUTO_INCREMENT,
  `airline` varchar(50) NOT NULL,
  `departure_airport` char(3) NOT NULL,
  `arrival_airport` char(3) NOT NULL,
  `departure_time` timestamptz NOT NULL,
  `seat_classes` jsonb NOT NULL
);

CREATE TABLE `cars` (
  `car_id` integer PRIMARY KEY AUTO_INCREMENT,
  `model` varchar(50) NOT NULL,
  `rental_company` varchar(50) NOT NULL,
  `price_per_day` numeric(10,2) NOT NULL,
  `features` varchar(100) NOT NULL COMMENT 'List of features'
);

CREATE TABLE `bookings` (
  `booking_id` uuid PRIMARY KEY DEFAULT (gen_random_uuid()),
  `trip_id` integer,
  `user_id` integer NOT NULL,
  `service_type` varchar(10) NOT NULL COMMENT 'hotel|flight|car',
  `service_id` integer NOT NULL COMMENT 'ID from hotels/flights/cars',
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `booked_at` timestamp DEFAULT (now())
);

CREATE TABLE `itinerary_events` (
  `event_id` integer PRIMARY KEY AUTO_INCREMENT,
  `trip_id` integer,
  `day_number` smallint NOT NULL,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text,
  `location` varchar(100),
  `booking_id` uuid
);

CREATE TABLE `payments` (
  `payment_id` uuid PRIMARY KEY DEFAULT (gen_random_uuid()),
  `booking_id` uuid UNIQUE NOT NULL,
  `amount` numeric(10,2) NOT NULL,
  `currency` char(3) NOT NULL,
  `method` varchar(20) NOT NULL COMMENT 'card|upi|wallet',
  `status` varchar(20) NOT NULL COMMENT 'pending|completed|refunded',
  `gateway_response` jsonb
);

CREATE TABLE `invoices` (
  `invoice_id` integer PRIMARY KEY AUTO_INCREMENT,
  `payment_id` uuid NOT NULL,
  `invoice_number` varchar(50) UNIQUE NOT NULL,
  `issued_at` timestamp DEFAULT (now()),
  `s3_path` varchar(255) NOT NULL
);

CREATE TABLE `reviews` (
  `review_id` integer PRIMARY KEY AUTO_INCREMENT,
  `booking_id` uuid NOT NULL,
  `rating` smallint NOT NULL,
  `comment` text,
  `created_at` timestamp DEFAULT (now()),
  `verified` boolean DEFAULT false
);

ALTER TABLE `profiles` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `preferences` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `trips` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `hotels` ADD FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `itinerary_events` ADD FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`);

ALTER TABLE `itinerary_events` ADD FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

ALTER TABLE `payments` ADD FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

ALTER TABLE `invoices` ADD FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`service_id`) REFERENCES `hotels` (`hotel_id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`service_id`) REFERENCES `flights` (`flight_id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`service_id`) REFERENCES `cars` (`car_id`);
