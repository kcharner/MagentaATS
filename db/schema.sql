
CREATE DATABASE magenta_db;
USE magenta_db;

-- DATE MUST BE IN THIS FORMAT: YYYY-MM-DD

-- TABLE 1 - APPLICANTS TABLE
CREATE TABLE applicants
(
	id int NOT NULL AUTO_INCREMENT,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	home_phone int(10) NOT NULL,
	cell_phone int(10) NOT NULL,
	email varchar(255) NOT NULL,
	contract_id int NOT NULL,
	position_id int NOT NULL,
	driver_license varchar(20),
	driver_exp DATE,
	sora_license varchar(50),
	sora_exp DATE,
	PRIMARY KEY (id),
	FOREIGN KEY (contract_id) references contracts(id),
	FOREIGN KEY (position_id) references positions(id)
);

-- TABLE 2 - CONTRACTS TABLE
CREATE TABLE contracts
(
	id int NOT NULL AUTO_INCREMENT,
	contract_name varchar(255) NOT NULL,
	business_unit varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

-- TABLE 3 - POSITIONS TABLE
CREATE TABLE positions
(
	id int NOT NULL AUTO_INCREMENT,
	position varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

-- TABLE 4 - APPLICANTS > CONTRACTS > POSITIONS TABLE
CREATE TABLE combined
(
	applicant_id int NOT NULL, 
	contract_id int NOT NULL, 
	position_id int NOT NULL, 
	FOREIGN KEY (applicant_id) references applicants(id),
	FOREIGN KEY (contract_id) references contracts(id),
	FOREIGN KEY (position_id) references positions(id)
);

-- TABLE 5 - APPLICATION PROCESS
CREATE TABLE application_process
(
	id int NOT NULL AUTO_INCREMENT,
	applicant_id int NOT NULL, 
	applied DATE NOT NULL,
	fp_appt DATE,
	fp_background_approval DATE,
	orange_tag boolean,
	sida_class DATE,
	side_result boolean,
	orientation_training DATE,
	safety_training DATE,
	customer_training DATE,
	receive_id boolean,
	id_front int(10),
	id_back int(10),
	id_exp DATE,
	PRIMARY KEY (id),
	FOREIGN KEY (applicant_id) references applicants(id)
);

-- TABLE 6 - HR/MANAGEMENT USERS
CREATE TABLE users
(
	id int NOT NULL AUTO_INCREMENT,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	level varchar(255) NOT NULL,
	PRIMARY KEY (id)
);


-- table 1 - applicants
-- table 2 - contracts (name, business unit)
-- table 3 - positions (name)
-- table 4 - the joined table (applicants - contracts - position)


-- table 5 - application-process
-- 	applicant id (would be foregin id)
-- 	applied - not null
-- 	fingerprint appointment - date completed
-- 	fingerprint/background check approval - date completed
-- 	orange tag - boolean - temporary access tag
-- 	SIDA class appointment - training class - date completed
-- 	result if they pass SIDA class or not (boolean)
-- 	new hire orientation training - date completed
-- 	safety training - date completed
-- 	customer service training - date completed
-- 	job specific training - date completed
-- 	recieve the ID (to actually work) - date completed
-- 		front number
-- 		back number
-- 		exp. date

-- table 6 - users
-- 	front name
-- 	last name
-- 	email (will be used as username)
-- 	password
-- 	level (supervisor, HR, mangement)