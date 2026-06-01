```sql
-- Create products table
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    quantity INTEGER NOT NULL
);

-- Create customers table
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT
);

-- Create orders table
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    order_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create order_items table
CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

---------------------------------------------------
-- INSERT SAMPLE DATA
---------------------------------------------------

-- Insert products
INSERT INTO products (name, price, quantity)
VALUES ('Laptop', 800.00, 5);

INSERT INTO products (name, price, quantity)
VALUES ('Keyboard', 25.50, 15);

INSERT INTO products (name, price, quantity)
VALUES ('Mouse', 18.99, 20);

-- Insert customers
INSERT INTO customers (first_name, last_name, email)
VALUES ('Joshua', 'Jimenez', 'joshua@email.com');

INSERT INTO customers (first_name, last_name, email)
VALUES ('Ana', 'Lopez', 'ana@email.com');

-- Insert orders
INSERT INTO orders (customer_id, order_date)
VALUES (1, '2026-05-30');

INSERT INTO orders (customer_id, order_date)
VALUES (2, '2026-05-30');

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity)
VALUES (1, 1, 1);

INSERT INTO order_items (order_id, product_id, quantity)
VALUES (1, 2, 2);

INSERT INTO order_items (order_id, product_id, quantity)
VALUES (2, 3, 1);

---------------------------------------------------
-- SELECT QUERIES
---------------------------------------------------

-- View all products
SELECT * FROM products;

-- View all customers
SELECT * FROM customers;

-- View all orders
SELECT * FROM orders;

---------------------------------------------------
-- JOIN QUERY
---------------------------------------------------

SELECT customers.first_name,
       products.name AS product_name,
       order_items.quantity,
       orders.order_date
FROM order_items
JOIN orders
ON order_items.order_id = orders.order_id
JOIN customers
ON orders.customer_id = customers.customer_id
JOIN products
ON order_items.product_id = products.product_id;

---------------------------------------------------
-- UPDATE QUERY
---------------------------------------------------

UPDATE products
SET price = 850.00
WHERE product_id = 1;

---------------------------------------------------
-- DELETE QUERY
---------------------------------------------------

DELETE FROM order_items
WHERE product_id = 3;

DELETE FROM products
WHERE product_id = 3;
```
