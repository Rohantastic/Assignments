create database car;
use car;
CREATE TABLE customer(
	`customer_id` INT UNSIGNED NOT NULL,
    `customer_name` varchar(20)  NOT NULL,
    `customer_detailes` varchar(20),
    `gender` varchar(10),
    `email` varchar(20),
    `phoneno` int8 unsigned NOT NULL,
    `address_1` varchar(20),
    `address_2` varchar(20),
    `address_3` varchar(20),
    `town` varchar(20),
    `country` varchar(10),
    CONSTRAINT pk_customer_customerId PRIMARY KEY (customer_id)
);

CREATE TABLE booking(
	`booking_id` int unsigned NOT NULL,
    `date_from` date,
    `date_to` date,
    `confirmation_letter_sent` varchar(20),
    `payment_recevied` varchar(10),
    CONSTRAINT pk_customer_bookingId PRIMARY KEY (booking_id)
);

CREATE TABLE booking_status(
	`booking_status_code` int unsigned not null,
    `booking_status_desc` varchar(20),
    CONSTRAINT pk_customer_booking_status PRIMARY KEY (booking_status_code)
);

CREATE TABLE vehicle(
`regno` int unsigned not null,
`current_mileage` float,
`daily_hire_rate` float,
`daily_mot_due` float,
`engine_size` float,
CONSTRAINT pk_vehicle_regno PRIMARY KEY (regno)
);

CREATE TABLE model(
`model_code` int unsigned not null,
`daily_hire_rate` float,
`model_name` varchar(20),
CONSTRAINT pk_model_code PRIMARY KEY (model_code)
);

CREATE TABLE vehicle_category(
`vehicle_cat_code` int unsigned not null,
`vehicle_cat_desc` varchar(30),
CONSTRAINT pk_vehiclecategory_code PRIMARY KEY (vehicle_cat_code)
);

CREATE TABLE manufacturer(
`manufacturer_code` int unsigned not null,
`manufacturer_name` varchar(20),
`manufacturer_details` varchar(20),
CONSTRAINT pk_manufacturer_mancode PRIMARY KEY (manufacturer_code)
);


ALTER  TABLE model
ADD CONSTRAINT 	fk_model_manufacturer FOREIGN KEY (model_code) REFERENCES manufacturer(manufacturer_code);

ALTER  TABLE vehicle
ADD CONSTRAINT fk_vehicle_model FOREIGN KEY (regno) REFERENCES model(model_code),
ADD CONSTRAINT fk_vehicle_vehiclecategory FOREIGN KEY (regno) REFERENCES vehicle_category(vehicle_cat_code);

ALTER  TABLE booking
ADD CONSTRAINT fk_booking_customer FOREIGN KEY(booking_id) REFERENCES customer(customer_id),
ADD CONSTRAINT  fk_booking_vehicle FOREIGN KEY (booking_id) REFERENCES vehicle(regno),
ADD CONSTRAINT  fk_booking_bookingstatus FOREIGN KEY (booking_id) REFERENCES booking_status(booking_status_code) ;



