
CREATE TABLE users (
    id integer primary key,
    email_address varchar not null,
    first_name varchar,
    last_name varchar,
    is_admin boolean not null default false
);

CREATE TABLE products (
    id integer primary key,
    name varchar not null,
    price decimal(5, 2) not null
);

CREATE TABLE orders (
    id integer primary key,
    user_id integer not null,
    placed_at timestamp not null default current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_products (
    id integer primary key,
    order_id integer not null,
    product_id integer not null,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);