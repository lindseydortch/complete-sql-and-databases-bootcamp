# Section 5: SQL Deep Dive 

## Query Along 
- Practice by coding along 

## Starting With Query 
- Let's get querying 
  - SQL Commands 
    - DDL - Data Definition Language - Changing the database 
      - Create
      - Alter
      - Drop
      - Rename
      - Truncate
      - Comment
    - DQL - Data Query Language
      - Select 
    - DML - Data Modification Lnaguage - actually have to do with the data inside the database 
      - Insert 
      - Update
      - Delete 
      - Merge 
      - Call 
      - Explain Plan 
      - Lock Table
    - DCL - Data Control Language - Granting or revoking access 
      - Grant 
      - Revoke 
- Simple Select Statement 
  - `select name from users where role = 'manager'`
- What is a select? 
  - It retrieves data 
  - DQL - used to retrieve data 

## Exercise: Simple Queries 
- In Valentina Studio 
  - Right click on the instance and select 'Run SQL editor' -> Click on the database you want -> Go into schemas -> public and then table you want 
    - You can double click on the table you want and it will fill it in 
- When you see public, just know it's okay because have one schema 
  - In larger systems there may be schemas available 
- Exercises
  - Question: Give me a list of all employees in the company 
    - `select * from "public"."employees"`
  - Question: How many departments are in the company?
    - `select * from "public"."departments"`
  - Question: How many times has employees 10001 had a raise?
    - `select * from "public"."salaries"`
  - Question: What title does 10006 have?
    - `select * from "public"."titles"`

## Changing Column Names in a SELECT Query 
- Renaming Columns 
  - `SELECT column as '<new name>'`

## Concat Function 
- Column Concatenation 
  - Make your data prettier/simpler
- Column Concatenation 
  - You can concatenate columns together 
- Exercise 
  - Question 
    - Concatenate the first and last name of the employee into one column 
    - Rename the concatenated column 
  - Exmaple
    - Single quotes are for text and double quotes are for columns 
    - `SELECT CONCAT(emp_no, ' ', title) FROM titles`
    - `SELECT CONCAT(emp_no, ' is a ', title) FROM titles`
    - When you run concat you have to rename the column
      - `SELECT CONCAT(emp_no, ' is a ', title) AS "Employee Title" FROM titles`
    - Answer
      - My answer: 
        - `SELECT CONCAT(first_name, ' ', last_name, ' started on ', hire_date) AS "Employee Info"  FROM employees`
      - Andrei's Answer: 
        - `SELECT emp_no, CONCAT(first_name, ' ', last_name) as "full name" FROM emmployees`
- Column Concatenation 
  - CONCAT(TEXT, TEXT) - single quotes
  - CONCAT(COLUMN1, COLUMN2) - double quotes

## What Is a Function In SQL?
- What is a function?
  - Something that takes in an input and generates an output 
  - We gave it parameters and then it returned what the concat function does 
  - Look at the name of the function because it will tell us what it does 
  - We then have to look at the kind of inputs it takes 
  - A function is a set of steps that creates a single value 
- Types of functions 
  - Aggregate 
    - Aggregate data 
    - Take all of the data and produce on single value 
    - Example would be creating a sum of all the total salaries 
  - Scalar 
    - Run against each individual row 
    - You get multiple outputs 
- Aggregate 
  - Operate on many records to produce 1 value 
  - Produces a summary 
- Scalar (Non-aggregate)
  - Operate on each record independently 
  - Example concat the firstName and lastName column 

## Aggregate Functions 
- Aggregate Functions 
  - AVG() - calculates the avergae of a set of values 
  - COUNT() - counts rows in a specified table or view
    - `SELECT count(emp_no) FROM employees`
  - MIN() - gets the minimum value in a set of values 
  - MAX() - gets the maximum value in a set of values 
  - SUM() - calculates the sum of values 
- Exercises 
  - Get the highest salary available 
    - `SELECT max(salary) FROM salaries` - 158220
  - Get the total amount of salaries paid 
    - `SELECT SUM(salary) FROM salaries` - 181480757419

## Exercise: Aggregate Functions 
- Exercise on Aggregate Functions - See exercises folder 

## Commenting Your Queries 
- Adding Comments 
  - `-- Single line comments`
  - `/* Multi line comments */`
