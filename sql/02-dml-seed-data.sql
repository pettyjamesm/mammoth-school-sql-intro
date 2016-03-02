
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
    users (id, email_address, first_name, last_name, is_admin) 
VALUES
    (1, 'jpetty@example.com', 'James', 'Petty', 1),
    (2, 'chris@example.com', 'Chris', 'Clouten', 1),
    (3, 'bigfoot@example.com', NULL, NULL, 0),
    (4, 'imissthe70s@example.com', 'Cher', NULL, 0);

-- Seed some products so that people can buy stuff
INSERT INTO
    products (id, name, price)
VALUES
    (1, 'Daily Face Wash', 7.00),
    (2, 'Truman Set', 15.00),
    (3, 'Razor Blades', 16.00),
    (4, 'Foaming Shave Gel', 6.00);

-- Make some orders with some time somewhat shuffled around
INSERT INTO 
    orders (id, user_id, placed_at)
VALUES
    (1, 2, '2015-12-04 06:02:30'),
    (2, 4, '2016-02-25 04:45:14'),
    (3, 3, '2016-02-24 04:12:05'),
    (4, 2, '2015-12-29 08:30:09'),
    (5, 3, '2015-12-20 20:26:32');

-- Assign some products to those orders
INSERT INTO 
    order_products (id, order_id, product_id)
VALUES
    (1, 1, 4),
    (2, 2, 1),
    (3, 3, 3),
    (4, 4, 2),
    (5, 5, 4),
    (6, 1, 2),
    (7, 2, 4),
    (8, 3, 1);





