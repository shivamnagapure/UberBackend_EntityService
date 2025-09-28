ALTER TABLE booking
    ADD start_location_id BIGINT;

ALTER TABLE booking
    ADD end_location_id BIGINT;

ALTER TABLE booking
    ADD CONSTRAINT fk_booking_start_location
        FOREIGN KEY (start_location_id) REFERENCES exact_location(id);

ALTER TABLE booking
    ADD CONSTRAINT fk_booking_end_location
        FOREIGN KEY (end_location_id) REFERENCES exact_location(id);


ALTER TABLE passenger
    ADD active_booking_id BIGINT,
    ADD rating DOUBLE,
    ADD last_known_location_id BIGINT,
    ADD home_location_id BIGINT;

ALTER TABLE passenger
    ADD CONSTRAINT fk_passenger_active_booking
        FOREIGN KEY (active_booking_id) REFERENCES booking(id);

ALTER TABLE passenger
    ADD CONSTRAINT fk_passenger_last_known_location
        FOREIGN KEY (last_known_location_id) REFERENCES exact_location(id);

ALTER TABLE passenger
    ADD CONSTRAINT fk_passenger_home_location
        FOREIGN KEY (home_location_id) REFERENCES exact_location(id);



ALTER TABLE driver
    ADD driver_approval_status VARCHAR(255),
    ADD last_known_location_id BIGINT,
    ADD home_location_id BIGINT,
    ADD active_city VARCHAR(255),
    ADD is_available VARCHAR(255),
    ADD rating DOUBLE;

ALTER TABLE driver
    ADD CONSTRAINT fk_driver_last_known_location
        FOREIGN KEY (last_known_location_id) REFERENCES exact_location(id);

ALTER TABLE driver
    ADD CONSTRAINT fk_driver_home_location
        FOREIGN KEY (home_location_id) REFERENCES exact_location(id);

