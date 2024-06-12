/*
* DB: Store
* Table: customers
* Question: adjust the following query to display the null values as "No Address"
*/
SELECT address2 
FROM customers
-- My Answer: 
SELECT coalesce(address2, 'No Address')
FROM customers

-- Mo's Answer: 
SELECT COALESCE(address2, 'No Address')
FROM customers

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/

SELECT *
FROM customers
WHERE COALESCE(address2, null) IS NOT null;

-- My Answer: 
SELECT *
FROM customers
WHERE address2 IS NOT null;

-- Mo's Answer: 
SELECT *
FROM customers
WHERE address2 IS NOT null;

/*
* DB: Store
* Table: customers
* Question: Fix the following query to apply proper 3VL
*/

SELECT coalesce(lastName, 'Empty'), * from customers
where (age = null);

-- My Answer: 
SELECT coalesce(lastName, 'Empty'), * from customers
where (age IS null);

-- Mo's Answer: 
SELECT coalesce(lastName, 'Empty'), * from customers
where (age IS NULL);