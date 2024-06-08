# Section 3: Databases + SQL Fundamentals 

## SQL Playground 
- DB Fiddle - this is a tool we will be using as a playground 
  - You can switch between 
- A majority of the time the queries will be provided, so we can jsut fire them off in DB Fiddle, so we can hit the ground running 

## What Is SQL? 
- SQL is a language we will be using to talk to our database 
  - When we use SQL we will be giving the database statements or instructions (queries)

## What Is a Query? 
- Query 
  - Nothing more as instructions, basically a question 
  - Also known as statement 
  - `SELECT * FROM "user"`
- Query Breakdown 
  - SQL Statement 
    - `select * from User where role = 'manager'`
    - clause - `select name` - name is the idnetifier 
      - identiefier - different word for part of the data 
    - clause - `from users` 
    - clause - `where role = 'Manager` 
      - `where` is the keyword 
      - `role = manager` is the condition 
        - A condition is something that needs to be met 
      - `'manager'` is the expression 
        - Expression - we want to filter based on our assumption
  - 

## Exercise: Setting Up Your First Database
-  Exercise on using the statements we learned in the previous lecture 

## Imperative vs Declarative 
- Declara-what? 
  - Declarative: 
    - What will happen
    - Person -- make a sandwich with hame --> sandwich 
    - Examples: SQL 
  - Imperative 
    - How it will happen
    - Person -- slice bread and slice ham -- make sandwich --> sandwich 
    - Examples: Java 
  - Python can be both imperative and declarative 

## History of SQL 
- History of SQL
  - SQL?
  - Sequel? 
    - The original name 
    - Structured English Query Lnaguage 
  - Written in the 1970's, but formalized in the 1980's
  - Written by IBM based on a paper written by another IBM developer 

## Optional: History of SQL Deep Dive 
- Link to video if you want to go on a Deep Dive 

## Exercises: The Select Statement 
- Link to two exercises on the select statement from w3 Schools

## SQL Standards 
- SQL Standards 
  - SQL is known as a standardize language 
  - A committee comes together every year to make the rules of how to make SQL work for your database 
  - It's good to follow the standards, so you have consistency 
    - The companies that make the databases use this and then add their own features to make their database stand out 

## What Is a Database? Revisited 
- Before Databases we had - File Processing Systems 
  - The first digital version of the filing cabinet 
  - File Processing Systems had a lot of benefits and a lot of negatives 
  - For a user 
    - The user would talk to the computer then the computer would go through a programming language and then the database would have to sort through the database 
    - All of these systems were built custom 
  - Limitations 
    - Everything is completely independent of each other 
    - All the ways the files were stored were different 
- Database approach 
  - Migrated to everything being on one system 

## Database Oriented Approach 
- Database Approach 
  - DBMS - manage your data and follows a model
  - Different database softwares follow different models 
  - But it's going to force a structure of data that everything needs to follow 
  - You can build more robust systems that allow for references and you can draw relationships between the data 
  - Now the SQL -> DBMS -> Data - the user doesn't need to know the specific system 
    - Took away a developer needing to build custom systems for everyone 

## Exercise: SQL Starter Quiz 
- Link to Quiz on what we've learned so far 

## Database Models 
- Database Models? 
  - Hierarchial* - we will also look at these first two because they're important for a foundation 
  - Networking* 
  - Entity-Relationship
  - Relational* - we will be looking at throughout the course 
  - Object Oriented 
  - Flat 
  - Semi-structured 

## Hierarchial and Networking Model 
- Hierarchial Model 
  - Primarily used by IBM in the 60's 
  - Data is organized in a tree like structure, has a concept of a parent and child 
    - Every child has a single root 
    - Each and every node can only have one parent 
    - Every parent can have multiple children, but every child can only have a parent 
  - XML is an example 
  - Because you have a parent struture, when you delete a parent, you lose the information of the child 
  - This is good for descrbing one-to-many relationship 
    - One parent can have many children and a child can only have one parent 
