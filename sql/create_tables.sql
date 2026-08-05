CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    registration_date DATE,
    city VARCHAR(50)
);


CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);


CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);


CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);