- Exercise
  - Question: Select the employee with the name Mayumi Schueller
    - My Answer
      - `SELECT emp_no, CONCAT(first_name, ' ', last_name) FROM employees where first_name = 'Mayumi' AND last_name = 'Schueller'`
    - Andrei's Answer
      - `SELECT first_name, last_name FROM employees where first_name = 'Mayumi' AND last_name = 'Schueller'`
  - Question: Comment on your query what is happening 
    - `/* filter on first name AND last name to limit the amount of data returned`
    - `and focus the filtering on a single person */` 
- What is vital 
  - Waht is the intended outcome of the query or even comment beside the query even 

## Common SELECT Mistakes 
- Common SELECT Mistakes 
  - Mispelling commands 
  - Using ; instead of , or vice versa 
  - Using " instead of ' 
    - " is for tables or column names 
    - ' is for text
    - SQL is case insensitive, when you use "" it tells SQL that you are looking for that table with the uppercase or lowercase 
    - This is up to the team on whether or not you use "" to call tables or columns
    - Need double quotes if you're adding a space in between 
  - Invalid column name 

## Filtering Data 
- How to filter data 
  - Our first filter 
    - `SELECT name FROM users WHERE role = 'manager'`
  - We can filter for multiple pieces of data 
- We need to think of queries as questions 
- Filtering is an essential skill when writing queries 
- Where is what? 
  - Our filter 
- Exercise
  - Question: Get a list of all female employees 
    - `SELECT first_name, last_name FROM employees WHERE gender = 'F'`

## AND and OR 
- Multiple Search Criteria? 
  - Filtering by age and gender 
- The "AND" keyword 
  - Both or all criteria need to be met or true in order for me to get any data at all back 
- The more filters you put in, you may not getting anything back 
- We can chain multiple criteria to be met to be returned 
- What if you want to filter on two first names? 
  - `SELECT first_name, last_name, hire_date FROM employees WHERE first_name='Georgie' AND last_name='Facello' AND hire_date='1986-06-26 OR first_name = 'Bezalel' AND last_name='Simel'`
  - There is an order of operations, our filters are extremely specific so then we can use the OR keyword 
  - When SQL sees an AND it's going to chain it to the previous statement it was checking 
  - When SQL sees an OR it will start checking for other things 
  - The order of operations is based off the OR clause 
  - OR - it's this filter or that filter 

## Exercise: Filtering Data 
- Exercises 
  - Database - Store 
  - Question: How many female customer do we have from the state of oregon (OR) and New York (NY)
    - My answer 
      - `SELECT count(customerid) FROM customers WHERE gender='F' AND state='OR' OR state='NY'`
    - Mo's answer 
      - `SELECT firstname, lastname FROM customer WHERE (state='OR' OR state='NY') AND gender='F'`
    - We can use the () to apply the AND for both use cases 

## The NOT Keyword 
- What if you want to filter on everything but...?
  - The "NOT" keyword 
  - `SELECT firstname, gender FROM users WHERE NOT gender = 'm'`
  - NOT says do not put these 
    - Removes results 
- Exercise 
  - Question: How many customer aren't 55? 
    - `SELECT COUNT(age) AS "all" FROM customers WHERE NOT age='55'`

## Exercise: The Where Clause 
- Exercises from W3 Schools on Where 

## Comparison Operators 
- Comparison Operators 
  - There are many different comparison operators 
    - >
    - <
    - <=
    - >=
    - =
    - !=
  - Equal To
    - Check if the given values are equal. If it's equal, then the condition will be true.
      - `0 = 0 -- true`
      - `'Mo' = 'mo' -- false`
    - Not Equal To 
      - Check if the given values are not equal. If it's not equal, then the conition will be true. 
      - `0 != 1 -- true`
      - `0 <> 1 -- true` -- special syntax or another way of writing it 
    - Greater Than 
      - Check if the given value is larger than the other value. If it's greater, then the condition will be true 
      - `10 > 0 -- true`
      - `0 > 10 -- false`
      - `'abc' > 'ace' -- true`
    - Less Than 
      - Check if the given value is smaller than the other value. If it's less, then the condition will be true 
      - `0 < 1 -- true`
    - Greater Than OR Equal To 
      - Check if the given value is larger than or equal to the other value. If it's greater or equal, then the condition will be true 
      - `2 >= 1 -- true` 
      - `2 >= 2 -- true` 
    - Less Than OR Equal To 
      - Check if the given value is smaller than or equal to the other value. If it's less or equal, then the condition will be true 
      - `0 <= 1 -- true` 
      - `1 <= 1 -- true` 
  - Comparison operators are commonly used for numbers 

