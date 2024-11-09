/*DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE bookstore;
USE bookstore;*/

/*-- Create table: author
CREATE TABLE author (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
birth_date DATE
);*/

/*-- Create table: book
CREATE TABLE book(
isbn CHAR(13) PRIMARY KEY,
title VARCHAR(255),
language_id INT,
price DECIMAL(10,2),
publication_date DATE,
author_id INT,
FOREIGN KEY (author_id) REFERENCES author(id)
);*/

/*-- Create table: language
CREATE TABLE language(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) UNIQUE
);*/

/*-- Create table: bookstore
CREATE TABLE bookstore(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
city VARCHAR(50)
);*/

/*-- Create table: inventory
CREATE TABLE inventory(
store_id INT,
isbn CHAR(13),
amount INT,
PRIMARY KEY (store_id, isbn),
FOREIGN KEY (store_id) REFERENCES bookstore(id),
FOREIGN KEY (isbn) REFERENCES book(isbn)
);*/

/*-- Insert Data into Author Table
INSERT INTO author (first_name, last_name, birth_date) VALUES
('Gabrielle', 'Zevin', '1977-10-24'),
('J.K.', 'Rowling', '1965-07-31'),
('Johanne', 'Hildebrandt', '1964-04-15'),
('Kristin', 'Cast', '1986-11-04'),
('Camilla', 'Läckberg', '1974-08-30');*/

/*-- Insert two languages
INSERT INTO language (name) VALUES ('English'), ('Swedish');*/

/*-- Insert Data into Book Table
INSERT INTO book (isbn, title, language_id, price, publication_date, author_id) VALUES
('9781526675835', 'Elsewhere', 1, 159, '2024-02-01', 1),
('9781408855904', 'Harry Potter and the Chamber of Secrets', 1, 1289, '2014-09-01', 2),
('9789175036779', 'Idun', 1, 99, '2017-07-11', 3),
('9781250041746', 'Hidden', 1, 229, '2014-03-25', 4),
('9789179130336', 'En bur av guld', 2, 110, '2020-03-10', 5);*/

/*INSERT INTO bookstore (name, city) VALUES
('City Bookstore', 'Stockholm'),
('Town Books', 'Gothenburg');*/

/*-- Insert Data into Inventory Table
INSERT INTO inventory (store_id, isbn, amount) VALUES
(1, '9781526675835', 15),
(1, '9781408855904', 2),
(1, '9789175036779', 7),
(1, '9781250041746', 11),
(2, '9781526675835', 4),
(2, '9789179130336', 10);*/

/*-- Create View for Author Book Value
CREATE VIEW total_author_book_value AS
SELECT
CONCAT(a.first_name, ' ', a.last_name) AS name,
TIMESTAMPDIFF(YEAR, a.birth_date, CURDATE()) AS age,
COUNT(DISTINCT b.isbn) AS book_title_count,
SUM(b.price * i.amount) AS inventory_value
FROM author a
JOIN book b ON a.id = b.author_id
JOIN inventory i ON b.isbn = i.isbn
GROUP BY a.id;*/

/*-- Create user and accessibility
CREATE USER 'developer'@'localhost' IDENTIFIED BY 'dev_password';
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER, CREATE, DROP ON bookstore.* TO 'developer'@'localhost';

CREATE USER 'webserver'@'localhost' IDENTIFIED BY 'web_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.* TO 'webserver'@'localhost';*/

/*-- Limit the users from being able to create new users or databases
REVOKE CREATE USER ON *.* FROM 'developer'@'localhost';
REVOKE CREATE USER ON *.* FROM 'webserver'@'localhost';*/



