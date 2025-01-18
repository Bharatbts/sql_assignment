CREATE DATABASE MARKETCO;

USE MARKETCO;

CREATE TABLE company
(
company_id int primary key,
company_name varchar(45),
street varchar(45),
city varchar(45),
state varchar(10),
zip varchar(10)
);

INSERT INTO company VALUES (101,'Tech Solutions','123 Innovation Dr','Springfield','IL','62701');

-- In the Company table, the statement that changes the name of “Urban 
-- Outfitters, Inc.” to “Urban Outfitters” .

UPDATE company set company_name = 'Urban Outfitters' WHERE company_name = 'Urban Outfitters, Inc.';

-- Statement to create the Contact table --

CREATE TABLE contact
(
contact_id int primary key,
company_id int,
first_name varchar(45),
last_name varchar(45),
street varchar(45),
city varchar(10),
state varchar(10),
zip varchar(10),
is_main boolean,
email varchar(45),
phone varchar(12),
foreign key (company_id) references company(company_id)
);

INSERT INTO contact VALUES (1,101,'John','Doe','123 Main St','Springfield','IL','62701',TRUE,'john.doe@example.com','555-1234');
INSERT INTO contact VALUES (2,102,'Lesley','Bland','456 Elm St','Springfield','IL','62702',FALSE,'lesley.bland@example.com','555-5678');
INSERT INTO contact VALUES (3,103,'Dianne','Connor','789 Oak St','Springfield','IL','62703',True,'dianne.connor@example.com','555-9012');
INSERT INTO contact VALUES (4,104,'Bob','Brown','101 Pine St','Springfield','IL','62704',FALSE,'bob.brown@example.com','555-3456');
INSERT INTO contact VALUES (5,105,'Carol','Davis','202 Maple St','Springfield','IL','62705',TRUE,'carol.davis@example.com','555-7890');

-- Statement to create the Employee table --

CREATE TABLE employee
(
employee_id int primary key,
first_name varchar(45),
last_name varchar(45),
salary decimal(10,2),
hire_date date,
job_title varchar(25),
email varchar(45),
phone varchar(12)
);

INSERT INTO employee VALUES (201,'Douglas','Grant',50000,'2022-01-15','Software Engineer','douglas.grant@example.com','650-507-9833');

-- In the Employee table, the statement that changes Lesley Bland’s phone number 
-- to 215-555-8800 

UPDATE employee set phone = '215-555-8800' WHERE first_name = 'Leslay' AND last_name = 'Bland';

-- Statement to create the ContactEmployee table 
-- HINT: Use DATE as the datatype for ContactDate. It allows you to store the 
-- date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014). 

CREATE TABLE contactemployee
(
contactemployee_id int primary key,
contact_id int,
employee_id int,
contact_date date,
description varchar(100),
foreign key (contact_id) references contact(contact_id),
foreign key (employee_id) references employee(employee_id)
);

INSERT INTO contactemployee VALUES (1,1,201,'2023-01-15','Initial meeting to discuss project requirements');

-- In ContactEmployee table, the statement that removes Dianne Connor’s contact 
-- event with Jack Lee (one statement).
-- HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove.

DELETE FROM contactemployee
WHERE contactemployee_id = (
    SELECT contactemployee_id
    FROM contactemployee
    JOIN contact ON contactemployee.contact_id = contact.contact_id
    JOIN employee ON contactemployee.employee_id = employee.employee_id
    WHERE contact.first_name = 'Dianne' AND contact.last_name = 'Connor'
    AND employee.first_name = 'Jack' AND employee.last_name = 'Lee'
);

-- Write the SQL SELECT query that displays the names of the employees that 
-- have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
-- MySQL Workbench. Copy the results below as well.

SELECT e.first_name, e.last_name
FROM employee e
JOIN contactemployee ce ON e.employee_id = ce.employee_id
JOIN contact c ON ce.contact_id = c.contact_id
JOIN company co ON c.company_id = co.company_id
WHERE co.company_name = 'Toll Brothers';