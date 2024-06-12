
-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: Employees
 */
-- 


-- Question 1: What is the average salary for the company?
-- Table: Salaries
-- Result: 63810.744836143706
SELECT AVG(salary) FROM salaries;


-- Question 2: What year was the youngest person born in the company?
-- Table: employees
-- Result: 1965-02-01
SELECT max(birth_date) FROM employees;


-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: France
 */
-- 

-- Question 1: How many towns are there in france?
-- Table: Towns
-- Result: 36684
SELECT COUNT(id) FROM towns;


-- BEFORE YOU START
/*
 * What database should I use for these exercises?
 * Name: World
 */
-- 

-- Question 1: How many official languages are there?
-- Table: countrylanguage
-- Result: 238
SELECT COUNT(countrycode) FROM countrylanguage WHERE isofficial = true;

-- Question 2: What is the average life expectancy in the world?
-- Table: country
-- Result: 66.48603611164265
SELECT AVG(lifeexpectancy) FROM country;

-- Question 3: What is the average population for cities in the netherlands?
-- Table: city
-- Result: 185001
SELECT AVG(population) FROM city WHERE countrycode = 'NLD';