## Exercise: Comparison Operators
- **COME BACK TO THIS LECTURE**

## Logical Operators 
- Logical Operators 
  - And 
    - If both boolean expressions are true then it will return results 
  - Or 
    - If any Boolean expressions is true then it will return results 
  - Not 
    - If any boolean expression is not true then it will return results 
  - Comparison Operators 
- Order of operations 
  - From (Select the table) --> Where (filter) --> Select (this is how I want to visualize)

## Operator Precedence 
- Operator Precedence 
  - A statement having multiple operators is evaluated based on the priority of operators 
  - Every operator we use has a priority 
  - Order 
    - Parentheses -> Multiplication/ Division -> Subtraction/Addition -> NOT -> AND -> OR 
  - If the operators have equal precedences, then the operators are evaluated directionally, from left to right or right to left 
  - You can look at the Postgres docs to see the assiotivity to show whether that operator looks to the left or right 
- Examples 
  - Broken clause 
    - `SELECT state, gender FROM customers WHERE gender = 'F' AND state = 'OR' OR state = 'NY';`
      - Get me state and gender where you are: 
        - A female from oregon or you are from new york 
    - `SELECT state, gender FROM customers WHERE gender = 'F' AND state = 'OR' OR state = 'NY'; AND gender = 'F'`
      - Get me state and gender where you are: 
        - A female from oregon or a female from NY 
    - `SELECT state, gender FROM customers WHERE gender = 'F' AND (state = 'OR' OR state = 'NY')` 
      - Get me state and gender where you are: 
        - A female and you are from oregon or ny 

## Operator Precedence 2 
- Priority 
  - A statement having multiple operators is evaluated based on the priority of operators 
- Order
  - `SELECT state, gender FROM customers WHERE gender = 'F' AND state = 'OR' OR state = 'NY'; AND gender = 'F'`
    - Gender Female 
    - From Oregon 
    - Gender Female 
    - From NY 
  - `SELECT state, gender FROM customers WHERE gender = 'F' AND (state = 'OR' OR state = 'NY')` 
    - From Oregon 
    - From NY 
    - Gender Female 
    - Because we put the parentheses we can look at this filter doing two things as one action 
- Direction 
  - If the operators have equal precedence, then the operators are evaluated directionally, from left to right or right to left
  - `age > 20 AND salary > 1000 AND gender = 'f' AND NOT state = 'NY'`
    - Not From NY 
    - Older tahn 20 
    - Salary > 1000 
    - Gender is female 
  - `(age > 20 OR age < 30) AND salary > 1000 AND NOT state = 'NY' AND NOT state = 'OR'` 
    - Ages 21 and 29
    - Not from NY 
    - Not from OR 
    - Salary > 1000 
  - `age > 20 OR age < 30 AND salary > 1000 AND NOT state = 'NY' AND NOT state = 'OR'`
    - Filter 1
      - Younger than 30 
      - Not from NY 
      - Not from OR 
      - Salary > 1000 
    - Filter 2 
      - Older than 20 
  - `age > 20 OR age < 30 OR salary > 1000`
    - Filter 1
      - Younger than 30
    - Filter 2
      - Older than 20 
    - Filter 3
      - Salary > 1000 
- Priority and Direction 
  - `(salary > 10000 AND state = 'NY' OR ((age > 20 AND age < 30) AND salary <= 20000)) AND gender = 'F'`
    - Filter 1
      - Salary > 10000
      - From NY 
      - Female
    - Filter 2 
      - Between 21 and 29 
      - Salary lower than or equal to 20,000 
      - Female 
  - Top level parentheses is going to be higher priority 

## Operator Precedence Extra 
- Written out notes on operator precedence 

## Exercise: Operator Precedence 
- Exercise on Operator Precedence -- see section-5 folder in exercises folder 

## Checking For NULL Values 
- Checking for Empty values 
  - When a record does not have a value its considered empty 
- Null values
  - Null 
    - Is the term used to represent a missing/empty value 
- What is null? 
  - A null value is different from a zero value or a field that contains spaces
