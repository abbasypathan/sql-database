-- Advanced SQL Commands

-- 1. Timestampes & Extract
-- All configuration setting of database
show all;

-- Give current date with timestamp
show timezone;
select current_date;
select current_time;
select now();
select timeofday();

-- EXTRACT()
select * from payment;
select EXTRACT(year from payment_date) from payment;
select EXTRACT(year from payment_date) as my_year from payment;
select EXTRACT(month from payment_date) from payment;
select EXTRACT(day from payment_date) from payment;
select EXTRACT(quarter from payment_date) from payment;
select EXTRACT(week from payment_date) from payment;

-- AGE()
select * from payment;
select AGE(payment_date) from payment;

-- TO_CHAR()
select * from payment;
select TO_CHAR(payment_date,'mm:dd:yyyy') from payment;
select TO_CHAR(payment_date,'MONTH - yyyy') from payment;
select TO_CHAR(payment_date,'MONTH    YYYY') from payment;
select TO_CHAR(payment_date,'mon/dd/yyyy') as my_date from payment;

-- Challenge

-- 1. During which months did payments occur? Format your answer to return back the full month name.
select * from payment;
select distinct TO_CHAR(payment_date,'MONTH') from payment;

-- 2. How many payments occurred on a Monday?
-- DOW : is return index of week starting from Sunday as 0
select * from payment;
select COUNT(*) from payment where EXTRACT(DOW from payment_date) = 1;
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mathematical Operation and Functions

select * from film;
select rental_rate/replacement_cost from film;
select ROUND(rental_rate/replacement_cost,4) from film;
select ROUND(rental_rate/replacement_cost,4) * 100 as pecentage_cost from film;
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- String Functions & Operators

select * from customer;
select length(first_name) from customer;
select first_name || last_name from customer;
select first_name || ' ' || last_name from customer;
select first_name || ' ' || last_name as full_name from customer;
select UPPER(first_name) || ' ' || UPPER(last_name) as full_name from customer;
select UPPER(first_name || ' ' || last_name) as full_name from customer;

select first_name || last_name || '@gmail.com' from customer;
select left(first_name,1) || last_name || '@gmail.com' from customer;
select LOWER(left(first_name,1) || last_name || '@gmail.com') from customer;
select LOWER(left(first_name,1) || last_name || '@gmail.com') as custom_email from customer;
select LOWER(left(first_name,1)) || LOWER(last_name) || '@gmail.com' as custom_email from customer;
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- SubQuery

select * from film;
select AVG(rental_rate) from film;
select title, rental_rate from film where rental_rate > (select AVG(rental_rate) from film);

select * from rental;
select * from inventory;
select * from rental where rental_date between '2005-05-29' and '2005-05-30';
select inventory.film_id from rental inner join inventory on inventory.inventory_id = rental.inventory_id where rental_date between '2005-05-29' and '2005-05-30';

select film_id, title from film where film_id in(select inventory.film_id from rental inner join inventory on inventory.inventory_id = rental.inventory_id 
where rental_date between '2005-05-29' and '2005-05-30');

select film_id, title from film where film_id in(select inventory.film_id from rental inner join inventory on inventory.inventory_id = rental.inventory_id 
where rental_date between '2005-05-29' and '2005-05-30') order by film_id;

select * from customer;
select * from payment;
select first_name, last_name from customer as c where exists (select * from payment as p where p.customer_id = c.customer_id and amount > 11);
select first_name, last_name from customer as c where not exists (select * from payment as p where p.customer_id = c.customer_id and amount > 11);
---------------------------------------------------------------------------------------------------------------------------------------------------------

-- Self Join : In this case table join itself, it is useful to comparing value in a column of rows within table
select * from film;
select f1.title,f2.title, f1.length from film as f1 inner join film as f2 on f1.film_id = f2.film_id and f1.length = f2.length;
select f1.title,f2.title, f1.length from film as f1 inner join film as f2 on f1.film_id != f2.film_id and f1.length = f2.length;
---------------------------------------------------------------------------------------------------------------------------------------------------------