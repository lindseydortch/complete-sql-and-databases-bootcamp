/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
-- My Solution: 
SELECT a.orderid, CONCAT(b.firstname, ' ', b.lastname), b.state
FROM orders as a INNER JOIN customers as b
ON a.orderid = b.customerid AND b.state = 'OH' OR b.state = 'NY' OR b.state = 'OR'
ORDER BY orderid

-- Mo's Solution: 
SELECT c.firstname, c.lastname, o.orderid FROM orders AS o
INNER JOIN customers AS c ON o.customerid = c.customerid
WHERE c.state IN ('NY', 'OH', 'OR')
ORDER BY o.orderid;

/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/
-- My Solution: 
SELECT a.prod_id, b.quan_in_stock
FROM products as a LEFT JOIN inventory as b
ON a.prod_id = b.prod_id
WHERE b.quan_in_stock IS NOT NULL;

-- Mo's Solution: 
SELECT p.prod_id, i.quan_in_stock
FROM products as p
INNER JOIN inventory AS i oN p.prod_id = i.prod_id 

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/
-- My Solution: 
SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), b.dept_no
FROM employees as a INNER JOIN dept_emp as b
ON a.emp_no = b.emp_no

-- Mo's Solution: 
SELECT e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
INNER JOIN departments AS dp ON dp.dept_no = de.dept_no