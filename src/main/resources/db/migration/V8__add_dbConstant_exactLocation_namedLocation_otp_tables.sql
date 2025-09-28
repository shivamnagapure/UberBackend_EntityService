CREATE TABLE db_constant (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    name VARCHAR(225) UNIQUE NOT NULL ,
    value VARCHAR(255) NULL
);

CREATE TABLE exact_location (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    latitude DOUBLE,
    longitude DOUBLE
);

CREATE TABLE named_location (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME(6) NOT NULL,
    updated_at DATETIME(6) NOT NULL,
    exact_location_id BIGINT NOT NULL ,
    name VARCHAR(255),
    zip_code VARCHAR(20),
    city VARCHAR(255),
    country VARCHAR(255),
    state VARCHAR(255),
    CONSTRAINT fk_named_location_exact_location FOREIGN KEY (exact_location_id) REFERENCES exact_location(id) ON DELETE CASCADE
);

CREATE TABLE otp (
                     id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                     code VARCHAR(10) NOT NULL,
                     sent_to_number VARCHAR(20) NOT NULL,
                     created_at DATETIME(6) NOT NULL,
                     updated_at DATETIME(6) NOT NULL
);