- Checking for empty values 
  - <NULL> - most databases will visualize to you that this is a null value or it is empty 
  - Data should never come into your database without being sanitized
- Should I use null? 
  - Be careful 
    - Turn everything off and only turn on what you need 
  - Be mindful 
    - Maybe don't make fields nullable because you may not be able to catch these later on 
  - Be deliberate 
    - Document it and make it clear and why you made the choice to make this nullable 
- A contentious issue 
  - Null is a contentious issue 
  - No matter what opinion you have people may disagree 
- Null is special 
  - `1 = 1 -- true`
  - `1 != 1 -- false`
  - `null = null -- null`
  - `null <> null -- null`
- All roads lead to null 
  - No matter what you do with null it will always be null subtract, divide, equal...

## IS Keyword 
- Show how should I use it
  - Optional or required? 
    - Is my data? 
    - Optional - we may need this at some point 
      - Something that isn't immediately tied in to you having account 
    - Required - username, password, stuff you know you'll need to create an account 
  - Future info? 
    - Optiinal info is often future info, information you'll get at some point in the user process 
  - Rational? 
    - What impact will this have if I make this nullable? 
- Be defensive 
  - Always check for nulls when necessary 
  - 1. Filter out nulls 
  - 2. Clean Up Your Data 
- The "IS" operator 
  - Allows you to filter on values that are null, not null, true or false
  - `SELECT * FROM <table> WHERE <field> IS [NOT] NULL;`
  - `SELECT * FROM <table> WHERE <field> IS NOT FALSE`
  - `SELECT * FROM users WHERE age = 20 IS FALSE;`
    - Everyone that is not 20 

## NULL Coalescing 
- Be Defensive 
  - 2. Clean Up Your Data 
- Null value substitution 
  - Ability to replace null values to operate on the data 
  - Coalesce returns the FIRST non-null value in a list 
- Coalesce 
  - `SELECT coalesce(<column>, 'Empty') AS column_alias FROM <table>`
  - `SELECT coalesce(<column1>, <column2>, <column3>, 'Empty') AS column_alias FROM <table>`

## Exercise: Null Value Coalescing 
- Exercise on Null Coalescing 

## 3 Valued Logic 
- Three-Valued Logic 
  - Besides true and false, the result of logical expressions can also be unknown 
  - True - Null or unknown - False 
  - Each expression can have three different outcomes 
  - The SQL null value "could be anything"
  - Nothing equals null, not even null, each null could be different 
  - That's why we use the "is null" to check 
  - `(NULL = 1) OR (1=1) -- true` 
    - We will still filter on 1 = 1 
  - `(NULL = 1) AND (1=0) -- null` - null and false = null 
    - There is no result set 
  - `SELECT <column> FROM <table> WHERE <column> = NULL`
    - Null is always unknown 
  - `SELECT <column> FROM <table> WHERE <column> IS NULL`
    - Is Null checks for unknowns 
    - We will get true 
- Strange Scenarios 
  - `SELECT <column> FROM <table> WHERE (<column> = NULL) OR (NOT <column> = NULL)`
    - This would return nothing 
  - `SELECT <column> FROM <table> WHERE (<column> IS NULL) OR (NOT <column> IS NOT NULL)`
    - Nothing would be rejected 

## Exercise: 3 Valued Logic 
- Exercise on 3 Valued Logic 

## BETWEEN + AND 
- Between And
  - Shorthand to match a range of values 
  - `SELECT <column> FROM <table> WHERE BETWEEN X AND Y`
    - Replaces `<column> >= X AND <column> <= Y>`
  - Not that BETWEEN AND is sensitive to the order of arguments
- Why Should you use it? 
  - Readability 
  - Maintainability 

## Exercise: BETWEEN + AND
- Exercise on BETWEEN AND 

## IN Keyword 
- Filtering Multiple Values 
  - What if I want to find multiple values, but not write endless and statements 
- In Keyword 
  - Check if a value matches any value in a list of values 
  - `SELECT * FROM <table> WHERE <column> IN (value1, value2, ...)`
  - `SELECT * FROM employees WHERE emp_no(100001, 100006, 11008)`

## Exercise: IN Keyword 
- Exercise on the IN Keyword

## LIKE 
- Partial Lookups 
  - What if you don't know exactly what you're searching for? 
