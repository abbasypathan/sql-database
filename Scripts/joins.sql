-- JOINS : JOINS allow us to combine information from multiple tables

-- 1. AS : creating new name for data output
select * from payment;
select amount from payment;
select amount as rental_amount from payment;
select SUM(amount) as net_revenue from payment;
select customer_id, SUM(amount) as total_spents from payment group by customer_id;
select customer_id, SUM(amount) as total_spents from payment group by customer_id having SUM(amount) > 100;

-- 2. INNER JOIN : Returns only matching records from both tables
select * from payment;
select * from customer;
select * from payment inner join customer on payment.customer_id = customer.customer_id;
select payment_id, payment.customer_id, first_name from payment inner join customer on payment.customer_id = customer.customer_id;
select payment_id, payment.customer_id, first_name from customer join payment on payment.customer_id = customer.customer_id;

-- 3. FULL OUTER JOIN : Match all records even if it's not common
select * from payment;
select * from customer;
select * from customer full outer join payment on customer.customer_id = payment.customer_id;
select * from customer full outer join payment on customer.customer_id = payment.customer_id where customer.customer_id is null or payment.payment_id is null;
select COUNT(distinct customer_id) from payment;
select COUNT(distinct customer_id) from customer;

-- 4. LEFT OUTER JOIN/ LEFT JOIN : All data from left table and matching data from right table
select * from film;
select * from inventory;
select film.film_id, title, inventory_id store_id from film left outer join inventory on inventory.film_id = film.film_id;
select film.film_id, title, inventory_id store_id from film left join inventory on inventory.film_id = film.film_id;
select film.film_id, title, inventory_id, store_id from film left join inventory on inventory.film_id = film.film_id where inventory.film_id is null;

-- 5. RIGHT OUTER JOIN/ RIGHT JOIN : All data from right table and matching data from left table
select * from film;
select * from inventory;
select film.film_id, title, inventory_id store_id from film right outer join inventory on inventory.film_id = film.film_id;
select film.film_id, title, inventory_id store_id from film right join inventory on inventory.film_id = film.film_id;
select film.film_id, title, inventory_id, store_id from film right join inventory on inventory.film_id = film.film_id where film.film_id is null;

-- 6. UNION : Combine result of 2 separate SELECT statement
select * from customer;
select * from address;
select first_name, last_name from customer union select address,district from address;
--------------------------------------------------------------------------------------------------------------------------------------------------
-- JOIN Challenges

-- 1.  California sales tax laws have changed and we need to alert our customers to this through email. What are the emails of the customers who live in California?
select * from address;
select * from customer;
select district, email from address inner join customer on address.address_id = customer.address_id where district = 'California';

-- 2. A customer walks in and is a huge fan of the actor "Nick Wahlberg" and wants to know which movies he is in. Get a list of all the movies "Nick Wahlberg" has been in.
select * from film;
select * from film_actor;
select * from actor;
select title, first_name, last_name from film inner join film_actor on film.film_id = film_actor.film_id inner join actor on film_actor.actor_id = actor.actor_id where first_name ='Nick' and last_name = 'Wahlberg';
--------------------------------------------------------------------------------------------------------------------------------------------------