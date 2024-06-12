-- How many female customers do we have from the state of Oregon (OR)?
/*
* Write your query here
*/
-- Result: 106 
-- My answer: 
SELECT COUNT(firstname) FROM customers WHERE state = 'OR' AND gender = 'F';

-- Mo's answer: 
SELECT COUNT(firstName)
FROM customers
WHERE gender = 'F' and state = 'OR';

-- Who over the age of 44 has an income of 100 000 or more? (excluding 44)
/*
* Write your query here
*/
-- Result: 2,497 results back 
-- My answer: 
SELECT CONCAT(firstname, ' ', lastname) FROM customers WHERE age > 44 AND income >= 100000;

-- Mo's answer: 
SELECT COUNT(income)
FROM customers
WHERE age > 44 and income >= 100000;

-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results)
/*
* Write your query here
*/
-- Result: 2,362 results back 
-- My answer: 
SELECT CONCAT(firstname, ' ', lastname) FROM customers WHERE (age >= 30 AND age =< 50) AND income <= 50000;

-- Mo's answer: 
SELECT COUNT(income)
FROM customers
WHERE age >= 30 and age <= 50 AND income < 50000;

-- What is the average income between the ages of 20 and 50? (Excluding 20 and 50)
/*
* Write your query here
*/
-- Result: 59409.926240780098
-- My answer: 
SELECT avg(income) FROM customers WHERE (age > 20 AND age < 50);

-- Mo's answer: 
SELECT AVG(income)
FROM customers
WHERE age > 20 and age < 50;