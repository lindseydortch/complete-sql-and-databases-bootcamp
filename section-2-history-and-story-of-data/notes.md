# Section 2: History and Story of Data 

## What Is a Database? 
- Database 
  - It's a collection of data, a method for accessing and manipulating that data 
- Data is everywhere 
  - We produce 2.5 quintellion bytes of data a year 
  - More data has been collected in the last two years in human history 
  - The idea is that we're capturing and saving this data for us to use 
- What is a database?
  - They're just computers 
    - Just a way for us to store data on computers using 1's and 0's 
    - Essentially a disc 

## I Didn't Learn Anything, Try Again... 
- A pen and paper could be a database or excel 
- Before we had disc drives, we had drum memory 
  - It was cylindrical, this is why you'll see databases represented this way 
- There is a point where we have too much data, this is why a database can't just be an excel sheet 
- Some of the most popular databases are 
  - MySQL 
  - PsotgreSQL 
  - MongoDB
  - Redis
- Data Everywhere 
  - Example a product manager 
    - Always have to know about the products they're working on 
  - Example marketers 
    - Need insights to learn how to market to their customers 
- There's all sorts of people who uses databases 

## Database Management Systems (DBMS)
- What We will learn 
  - How to put data in a database 
  - How to use/update/learn from data 
  - How to remove data 
- Confusing Acronyms 
  - DBMS - Database Management System 
    - Receives instructions and instructs the system to grab or manipulate the data 
  - RDBMS - Relational Database Management System 
    - MySQL or MongoDB 
    - Same thing as a DBMS, but the model that is being used
  - SQL - Structured Query Language 
    - Way for us to interact with a DBMS 
  - We have 
    - Data 
    - DBMS and RDBMS - example PostgreSQL (relational database)
    - These together are what we call a database
      - When you hear Postgres or MongoDB - it means both the Data + database 
    - SQL 
      - Not a programming lanuaguge - a query language 
      - Makes it easy for everyone to use 
      - By learning SQL we get to work with different database engines 

## Exercise: Building Amazon 
- Building Amazon 
  - In the 90's - they used an excel spreadsheet instead of pen and paper to keep track of orders 
  - Later the excel sheet starts to get bigger 
- SQL playground has a built in database you can play around with 

## Exercise: Building Amazon 2
- Amazon is advised a database might be useful 
- They decide to organize the data in a way that looks like an excel sheet 

## 5 Types of Databases 
- There are 100's of DBMS's - you will never use all these databases 
- You can categorize databases into five main types or called data models: 
  - Relational 
  - Document 
    - Really good for scalability 
  - Key Value 
    - Redis or DynoDB 
  - Graph 
    - Use the graph model, good for data that's connected in different ways 
    - One of the least used 
  - Wide Columnar 
    - Pretty new, pioneered by Google's Big Table 

## Exercise: What Is a Database? 
- My answer: a way to manage data and make it more readable for anyone to use 
- Andrei's answer: a system that allows a user to store organize and use data 

## Section Review 
- Do you have useful data? 
- Install a DB to store data 
- Use SQL to setup + use data 