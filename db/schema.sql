
CREATE DATABASE ats_db;
USE ats_db;


-- TABLE 1 - APPLICANTS TABLE
CREATE TABLE applicants
(
	id int NOT NULL AUTO_INCREMENT,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	home_phone int(10) NOT NULL,
	cell_phone int(10) NOT NULL,
	email varchar(255) NOT NULL,
	contract varchar(255) NOT NULL,
	position varchar(255) NOT NULL,
	license varchar(255),
	SORA_license varchar(255),
	PRIMARY KEY (id)
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
	applied varchar(255) NOT NULL,
	fingerprint_appointment varchar(255),
	fingerprint_background_approval varchar(255),
	orange_tag boolean,
	sida_class boolean,
	orientation_training varchar(255),
	safety_training varchar(255),
	customer_training varchar(255),
	recieve_id varchar(255),
	id_front varchar(255),
	id_back varchar(255),
	id_exp varchar(255),
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
	level varchar(255) NOT NULL
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