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
	tax_id CHAR(11) NOT NULL unique,
	experience INT NOT NULL,
	hired DATE NOT NULL,
	salary DECIMAL(10, 2) NOT NULL,
	foreign KEY (username) REFERENCES User(username),
	primary key(username, tax_id)
);


CREATE TABLE IF NOT EXISTS Worker (
	username VARCHAR(40) PRIMARY KEY,
	FOREIGN KEY (username) REFERENCES User(username)
);

CREATE TABLE IF NOT EXISTS Driver(
	username VARCHAR(40) PRIMARY KEY,
	licenseID CHAR(6) NOT NULL UNIQUE,
	successful_trips INT NOT NULL,
	license_type VARCHAR(5) NOT NULL,
	FOREIGN KEY (username) REFERENCES User(username)
);

CREATE TABLE IF NOT EXISTS Service(
	id varchar(40),
	name varchar(40),
	location varchar(40),
	primary key(ID)
);


CREATE TABLE IF NOT EXISTS Location(
	label varchar(40),
	x_coord INT,
	y_coord INT,
	space INT,
	primary key(label)
);

CREATE TABLE IF NOT EXISTS Product(
	barcode varchar(40),
	iname varchar(40),
    location_label varchar(40),
	weight int,
	primary key(barcode),
    foreign key (location_label) references Location(label)
);

CREATE TABLE IF NOT EXISTS Van(
	tag varchar(40),
	service_id varchar(40),
	capacity int,
	sales int,
	fuel int,
	foreign key (service_id) references Service(id),
	primary key(tag, service_id)
);
#
CREATE TABLE IF NOT EXISTS Product_contain_van(
	barcode varchar(40),
	tag varchar(40),
	service_id varchar(40),
	price int,
	quantity int,
	foreign key (barcode) references Product(barcode),
	foreign key (tag, service_id) references Van(tag, service_id),
	primary key(barcode, tag, service_id)
);

#ALTER TABLE Product ADD CONSTRAINT foreign key (label) Location(label);

CREATE TABLE IF NOT EXISTS Owner (
	username varchar(40),
	primary key(username),
	foreign key (username) references User(username)
);


CREATE TABLE IF NOT EXISTS Business(
	name varchar(40) NOT NULL UNIQUE,
	rating int,
	location_label varchar(40),
	unique(name),
	check(rating <= 5),
	primary key(name),
	foreign key (location_label) references Location(label)
);

CREATE TABLE IF NOT EXISTS Fund (
	owner_username varchar(40),
    business_name varchar(40),
    invested float,
    date date,
    primary key(owner_username, business_name),
    foreign key (owner_username) references Owner(username),
    Foreign key (business_name) references Business(name)
);

#

CREATE TABLE IF NOT EXISTS Worker_workfor_service(
	serviceID varchar(40),
    tax_id varchar(40),
    primary key(serviceID, tax_id),
    foreign key (serviceID) references Service(ID),
    foreign key (tax_id) references Employee(tax_id)
);