- LIKE
  - `SELECT first_name FROM employees WHERE first_name LIKE 'M%'`
    - Get everyon who's name starts with 'M'
- Pattern Matching 
  - In order to use like you need to build patterns to match 
  - Pattern wildcards - Meaning
    - % - Any number of characters 
    - `-` - 1 character
  - Use Cases - Meaning 
    - LIKE '%2' - Fields that end with 2
    - LIKE '%2%' - Fields that have 2 anywhere in the value 
    - LIKE '_00%' - Fields that have 2 zero's as the second and third character and anything after 
    - LIKE '%200%' - Fields that have 200 anywhere in the value 
    - LIKE '%2_%_%' - Finds any values that start with 2 and are at least 3 characters in length
    - LIKE '2___3' - Finds any values in a five-digit number that start with 2 and end with 3
- LIKE Keyword 
  - Postgres LIKE only does text comparison so we must CAST whatever we use to text 
- Casting 
  - Casting is the act of changing something to something else 
- Casting to text 
  - `CAST (salary AS text)`
  - `salary::text` -- shorthand 
- ILIKE Keyword 
  - `name ILIKE 'MO%'`
    - Case insensitive matching 

## Exercise: Like Keyword 
- Exercise on the Like Keyword 

## Dates and Timezones
-  Date Filtering 
   -  Dates are hard 
      - The standard around dates has shifted as time has moved forward 
- What is a timezone? 
  - Sir Sanford Fleming - had the idea on how to align how we handle time 
- What is GMT? 
  - Greenwich Mean Time 
- What is UTC? 
  - Universal Coordinate Time 
    - A standard, a way to manage time, this is not a time zone 
- What's the difference? 
  - One is a time zone 
  - One is a standard 
  - No territories 
  - Use UTC 
  - They share the same current time, but conceptually they are different 
- What should I use? 
  - `SET TIME ZONE 'UTC'`
  - ALWAYS use UTC 
  - Always try to think about your data in a uniform way 
  - When you set time zone in a session, it only runs for that session, if you want it to stay you need to configure it in pg 

## Setting Up Timezones 
- We can `ALTER USER <username> SET timezone='UTC'`

## How Do We Format Date and Time? 
- Manipulating Dates? 
  - ???
- How do dates look? 
  - Postgres uses ISO-8601
  - This is the standard we want to use on computers 
  - Since we're at the database level we want to follow as many standards as possible, so other applications can use them 
  - ISO-8601 
    - YYYY-MM-DDTHH:MM:SS 
    - 2017-08-17T12:247:16+02:00 
      - +02:00 - offset of UTC by two hours 
        - This is important because it will automatically assume your timezone is UTC 
- What is a format?
  - A format is a way of representing a date and time 

## Timestamps 
- Timestamps 
  - A timestamp is a date with time and timezone info 
  - `SELECT now()` - we get back an ISO-8601 string 
- How to decide to store your timestamp is of the utmost importance 
- `CREATE TABLE timezones ( ts TIMESTAMP WITHOUT TIME ZONE, tz TIMESTAMP WITH TIME ZONE)`
  - The way we declared our column has a lot to do with the way the column stored the information 
  - The way we insert information is also as important as when we create it 
- These nuances may not seem important
- Timestamps or dates? 
  - It depends on what you're storing 
    - Example of when timestamps are important: a doctor needing to know exactly when medication was given to a patient 

## Date Functions 
- Date operators
  - Postgres gives us operators to help simplify dates  
- Current Date 
  - `SELECT NOW()::date;`
  - `SELECT CURRENT_DATE;` 
- Formatting 
  - `SELECT TO_CHAR(CURRENT_DATE, 'dd/mm/yyy')`
- Format modifiers 
  - Identifier - meaning 
    - D - Day 
    - M - Month 
    - Y - Year 
    - The Postgres documentation has a list of all the different modifiers you can use 

## Date Difference and Casting 
- Difference 
  - `SELECT now() - '1800/01/01'`
  - output: <no> days HH:MI:SS:MS
  - Subtracting dates returns the difference in days 
- To Date 
  - `select date '1800/01/01'`
  - output: 1800-01-01 - casts it to ISO-8601

## Age Calculation 
- Calculate Age 
  - `select AGE(date '1800/01/01')`
  - Make sure you put a cast to date 
  - `select AGE(date '1992/11/13', date '1800/01/01')`
    - Output: 192 years 10 mons 12 days 

