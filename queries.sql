-- Create tables for e-commerce dataset

-- Customers table
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    signup_date DATE NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- Products table
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INTEGER NOT NULL
);

-- Orders table
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order items table
CREATE TABLE order_items (
    order_item_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Reviews table
CREATE TABLE reviews (
    review_id VARCHAR(50) PRIMARY KEY,
    product_id VARCHAR(50) NOT NULL,
    customer_id VARCHAR(50) NOT NULL,
    rating INTEGER NOT NULL,
    comment TEXT,
    review_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample data

-- Insert 5 customers
INSERT INTO customers (customer_id, name, email, signup_date, country) VALUES
('c1', 'Alice Kumar', 'alice.kumar@example.com', '2024-01-15', 'India'),
('c2', 'Ravi Patel', 'ravi.patel@example.com', '2024-03-02', 'India'),
('c3', 'Sana Iyer', 'sana.iyer@example.com', '2024-02-10', 'India'),
('c4', 'Dev Singh', 'dev.singh@example.com', '2024-04-01', 'India'),
('c5', 'Meera Rao', 'meera.rao@example.com', '2024-05-20', 'India');

-- Insert 5 products
INSERT INTO products (product_id, name, category, price, stock) VALUES
('p1', 'Bamboo Notebook', 'Stationery', 25.00, 120),
('p2', 'Wireless Mouse', 'Electronics', 40.00, 60),
('p3', 'Ceramic Mug', 'Home', 15.00, 200),
('p4', 'Portable Speaker', 'Electronics', 100.00, 30),
('p5', 'Phone Charger', 'Electronics', 8.00, 150);

-- Insert 5 orders
INSERT INTO orders (order_id, customer_id, order_date, total_amount, status) VALUES
('o1', 'c1', '2025-05-01', 58.00, 'delivered'),
('o2', 'c2', '2025-05-02', 85.00, 'delivered'),
('o3', 'c1', '2025-05-05', 100.00, 'processing'),
('o4', 'c3', '2025-05-06', 55.00, 'delivered'),
('o5', 'c4', '2025-05-10', 80.00, 'delivered');

-- Insert 5 order items
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
('oi1', 'o1', 'p1', 2, 25.00),
('oi2', 'o1', 'p5', 1, 8.00),
('oi3', 'o2', 'p2', 1, 40.00),
('oi4', 'o2', 'p3', 3, 15.00),
('oi5', 'o3', 'p4', 1, 100.00);

-- Insert 5 reviews
INSERT INTO reviews (review_id, product_id, customer_id, rating, comment, review_date) VALUES
('r1', 'p1', 'c1', 5, 'Very handy notebook', '2025-05-02'),
('r2', 'p2', 'c2', 4, 'Good mouse', '2025-05-03'),
('r3', 'p3', 'c3', 3, 'Average mug', '2025-05-07'),
('r4', 'p5', 'c4', 5, 'Works well', '2025-05-11'),
('r5', 'p3', 'c2', 4, 'Nice design', '2025-05-04');

-- Final JOIN query
SELECT o.order_id,
       c.name AS customer_name,
       o.order_date,
       p.name AS product_name,
       oi.quantity,
       oi.unit_price,
       (oi.quantity * oi.unit_price) AS line_total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_id;
