
/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

SELECT AGE(birth_date), * FROM employees WHERE (EXTRACT (YEAR FROM AGE(birth_date))) > 60;

/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/
-- My answer
SELECT count(emp_no) FROM employees WHERE (EXTRACT (MONTH FROM hire_date::date)) = '02';

-- Mo's answer: 
SELECT count(emp_no) FROM employees
where EXTRACT (MONTH FROM hire_date) = 2

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/
-- My answer: 
SELECT count(emp_no) FROM employees WHERE (EXTRACT(MONTH FROM birth_date::date)) = 11;

-- Mo's Answer: 
SELECT COUNT(emp_no) FROM employees
WHERE EXTRACT (MONTH FROM birth_date) = 11;

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/
-- My answer: 
SELECT MAX(age(birth_date)) FROM employees; 

-- Mo's Answer: 
SELECT MAX(age(birth_date)) FROM employees;

/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/
-- My Answer: 
SELECT count(orderid) FROM orders WHERE ((EXTRACT(month FROM orderdate::date)) = 1) AND ((EXTRACT(year FROM orderdate::date)) = 2004);

-- Mo's Answer: 
SELECT COUNT(orderid)
FROM orders
WHERE DATE_TRUNC('month', orderdate) = date '2004-01-01';