## Extracting Information 
- Extract Day 
  - `SELECT EXTRACT (DAY FROM date '1992/11/13') AS MONTH`
    - 13
  - `SELECT EXTRACT (MONTH FROM date '1992/11/13') AS MONTH`
    - 11
  - `SELECT EXTRACT (YEAR  FROM date '1992/11/13') AS MONTH`
    - 1992
  - The () are extremely important here 
- Round a date 
  - `SELECT DATE_TRUNC('year', date '1992/11/13')`
    - 1992-01-01
    - It will take the year and set the month and date to the lowest pobbile date 
    - Works the same as if you pass in the month or day (day will just return that date)

## Intervals 
- Interval
  - `SELECT * FROM orders WHERE purchaseDate <= now() - interval '30 days'`
    - <30 days before given date>
  - Interval allows us to write queries in a way that mirrors language 
  - It can store and manipulate a period of time in years, months, days, hours, minutes, seconds, etc.
  - Identifiers 
    - Years 
    - Months 
    - Days 
    - Hours
    - Minutes 
  - You subtract a date 
  - Examples
    - `INTERVAL '1 year 2 months 3 days';`
    - `INTERVAL '2 weeks ago';`
    - `INTERVAL '1 year 3 hours 20 minutes';`
- Extracting
  - `SELECT EXTRACT(year FROM INTERVAL '5years 20 months');`
    - 6

## Exercise: Date and Timestamp 
- Exercises on Dates and Timestamps

## DISTINCT 
- Distinct Keyword 
  - Removes Duplicates 
  - Dinstinct caluse keeps one row for each group of duplicates 
  - `SELECT DISTINCT <column 1>, <column 2> FROM <table>`
    - Multiple columns will evaluate based on the combination of the columns
      - When you use multiple columns it can get a little tricky 

## Exercise: Distinct Keyword
- Exercise on the Distinct Keyword 

## Sorting Data 
- Sorting Data 
- Order By 
  - `SELECT * FROM customer ORDER BY <column> [ASC/DESC]`
    - Sort data either ascending or descending by column
- Ascending 
  - `SELECT * FROM customer ORDER BY name ASC`
- Descending 
  - `SELECT * FROM customer ORDER BY name DESC`
- Multiple Columns 
  - `SELECT * FROM customers ORDER BY name, lastname DESC`
  - This only sorts the lastname since the identifier is linked to it 
- Using Expressions 
  - `SELECT * FROM customers ORDER BY LENGTH(name)`

## Exercise: Sorting Data 
- Exercise on Sorting Data 

## Multi Table SELECT 
- Multi-Table Select 
  - Combining the table from multiple tables in order to create a visualization that can span a relationships 
- What if you want to combine data from multiple tables? 
  - Putting an employees information with his salary example 
- How? 
  - `SELECT a.emp_no, CONCAT(a.first_name, a.last_name) as "name", b.salary FROM employees as a, salaries as b`
  - Odd.. why is it adding so many salaries to 1 person?
    - Using the foreign key 
  - What if we could use the where caluse to create that link 
    - `SELECT a.emp_no, CONCAT(a.first_name, a.last_name) as "name", b.salary FROM employees as a, salaries as b WHERE a.emp_no = b.emp_no;`
- What did we do? 
  - We joined two daya sets 
- Joins 
  - A join combines columns from one table with those of another 
  - Take a column from one table that can map to the column of another table 
  - Most common approach? 
    - Link primary key to a foreign key 

## Inner Join 
- Inner Joins 
  - If you have a column that links the column from table a to table b you can use an inner join 
    - Table A -- Matched -- Table B 
    - Table A has the emp_no and table B references the emp_no 
  - Finds the intersection of two datasets based on a link and returns you that subset
- Inner Joins 
  - `SELECT a.emp_no, CONCAT(a.first_name, a.last_name) as "name", b.salary FROM employees as a INNER JOIN salaries as b ON b.emp_no = a.emp_no`
  - There is no WHERE clause in a join like in the example in the last lecture 
- Difference? 
  - The inner join syntax is generally considered a best practice it's more readbale than using the WHERE syntax 
  - It shows you what's being joined 
- Sorting 
  - Results come back unsorted 
  - So make sure you order by the employee number or whatever you prefer 
  - The relational model does not warrant the order of the data, it is up to the query to sort the data 
