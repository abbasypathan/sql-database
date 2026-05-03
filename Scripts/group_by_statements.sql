-- Aggregate Functions : Take multiple inputs and return single output by combining results

select * from film;
select MIN(replacement_cost) from film;
select MAX(replacement_cost) from film;
select MIN(replacement_cost), MAX(replacement_cost) from film;

select COUNT(*) from film;

select AVG(replacement_cost) from film;

select ROUND(AVG(replacement_cost),2) from film;

select SUM(replacement_cost) from film;

---------------------------------------------------------------------------------------------------------------------------------------------
-- GROUP BY : Group rows with the same value together, then perform calculations on each group
select * from payment;
select customer_id from payment group by customer_id;
select customer_id from payment group by customer_id order by customer_id;
select customer_id, SUM(amount) from payment group by customer_id;
select customer_id, SUM(amount) from payment group by customer_id order by SUM(amount);
select customer_id, SUM(amount) from payment group by customer_id order by SUM(amount) DESC;
select customer_id, COUNT(amount) from payment group by customer_id order by COUNT(amount);
select customer_id,staff_id,SUM(amount) from payment group by customer_id,staff_id;
select customer_id,staff_id,SUM(amount) from payment group by customer_id,staff_id order by customer_id;

select DATE(payment_date) from payment;
select DATE(payment_date) from payment group by DATE(payment_date);
select DATE(payment_date),SUM(amount) from payment group by DATE(payment_date);
select DATE(payment_date),SUM(amount) from payment group by DATE(payment_date) order by SUM(amount);
select DATE(payment_date),SUM(amount) from payment group by DATE(payment_date) order by SUM(amount) DESC;

-- Challenge : We have two staff members, with Staff IDs 1 and 2. We want to give a bonus to the staff member that handled the most payments. (Most in terms of number of payments processed, not total dollar amount).How many payments did each staff member handle and who gets the bonus?
select * from payment;
select staff_id,COUNT(*) from payment group by staff_id;

-- Challenge : Corporate HQ is conducting a study on the relationship between replacement cost and a movie MPAA rating (e.g. G, PG, R, etc...). What is the average replacement cost per MPAA rating?
--             Note: You may need to expand the AVG column to view correct results
select * from film;
select rating, ROUND(AVG(replacement_cost),2) from film group by rating;

-- Challenge : We are running a promotion to reward our top 5 customers with coupons. What are the customer ids of the top 5 customers by total spend?
select * from payment;
select customer_id, SUM(amount) from payment group by customer_id order by SUM(amount) desc limit 5;

---------------------------------------------------------------------------------------------------------------------------------------------
-- HAVING : HAVING filters grouped/aggregated data
select * from payment;
select customer_id, SUM(amount) from payment group by customer_id;
select customer_id, SUM(amount) from payment where customer_id not in(184,87,477) group by customer_id;
select customer_id, SUM(amount) from payment group by customer_id having SUM(amount) > 100;

select * from customer;
select store_id, COUNT(*) from customer group by store_id;
select store_id, COUNT(*) from customer group by store_id having COUNT(*) > 300;

-- Challenge : We are launching a platinum service for our most loyal customers. We will assign platinum status to customers that have had 40 or more transaction payments. What customer_ids are eligible for platinum status?
select * from payment;
select customer_id, COUNT(*) from payment group by customer_id having COUNT(*) >= 40;

-- Challenge : What are the customer ids of customers who have spent more than $100 in payment transactions with our staff id member 2?
select * from payment;
select customer_id,SUM(amount) from payment where staff_id = 2 group by customer_id having SUM(amount) > 100;
---------------------------------------------------------------------------------------------------------------------------------------------

-- Assessment Test 1 :

-- 1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
select * from payment;
select customer_id,SUM(amount) from payment where staff_id = 2 group by customer_id having SUM(amount) > 110;

-- 2. How many films begin with the letter J?
select * from film;
select COUNT(title) from film where title like 'J%';

-- 3. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
select * from customer;
select first_name,last_name from customer where first_name like 'E%' and address_id < 500 order by customer_id desc limit 1;
---------------------------------------------------------------------------------------------------------------------------------------------
