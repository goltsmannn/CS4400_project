DROP DATABASE IF EXISTS CS4400_PHASE2;
CREATE DATABASE IF NOT EXISTS CS4400_PHASE2;

use CS4400_PHASE2;

CREATE TABLE IF NOT EXISTS User (
	username VARCHAR(40) PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	address VARCHAR(500) NOT NULL,
	birthdate DATE NOT NULL
);

CREATE TABLE  IF NOT EXISTS Employee (
	username varchar(40),
	tax_id CHAR(11) NOT NULL UNIQUE,
	experience INT NOT NULL,
	hired DATE NOT NULL,
	salary DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (username) REFERENCES User(username),
	PRIMARY KEY (username, tax_id)
);


CREATE TABLE IF NOT EXISTS Worker (
	username VARCHAR(40) PRIMARY KEY,
	FOREIGN KEY (username) REFERENCES User(username)
);

CREATE TABLE IF NOT EXISTS Driver(
	username VARCHAR(40),
	licenseID CHAR(6),
	successful_trips INT,
	license_type VARCHAR(5),
	FOREIGN KEY (username) REFERENCES User(username),
	PRIMARY KEY (username, licenseID)
);

CREATE TABLE IF NOT EXISTS Location(
	label varchar(40) PRIMARY KEY,
	x_coord INT NOT NULL,
	y_coord INT NOT NULL,
	space INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Service(
	id varchar(40) PRIMARY KEY,
	name varchar(40) NOT NULL,
	location_label varchar(40) NOT NULL,
	FOREIGN KEY (location_label) REFERENCES Location(label)
);

CREATE TABLE IF NOT EXISTS Product(
	barcode varchar(40) PRIMARY KEY,
	iname varchar(40),
    	location_label varchar(40),
	weight int,
    	FOREIGN KEY (location_label) REFERENCES Location(label)
);

CREATE TABLE IF NOT EXISTS Van(
	tag varchar(40) NOT NULL,
	service_id varchar(40) NOT NULL,
	capacity int,
	sales int,
	fuel int,
	FOREIGN KEY (service_id) REFERENCES Service(id),
	PRIMARY KEY (tag, service_id)
);
#
CREATE TABLE IF NOT EXISTS Product_contain_van(
	barcode varchar(40),
	tag varchar(40),
	service_id varchar(40),
	price int,
	quantity int,
	FOREIGN KEY (barcode) REFERENCES Product(barcode),
	FOREIGN KEY (tag, service_id) REFERENCES Van(tag, service_id),
	PRIMARY KEY (barcode, tag, service_id)
);

#ALTER TABLE Product ADD CONSTRAINT foreign key (label) Location(label);

CREATE TABLE IF NOT EXISTS Owner (
	username varchar(40) PRIMARY KEY,
	FOREIGN KEY (username) REFERENCES User(username)
);


CREATE TABLE IF NOT EXISTS Business(
	name varchar(40) PRIMARY KEY,
	rating int,
	location_label varchar(40) NOT NULL,
	CHECK (rating <= 5),
	FOREIGN KEY (location_label) REFERENCES Location(label)
);

CREATE TABLE IF NOT EXISTS Fund (
	owner_username varchar(40),
    	business_name varchar(40),
    	invested float,
    	date date,
    	PRIMARY KEY (owner_username, business_name),
    	FOREIGN KEY (owner_username) REFERENCES Owner(username),
    	FOREIGN KEY (business_name) REFERENCES Business(name)
);

#

CREATE TABLE IF NOT EXISTS Worker_workfor_service(
	serviceID varchar(40),
    	tax_id varchar(40),
    	PRIMARY KEY (serviceID, tax_id),
    	FOREIGN KEY (serviceID) REFERENCES Service(ID),
    	FOREIGN KEY (tax_id) REFERENCES Employee(tax_id)
);

