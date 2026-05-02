-- SELECT : Fetch data from database using column name or * which will fetch all column
SELECT * FROM actor;
select first_name,last_name from actor;
SELECT * FROM city;

-- Challenge : Send email of promotional information to all the customer
select * from customer;
select first_name,last_name,email from customer;

-------------------------------------------------------------------------------------------
-- SELECT DISTINCT : Ftech uniqueu data
select * from film;
select distinct release_year from film;
select distinct(release_year) from film;
select distinct rental_rate from film;
-- As we have primary key all elements are unique so it will be same as first query
select distinct * from film;

-- Challenge : Business want to know what are different rating type are available
select rating from film;
select distinct rating from film;

-------------------------------------------------------------------------------------------
-- COUNT : COUNT function returns number of row matches conditions/ () this is mandatory after COUNT function

select * from payment;
select COUNT(*) from payment;
select count(amount) from payment;
select count(distinct amount) from payment;

-------------------------------------------------------------------------------------------
-- SELECT WHERE : WHERE statement allow to add condition on column to fetch data

select * from customer;
select * from customer where first_name = 'Jared';
select * from film;
select * from film where rental_rate > 4;
select * from film where rental_rate > 4 and replacement_cost >= 19.99;
select * from film where rental_rate > 4 and replacement_cost >= 19.99 and rating = 'R';
select count(*) from film where rental_rate > 4 and replacement_cost >= 19.99 and rating = 'R';
select * from film where rating = 'R' or rating = 'PG-13';
select * from film where rating != 'R';

-- Challenge : Customer name Nancy Thomas forgot her wallet at store we need to sent mail to informer her
select * from customer;
select email from customer where first_name = 'Nancy' and last_name = 'Thomas';

-- Challenge : Customer want to know about movie Outlaw Hanky
select * from film;
select description from film where title = 'Outlaw Hanky';

-- Challenge : Customer is late on their movie return we need to email them at their address 259 Ipoh Drive. We should also called them
select * from address;
select phone from address where address = '259 Ipoh Drive';

-------------------------------------------------------------------------------------------
-- ORDER BY : Order data based on column value either ascending or decending order
select * from customer;
select * from customer order by first_name;
select * from customer order by first_name ASC;
select * from customer order by first_name DESC;
select * from customer order by store_id;
select store_id,first_name,last_name from customer order by store_id;
select store_id,first_name,last_name from customer order by store_id DESC,first_name asc;

-- Challenge : It is below with LIMIT statement
-------------------------------------------------------------------------------------------
-- LIMIT : It allows to limit number of rows returned in the query results
select * from payment;
select * from payment limit 5;
select * from payment order by payment_date limit 5;
select * from payment where amount != 0.99 order by payment_date limit 5;

-- Challenge : We want to reward our customer who first created payments
select * from payment;
select customer_id from payment order by payment_date limit 10;

-- Challenge : Customer want to rent movie to watch in short break get 5 shortest movie
select * from film;
select title,length from film order by length limit 5;

-- Challenge : Customer want to rent movie to watch in short break get 5 shortest movie
select * from film;
select count(*) from film where length <= 50;
select count(*) from film where film.length <= 50;
-------------------------------------------------------------------------------------------
-- BETWEEN : BETWEEN operator can be used to match data against range of values
select * from payment;
select * from payment where amount between 8 and 9;
select * from payment where amount not between 8 and 9;
select * from payment where payment_date between '2007-02-01' and '2007-02-15';

-------------------------------------------------------------------------------------------
-- IN : Check multiple conditions which matches list of values provided IN
select * from payment;
select distinct(amount) from payment order by amount;
select * from payment where amount in(0.99,1.98,1.99);
select * from payment where amount not in(0.99,1.98,1.99);
select * from customer;
select * from customer where first_name in('John','Jake','Julie');
select * from customer where first_name not in('John','Jake','Julie');

-------------------------------------------------------------------------------------------
-- LIKE & ILIKE : This is for string pattern mating to fetch data
select * from customer;
select * from customer where first_name like 'J%';
select * from customer where first_name like 'J%' and last_name like 'S%';
select * from customer where first_name ilike 'j%' and last_name ilike 's%';
select * from customer where first_name ilike '%er%';
select * from customer where first_name ilike '%er_';
select * from customer where first_name not ilike '%er_';
select * from customer where first_name ilike 'A%' order by last_name;
select * from customer where first_name ilike 'A%' and last_name not like 'B%' order by last_name;

-------------------------------------------------------------------------------------------
-- General Challenges :

-- How many payments transactions were greater than $5
select * from payment;
select count(*) from payment where amount > 5;

-- How many actors have a first name that starts with the letter P
select * from actor;
select count(*) from actor where first_name like 'P%';

-- How many unique district are our customers from
select * from address;
select count(distinct district) from address;

-- List of names from unique district for all the customers
select * from address;
select distinct district from address;

-- How many films have a rating 'R' and a replacement cost between $5 and $15
select * from film;
select count(*) from film where rating = 'R' and replacement_cost between 5 and 15;

-- How many films have the word Truman somewhere in the title
select * from film;
select count(*) from film where title like '%Truman%';
-------------------------------------------------------------------------------------------

