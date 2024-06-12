/*
* DB: Employees
* Table: employees
* Question: Sort employees by first name ascending and last name descending
*/
-- My answer:
SELECT first_name, last_name from employees ORDER BY first_name, last_name DESC;

-- Mo's Answer:
SELECT * FROM employees
ORDER BY first_name ASC, last_name DESC;

/*
* DB: Employees
* Table: employees
* Question: Sort employees by age
*/
-- My answer:
SELECT birth_date FROM employees ORDER BY birth_date ASC

-- Mo's Answer:
SELECT * FROM employees
ORDER BY birth_date;

/*
* DB: Employees
* Table: employees
* Question: Sort employees who's name starts with a "k" by hire_date
*/
-- My answer:
SELECT first_name, hire_date from employees WHERE first_name ILIKE 'K%' ORDER BY hire_date ASC

-- Mo's Answer:
SELECT * FROM employees
WHERE first_name ILIKE 'k%'
ORDER BY hire_date;