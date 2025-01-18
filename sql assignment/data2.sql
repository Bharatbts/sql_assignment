-- What is the significance of “%” and “_” operators in the LIKE statement?  

-- There are two wildcards often used in conjunction with the LIKE operator:

-- The percent sign % represents zero, one, or multiple characters
-- The % wildcard represents any number of characters, even zero characters.

-- The underscore sign _ represents one, single character
-- It can be any character or number, but each _ represents one, and only one, character.

################################################################################################

-- Explain normalization in the context of databases.

-- Normalization is a process in database design that organizes data to reduce redundancy 
-- and improve data integrity. The main goals of normalization are to eliminate duplicate 
-- data, ensure data dependencies make sense, and simplify the structure of the database.

################################################################################################

-- What does a join in MySQL mean?

-- In MySQL, a join is used to combine rows from two or more tables based on a related 
-- column between them. Joins are essential for querying data that is spread across 
-- multiple tables.

#################################################################################################

-- What do you understand about DDL, DCL, and DML in MySQL?

-- In MySQL, there are three main types of SQL commands that are used to interact with 
-- the database:

-- DDL (Data Definition Language): These commands are used to define and manage the 
-- structure of the database and its objects.

-- DCL (Data Control Language): These commands are used to control access to data in 
-- the database.

-- DML (Data Manipulation Language): These commands are used to manipulate the data 
-- within the database.

#################################################################################################

-- What is the role of the MySQL JOIN clause in a query, and what are some 
-- common types of joins?

-- The MySQL JOIN clause is used to combine rows from two or more tables based on a 
-- related column between them. This is essential for querying data that is spread 
-- across multiple tables. Here are the common types of joins:

-- INNER JOIN: Returns records that have matching values in both tables.

-- LEFT JOIN (or LEFT OUTER JOIN): Returns all records from the left table and the 
-- matched records from the right table. If no match is found, NULL values are 
-- returned for columns from the right table.

-- RIGHT JOIN (or RIGHT OUTER JOIN): Returns all records from the right table and the 
-- matched records from the left table. If no match is found, NULL values are returned 
-- for columns from the left table.

-- CROSS JOIN: Returns the Cartesian product of the two tables, meaning it returns all 
-- possible combinations of rows from the tables.