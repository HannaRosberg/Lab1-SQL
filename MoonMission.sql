/*-- Uppgift 1
CREATE TABLE successful_mission AS
SELECT * FROM moon_mission
WHERE outcome = 'Successful';*/

/*-- Uppgift 2
ALTER TABLE successful_mission
MODIFY COLUMN mission_id INT PRIMARY KEY AUTO_INCREMENT;*/

/*-- Uppgift 3
UPDATE successful_mission
SET operator = REPLACE(operator, ' ', '')
WHERE INSTR(operator, ' ');
UPDATE moon_mission
SET operator = REPLACE(operator, ' ', '')
WHERE INSTR(operator, ' ');*/

/*-- Uppgift 4
DELETE FROM successful_mission
WHERE launch_date >= '2010-01-01';*/

/*-- Uppgift 5
SELECT *,
CONCAT(first_name, ' ', last_name) AS name,
CASE
WHEN MOD(SUBSTRING(ssn, -2, 1), 2) = 0 THEN 'female'
ELSE 'male'
END AS gender
FROM account;*/

/*-- UPPGIFT 6
SELECT *,
CONCAT(first_name, ' ', last_name) AS name, ssn
FROM account
WHERE CAST(SUBSTRING(ssn, LENGTH(ssn) - 1, 1) AS UNSIGNED) MOD 2 = 0
AND CAST(SUBSTRING(ssn, 1, 2) AS UNSIGNED) > 70;*/

/*-- Uppgift 7
SELECT
CASE
WHEN MOD(CAST(SUBSTRING(ssn, LENGTH(ssn) - 1, 1) AS UNSIGNED), 2) = 0 THEN 'Female'
ELSE 'Male'
END AS gender,
AVG(2024 - (1900 + CAST(SUBSTRING(ssn, 1, 2) AS UNSIGNED))) AS average_age
FROM account
GROUP BY gender;*/
