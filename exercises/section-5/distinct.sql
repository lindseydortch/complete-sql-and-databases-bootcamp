/*
* DB: Employees
* Table: titles
* Question: What unique titles do we have?
*/
-- My answer: 
SELECT  count(DISTINCT title) FROM titles;

-- Mo's Answer: 
SELECT DISTINCT title FROM titles;

/*
* DB: Employees
* Table: employees
* Question: How many unique birth dates are there?
*/
-- My answer: 
SELECT count(DISTINCT birth_date) FROM employees;

-- Mo's Answer: 
SELECT COUNT(DISTINCT birth_date)
from employees;

/*
* DB: World
* Table: country
* Question: Can I get a list of distinct life expectancy ages
* Make sure there are no nulls
*/
-- My answer: 
SELECT DISTINCT lifeexpectancy FROM country WHERE lifeexpectancy IS NOT NULL;

-- Mo's Answer: 
SELECT DISTINCT lifeexpectancy FROM country
WHERE lifeexpectancy IS NOT NULL
ORDER BY lifeexpectancy;