- Network Model 
  - Expanded on the hierarchial model 
  - Allowed many-to-many relationships 
  - Data became to intricate to work with 

## Relational Model 
- The first model with a formalized set of rules 
- Instead of relating your data with a parent-child relationship - it follows a table structure (or relations)
- We choose something that can uniquely identify each peice of data 
- The logic of how the relationships are linked are managed by the database management software 

## DBMS Revisited 
- What is a DBMS?
  - A piece of software that says I am going to manage your database, it's like your mediator, it's like a referee that inforces the rules 
    - I am going to follow this model and I am going to manage these rules for you and make sure your database is secure 
- What can it do? 
  - CRUD
    - Create 
    - Read 
    - Update
    - Delete 
  - Manage and secure your data 
    - Manage your data - saved in the right place 
    - Secure your data 
    - Transaction management - we will learn more about this later 
- Who?
  - Microsoft 
  - IBM 
  - MySQL 
  - Oracle 
  - PostgreSQL - open source 
  - Everything uses SQL, but they all compete with each other on features 
- What can it do? 
  - Uses SQL to talk to the database 
  - The baseline of SQL is abstracted from the software 
- Example 
  - SQL is the customer 
  - DBMS is the chef 
    - Every chef cooks differently because everyone thinks differently 
    - Think of this as the different DBMS you can use 
  - Database is the type of cooking 
- RDBMS 
  - Relational Database Management System - a software that specializes in relational databases 
  - Edgar CODD wrote 13 rules that a DBMS needs to follow 
    - When you get an error, means you aren't following the rules to save things in a relational way 

## Relational Model Revisited 
- Relational Model 
  - Attribute 
  - Tuple
  - Domain 
  - Degree 
  - Column 
  - Tables 
  - Relation Schema 
  - Cardinality 
  - Relation Key 
  - Relation Instance 

## Tables 
- Tables 
  - A representation of the data object 
  - Each table has a name - a concept of the data we are going store 
    - Think of what you name a sheet in excel  
  - We have columns that have names and then rows that have the data 
  - A table has more nuance than an excel sheet, but they are a very similar concept  

## Columns
- Column 
  - We are being specific about what we want to store 
  - A collection of all the columns - Degree 
  - Every column stores a very specific type of data 
  - Domain/ Constraint - what the column can contain 
    - Example for DOB we can only put dates 
    - It's the constraint of the data 
  - Attributes 
    - Another way of talking about columns 

## Rows 
- Rows 
  - Tuples/ Rules 
    - A single record of data 
    - Each and every tuple follows the column constraints 
  - Cardinality
    - Collection of rows/ tuples 

## Primary and Foreign Keys 
- Primary Key 
  - A key - something that uniquely identifies your data 
    - A unique identifier 
  - This means we can know for certain because we have something that uniquely identifies your row 
- Foreign key 
  - The key to reference another piece of data 
  - Creates a new column that's sole purpose is to reference the primary key of a different table allowing a relationship to be formed 
- We link primary keys to form relationships and when a primary key is called in another table it is called the foreign key 

## OLTP vs OLAP 
- Relational Databases 
  - Support day to day operations of a company 
  - Support analysis of a company 
- OTLP
  - Online Transaction Processing 
  - The transactions we do 
  - Drives day to day operations 
- OLAP  
  - Online Analytical Processing 
  - We take the transactional processing and then figuring out the analytics behind that data 
  - Driving future decisions 

## Exercise: OTLP vs OLAP 
- Exercise 
  - A database is being used to log orders and customers 
    - OTLP
  - A database is being used to figure out what new products we should offer 
    - OLAP
  - A database is being used to derive statistics for reporting to the executives 
    - OLAP
  - A database is being used to keep track of logged in users
    - OTLP

## Exercise: Relational Model Quiz 
Quiz on Relaional Models 

## Endorsements On LinkedIn 
- Note on endorsing other ZTM students on linkedin