CREATE TABLE backers_info (
	backer_id VARCHAR(10) NOT NULL,
	cf_id INT NOT NULL,
	first_name VARCHAR(250) NOT NULL,
	last_name VARCHAR(250) NOT NULL,
	emails varchar(320) NOT NULL)
	PRIMARY KEY (backer_id);

ALTER TABLE backers_info 
ADD CONSTRAINT constraint_name 
FOREIGN KEY (cf_id)
REFERENCES campaigns (cf_id);
	
select * from backers_info limit 10;

CREATE TABLE contacts (
	contact_id INT NOT NULL,
	first_name VARCHAR(250) NOT NULL,
	last_name VARCHAR(250) NOT NULL,
	emails varchar(320) NOT NULL)
	PRIMARY KEY (contact_id);
	
select * from contacts limit 10;
	
CREATE TABLE campaigns (
	cf_id INT NOT NULL,
	contact_id INT NOT NULL,
	company_name VARCHAR(300) NOT NULL,
	description VARCHAR(500) NOT NULL,
	goal float NOT NULL,
	pledged float NOT NULL,
	outcome  varchar(25) not null,
	backers_count int not null,
	country varchar(5) not null,
	currency varchar(5) not null,
	launched_date DATE not null,
	end_date DATE not null,
	category_id varchar(10),
	subcategory_id varchar(10))
	PRIMARY KEY (cf_id)
	FOREIGN KEY (contact_id) REFERENCES employees (contact);

select * from campaigns limit 10;

/* ERD code
contacts
-
contact_id int pk FK >- campaigns.contact_id
first_name varchar(256)
last_name varcgar(256)
email varchar(320)

campaigns
-
cf_id int pk FK >- backers.cf_id
contact_id int fk
company_name varchar(300)
description  varchar(500)
goal float
pledged float
outcome  varchar(25)
backers_count int
country  varchar(5)
currency  varchar(5)
launched_date date
end_date date
category_id  varchar(10)
subcategory_id  varchar(10)

backers
-
backer_id  varchar(10) pk
cf_id int FK
first_name  varchar(256)
last_name  varchar(256)
email  varchar(320)

*/