- Curveball 
  - What if we only want to know the raised from a promotion?
- 3 Table Inner Join 
  - `SELECT a.emp_no, CONCAT(a.first_name, a.last_name) as "name", b.salary, c.title, c.from_date AS "promototed on" FROM employees AS a INNERJOIN salaries AS b ON a.emp_no = b.emp_no INNER JOIN titles AS c ON c.emp_no = a.emp_no AND c.from_date = (b.from_Date + interval '2 days') ORDER BY a.emp_no`
  - Title change always follows 2 days after the raise 
  - The ON keyword works the same as the WHERE clause 
- Problem? 
  - You want to know the original salary and also know the salary at a promotion?
  - We use the OR instead of AND 
- `SELECT a.emp_no, CONCAT(a.first_name, a.last_name) as "name", b.salary, c.title, c.from_date AS "promototed on" FROM employees AS a INNERJOIN salaries AS b ON a.emp_no = b.emp_no INNER JOIN titles AS c ON c.emp_no = a.emp_no AND (c.from_date = (b.from_Date + interval '2 days') OR c.from_date = b.from_date) ORDER BY a.emp_no`
- Joining data also works as a filter - it basically is a filter 
- It's hard 
  - Inner joins can become more complicated as you add more tables that you want to combine 
- Always use inner join as a best practice 
  - Most often you know it's a primary key to foreign key relationship 

## Self Join 
- Self Join
  - Joining a table to itself 
  - This usually can be done when a table has a foreign key referencing it's primary key 
  - Example
    - Having a supervisor ID for employees based in the same table 
  - For some tables, it's easier to keep a reference to itself 
- Problem
  - What if we want to see the supervisors name? 
- Solution 
  - `SELECT a.id, a.name as "employees", b.name as "supervisor name" FROM employee as a, employee as b WHERE a.supervidorId = b.id
  - Self joins are the same thing as an inner join, self joins are all about joning a table to itself because a promary and foreign key are in the same table 

## Outer Join 
- Outer Join 
  - What if I also need the wors that don't match? 
    - With inner join, we were looking for where the data intersects 
    - We were going for the middle point 
    - Outer joins focus on the data that don't meet in the middle 
  - Outer joins add the data that don't have a match 
- Left Outer Join 
  - Left joins add the data that don't have a match from Table A 
  - `SELECT * FROM <table A> AS a LEFT [OUTER] JOIN <table B> AS b ON a.id = b.id`
    - Let me find everything where a.id = b.id and then even returns every row where it couldn't find that data 
      - This can return null 
  - Any value that doesn't match is made to be null 
- Problem?
  - You want to know how many employees aren't managers? 
- Solution?
  - `SELECT COUNT(emp.emp_no) FROM employees AS emp LEFT JOIN dept_manager AS dep ON emp.emp_no WHERE dep.emp_no IS NULL;`
- Problem? 
  - We want to know every salary raise and also know which ones were a promotion 
- Solution?
  - `SELECT a.emp_no, CONCAT(a.first_name, a.last_name) as "name", b.salary, coalesce(c.title, 'No title change'), COALESCE(c.from_date::text, '-') AS "title taken on" FROM employees AS a INNER JOIN salaries AS b ON a.emp_no = b.emp_no LEFT JOIN titles AS c ON c.emp_no = a.emp_no AND (c.from_date = (b.from_date + interval '2 days') OR c.from_date = b.from_date) ORDER BY a.emp_no`
- Right Outer Join 
  - Right joins add the data that don't have a match from table b 
  - `SELECT * FROM <table A> AS a RIGHT [OUTER] JOIN <table B> AS b ON a.id = b.id`
  - Any value that does not match is made to be null 

## Less Common Joins 
- Joins You Won't See Often 
  - There are more join techniques they just aren't used that often 
- Cross Join 
  - Create a combination of every row 
  - Add Table A and Table B to combine everything with everything 
  - Known as a cartesian 
- Full Outer join 
  - Return results from both whether they match or not 
- Most joins will answer your common problems 

## Inner-Join Exercises 
- Exercises on Inner Joins 

## USING Keyword 
- Using 
  - Simplifying the join syntax 
  - For the most part stick with the ON keyword 
  - To avoid always having to write out the ON syntax, you can use `USING(emp_no)`
  - Can be used to easily match primary to foreign key relationships