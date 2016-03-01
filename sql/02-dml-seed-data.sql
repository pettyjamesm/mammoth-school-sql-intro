
-- Schema from previous file:
-- CREATE TABLE users (
--     id integer primary key,
--     email_address varchar not null,
--     first_name varchar,
--     last_name varchar,
--     is_admin boolean not null default false
-- );

-- CREATE TABLE products (
--     id integer primary key,
--     name varchar not null,
--     price decimal(5, 2) not null
-- );

-- CREATE TABLE orders (
--     id integer primary key,
--     user_id integer not null,
--     placed_at timestamp not null default current_timestamp,
--     FOREIGN KEY (user_id) REFERENCES users(id)
-- );

-- CREATE TABLE order_products (
--     id integer primary key,
--     order_id integer not null,
--     product_id integer not null,
--     FOREIGN KEY (order_id) REFERENCES orders(id),
--     FOREIGN KEY (product_id) REFERENCES products(id)
-- );

-- Seed our users into the database. Email addresses have been changed to protect the innocent from spammers.
INSERT INTO 
    users (email_address, first_name, last_name, is_admin) 
VALUES
    ('jpetty@example.com', 'James', 'Petty', 1),
    ('chris@example.com', 'Chris', 'Clouten', 1),
    ('bigfoot@example.com', NULL, NULL, 0),
    ('imissthe70s@example.com', 'Cher', NULL, 0);

-- Seed some products so that people can buy stuff
INSERT INTO
    products (name, price)
VALUES
    ('Daily Face Wash', 7.00),
    ('Truman Set', 15.00),
    ('Razor Blades', 16.00),
    ('Foaming Shave Gel', 6.00);

-- Randomize orders from users multiple times, leaves one user without any orders
INSERT INTO orders (user_id, placed_at)
SELECT id, datetime('now',  (abs(random() % (86400 * 90)) * -1) || ' seconds')
FROM users ORDER BY random() LIMIT 3;

INSERT INTO orders (user_id, placed_at)
SELECT id, datetime('now',  (abs(random() % (86400 * 90)) * -1) || ' seconds')
FROM users 
WHERE id IN (select user_id from orders)
ORDER BY random() LIMIT 2;

-- Randomize the order items such that each order has at least one item in it
INSERT INTO order_products (order_id, product_id)
WITH order_product_matches AS (
    SELECT o.id as order_id, p.id as product_id, random() as shuffle FROM orders o JOIN products p ON (1 = 1)
) SELECT order_id, product_id FROM order_product_matches GROUP BY order_id HAVING max(shuffle);

-- Randomly assign more products to the orders if any exist
INSERT INTO order_products (order_id, product_id)
WITH order_product_matches AS (
    SELECT o.id as order_id, p.id as product_id, random() as shuffle FROM orders o JOIN products p ON (1 = 1) ORDER BY random() LIMIT 5
) 
SELECT order_id, product_id 
FROM order_product_matches opm
WHERE
    NOT EXISTS (SELECT 1 FROM order_products op WHERE opm.order_id = op.order_id AND opm.product_id = op.product_id)
GROUP BY order_id HAVING max(shuffle);





