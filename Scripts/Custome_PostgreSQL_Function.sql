CREATE TABLE items (
    item_id SERIAL PRIMARY KEY,
    item VARCHAR(50),
    price NUMERIC,
    discount NUMERIC
);

INSERT INTO items (item, price, discount) VALUES
('Laptop', 50000, 10),
('Mobile', 20000, NULL),
('Headphones', 2000, 15);

-----------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION calculate_final(price NUMERIC, discount NUMERIC)
RETURNS NUMERIC AS $$ 
BEGIN
	RETURN price - COALESCE(discount, 0);
END;
$$ LANGUAGE plpgsql;

SELECT * FROM items;
SELECT item, calculate_final(price, discount) AS final FROM items;
-----------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION my_sum_func(total NUMERIC, val NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
    RETURN total + val;
END;
$$ LANGUAGE plpgsql;

CREATE AGGREGATE my_sum(NUMERIC) (
    SFUNC = my_sum_func,
    STYPE = NUMERIC,
    INITCOND = 0
);

SELECT my_sum(price) FROM items;

-----------------------------------------------------------------------------------------
