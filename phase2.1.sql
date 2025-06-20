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
	tax_id CHAR(11) UNIQUE,
	experience INT,
	hired DATE,
	salary DECIMAL(10, 2),
	PRIMARY KEY (username, tax_id),
	FOREIGN KEY (username) REFERENCES User(username)
);


CREATE TABLE IF NOT EXISTS Worker (
	username VARCHAR(40),
	tax_id CHAR(11),
	PRIMARY KEY (username, tax_id),
	FOREIGN KEY (username, tax_id) REFERENCES Employee(username, tax_id)
);

CREATE TABLE IF NOT EXISTS Driver(
	username VARCHAR(40),
	tax_id CHAR(11),
	licenseID CHAR(6) UNIQUE,
	successful_trips INT,
	license_type VARCHAR(5),
	PRIMARY KEY (username, tax_id),
	FOREIGN KEY (username, tax_id) REFERENCES Employee(username, tax_id)
);

CREATE TABLE IF NOT EXISTS Location(
	label VARCHAR(40) PRIMARY KEY,
	location_x_coord INT NOT NULL,
	location_y_coord INT NOT NULL,
	space INT NOT NULL,
);

CREATE TABLE IF NOT EXISTS Service(
	id VARCHAR(40) PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	location varchar(40) NOT NULL,
	FOREIGN KEY (location) REFERENCES Location(label)
);

-- Service needs a field called home base but not in data ^

CREATE TABLE IF NOT EXISTS Product(
	barcode VARCHAR(40) PRIMARY KEY,
	iname VARCHAR(40),
	weight INT,
);

CREATE TABLE IF NOT EXISTS Van(
	tag VARCHAR(40) NOT NULL,
	service_id VARCHAR(40) NOT NULL,
	capacity INT NOT NULL,
	sales DECIMAL (10, 2) DEFAULT 0,
	fuel INT NOT NULL,
	location VARCHAR(40) NOT NULL,
	PRIMARY KEY (tag, service_id),
	FOREIGN KEY (service_id) REFERENCES Service(id)
	FOREIGN KEY (location) REFERENCES Location(label)
);
#
CREATE TABLE IF NOT EXISTS Product_contain_van(
	barcode VARCHAR(40),
	tag VARCHAR(40) NOT NULL,
	service_id VARCHAR(40) NOT NULL,
	price INT NOT NULL,
	quantity INT NOT NULL,
	PRIMARY KEY(barcode, tag, service_id)
	FOREIGN KEY (barcode) REFERENCES Product(barcode),
	FOREIGN KEY (tag, service_id) REFERENCES Van(tag, service_id)
);

-- #ALTER TABLE Product ADD CONSTRAINT foreign key (label) Location(label);

CREATE TABLE IF NOT EXISTS Owner (
	username VARCHAR(40) PRIMARY KEY,
	FOREIGN KEY (username) REFERENCES User(username)	
);


CREATE TABLE IF NOT EXISTS Business(
	name VARCHAR(40) PRIMARY KEY,
	rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
	spent INT DEFAULT 0
	location VARCHAR(40) NOT NULL,
	FOREIGN KEY (location) REFERENCES Location(label)
);

CREATE TABLE IF NOT EXISTS Fund (
	owner_username VARCHAR(40) NOT NULL,
    business_name VARCHAR(40) NOT NULL,
    amount_invested INT,
    dt_invested DATE,
    PRIMARY KEY(owner_username, business_name),
    FOREIGN KEY (owner_username) REFERENCES Owner(username),
    FOREIGN KEY (business_name) REFERENCES Business(name)
);

#

CREATE TABLE IF NOT EXISTS Worker_workfor_service(
	username VARCHAR(40),
	serviceID VARCHAR(40),
    tax_id CHAR(11),
    PRIMARY KEY(username, serviceID, tax_id),
	FOREIGN KEY(username) REFERENCES Worker(username),
    FOREIGN KEY(serviceID) REFERENCES Service(id),
    FOREIGN KEY(tax_id) REFERENCES Employee(tax_id)
);

