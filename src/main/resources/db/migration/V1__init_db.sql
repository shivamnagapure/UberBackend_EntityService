-- V1__init.sql

-- Driver
CREATE TABLE driver (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    name VARCHAR(255),
    license_number VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(255)
);

-- Passenger
CREATE TABLE passenger (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    name VARCHAR(255)
);

-- Booking
CREATE TABLE booking (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    booking_status ENUM(
        'SCHEDULED',
        'CANCELLED',
        'CAB_ARRIVED',
        'ASSIGNING_DRIVER',
        'IN_RIDE',
        'COMPLETED'
    ),
    start_time DATETIME(6),
    end_time DATETIME(6),
    total_distance BIGINT,
    driver_id BIGINT,
    passenger_id BIGINT,
    CONSTRAINT fk_booking_driver FOREIGN KEY (driver_id) REFERENCES driver(id),
    CONSTRAINT fk_booking_passenger FOREIGN KEY (passenger_id) REFERENCES passenger(id)
);

-- Review (Parent table, JOINED inheritance)
CREATE TABLE booking_review (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    booking_id BIGINT,
    content VARCHAR(255) NOT NULL,
    rating DOUBLE NOT NULL,
    CONSTRAINT fk_review_booking FOREIGN KEY (booking_id) REFERENCES booking(id)
);

-- PassengerReview (Child table, JOINED inheritance)
CREATE TABLE passenger_review (
    id BIGINT NOT NULL,
    passenger_review_content VARCHAR(255) NOT NULL,
    passenger_rating DOUBLE NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_passenger_review FOREIGN KEY (id) REFERENCES booking_review(id)
);
