-- Conditional Expressions & Procedures

-- 1. General CASE
SELECT * FROM customer;
SELECT customer_id, 
CASE  
	WHEN(customer_id <= 100) THEN 'Premium'
	WHEN(customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_class
FROM customer ORDER BY customer_id;

-- 2. Expression CASE
SELECT * FROM customer;
SELECT customer_id, 
CASE  customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN '2nd Place'
	ELSE 'Normal'
END AS raffle_result
FROM customer ORDER BY customer_id;

SELECT * FROM film;

SELECT rental_rate,
CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END
FROM film;

SELECT SUM(
CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END
) AS bargins,
SUM(
CASE rental_rate
	WHEN 2.99 THEN 1
	ELSE 0
END
) AS regular,
SUM(
CASE rental_rate
	WHEN 4.99 THEN 1
	ELSE 0
END
) AS premium
FROM film;

-- Challenge
-- 1. We want to know and compare the various amounts of films we have per movie rating. Use CASE and the dvdrental database to re-create this table: r pg pg13
SELECT * FROM film;

SELECT SUM(
CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END
) AS r,
SUM(
CASE rating
	WHEN 'PG' THEN 1
	ELSE 0
END
) AS pg,
SUM(
CASE rating
	WHEN 'PG-13' THEN 1
	ELSE 0
END
) AS pg13
FROM film;
------------------------------------------------------------------------------------------------------------------------
-- CAST
SELECT CAST('5' AS INTEGER) AS new_int;
SELECT '5'::INTEGER AS new_int;

SELECT * FROM rental;
SELECT CAST(inventory_id AS VARCHAR) FROM rental;
SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental;
------------------------------------------------------------------------------------------------------------------------
-- NULLIF

CREATE TABLE depts(
	first_name VARCHAR(50),
	deprtment VARCHAR(50)
);

INSERT INTO depts(first_name,deprtment)
VALUES('Vinton','A'),('Lauren','A'),('Clair','B');

SELECT * FROM depts;

SELECT (
SUM(CASE WHEN deprtment='A' THEN 1 ELSE 0 END)/
SUM(CASE WHEN deprtment='B' THEN 1 ELSE 0 END)
) AS deprtment_ratio FROM depts;

DELETE FROM depts WHERE deprtment='B';

SELECT * FROM depts;

SELECT (
SUM(CASE WHEN deprtment='A' THEN 1 ELSE 0 END)/
SUM(CASE WHEN deprtment='B' THEN 1 ELSE 0 END)
) AS deprtment_ratio FROM depts; -- Expected error as dividing by 0

/* With NULLIF */
SELECT (
SUM(CASE WHEN deprtment='A' THEN 1 ELSE 0 END)/
NULLIF(SUM(CASE WHEN deprtment='B' THEN 1 ELSE 0 END),0)
) AS deprtment_ratio FROM depts;
------------------------------------------------------------------------------------------------------------------------
-- Views : Virtual table stored as a result of view query
SELECT * FROM address;
SELECT * FROM customer;

SELECT first_name, last_name, address FROM customer INNER JOIN address ON customer.address_id = address.address_id;

CREATE VIEW customer_info AS SELECT first_name, last_name, address FROM customer INNER JOIN address ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

CREATE OR REPLACE VIEW customer_info AS SELECT first_name, last_name, address, district
FROM customer INNER JOIN address ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

DROP VIEW customer_info;

DROP VIEW IF EXISTS customer_info;

ALTER VIEW customer_info RENAME TO cus_info;

SELECT * FROM cus_info; 

DROP VIEW cus_info;
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------