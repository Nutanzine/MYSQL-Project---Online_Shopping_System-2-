-- Project - "Online Shopping System"
-- The Project shows ER Diagram of system, Tables, Inserting data & Queries are solved by using MySQL
-- ER Diagram is drawn in Paint app

-- The ER diagram for the Online Shopping System consists of the following entities:
-- 1. Entities:
-- Customers: Represents the customers in the system.
/*Attributes:
customer_id (Primary Key)
first_name
last_name
email
phone*/

-- Products: Represents the products available for sale in the system.
/*Attributes:
product_id (Primary Key)
product_name
price
category*/

-- Orders: Represents the orders placed by customers.
/*Attributes:
order_id (Primary Key)
customer_id (Foreign Key referencing Customers)
order_date
total_amount*/

-- OrderItems: Represents the items within an order, linking products to orders.
/*Attributes:
order_item_id (Primary Key)
order_id (Foreign Key referencing Orders)
product_id (Foreign Key referencing Products)
quantity
price*/

-- Payments: Represents payments made for orders.
/*Attributes:
payment_id (Primary Key)
order_id (Foreign Key referencing Orders)
payment_date
amount
payment_method*/

Create database Online_Shopping_System5;
use Online_Shopping_System5;
show tables;

-- Creating a table for Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255)
);

select * from Customers;

-- Creating a table for Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT
);
select * from Products;

-- Creating a table for Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

select * from Orders;

-- Creating a table for OrderItems (links Products with Orders)
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

select * from OrderItems;

-- Creating a table for Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

select * from Payments;

/*Inserting Sample Data
Below are SQL statements to insert sample records.*/ 
INSERT INTO Customers (customer_id, first_name, last_name, email, phone_number, address) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St, Springfield, IL'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '123-456-7891', '456 Oak St, Springfield, IL'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '123-456-7892', '789 Pine St, Springfield, IL'),
(4, 'Emily', 'Williams', 'emily.williams@example.com', '123-456-7893', '101 Maple St, Springfield, IL'),
(5, 'Daniel', 'Brown', 'daniel.brown@example.com', '123-456-7894', '202 Birch St, Springfield, IL'),
(6, 'Olivia', 'Jones', 'olivia.jones@example.com', '123-456-7895', '303 Cedar St, Springfield, IL'),
(7, 'William', 'Garcia', 'william.garcia@example.com', '123-456-7896', '404 Willow St, Springfield, IL'),
(8, 'Sophia', 'Martinez', 'sophia.martinez@example.com', '123-456-7897', '505 Redwood St, Springfield, IL'),
(9, 'James', 'Hernandez', 'james.hernandez@example.com', '123-456-7898', '606 Pinehurst Ave, Springfield, IL'),
(10, 'Charlotte', 'Davis', 'charlotte.davis@example.com', '123-456-7899', '707 Cedarwood Dr, Springfield, IL'),
(11, 'Benjamin', 'Lopez', 'benjamin.lopez@example.com', '123-456-7900', '808 Cypress Ave, Springfield, IL'),
(12, 'Amelia', 'Wilson', 'amelia.wilson@example.com', '123-456-7901', '909 Magnolia St, Springfield, IL'),
(13, 'Henry', 'Miller', 'henry.miller@example.com', '123-456-7902', '1010 Chestnut St, Springfield, IL'),
(14, 'Evelyn', 'Moore', 'evelyn.moore@example.com', '123-456-7903', '1111 Oakwood Rd, Springfield, IL'),
(15, 'Alexander', 'Taylor', 'alexander.taylor@example.com', '123-456-7904', '1212 Maplewood St, Springfield, IL'),
(16, 'Isabella', 'Anderson', 'isabella.anderson@example.com', '123-456-7905', '1313 Pineview St, Springfield, IL'),
(17, 'Matthew', 'Thomas', 'matthew.thomas@example.com', '123-456-7906', '1414 Birchwood Ave, Springfield, IL'),
(18, 'Chloe', 'Jackson', 'chloe.jackson@example.com', '123-456-7907', '1515 Redwood Dr, Springfield, IL'),
(19, 'Aiden', 'White', 'aiden.white@example.com', '123-456-7908', '1616 Oakfield Rd, Springfield, IL'),
(20, 'Zoe', 'Harris', 'zoe.harris@example.com', '123-456-7909', '1717 Cedar Ridge St, Springfield, IL'),
(21, 'Liam', 'Clark', 'liam.clark@example.com', '123-456-7910', '1818 Maple Grove Ave, Springfield, IL'),
(22, 'Mia', 'Lewis', 'mia.lewis@example.com', '123-456-7911', '1919 Birch Grove Rd, Springfield, IL'),
(23, 'Noah', 'Roberts', 'noah.roberts@example.com', '123-456-7912', '2020 Pinehill Dr, Springfield, IL'),
(24, 'Ethan', 'Walker', 'ethan.walker@example.com', '123-456-7913', '2121 Willowbrook St, Springfield, IL'),
(25, 'Grace', 'Young', 'grace.young@example.com', '123-456-7914', '2222 Cedarview Ave, Springfield, IL'),
(26, 'Jack', 'Allen', 'jack.allen@example.com', '123-456-7915', '2323 Oakwood Ave, Springfield, IL'),
(27, 'Harper', 'Scott', 'harper.scott@example.com', '123-456-7916', '2424 Maple Ridge Rd, Springfield, IL'),
(28, 'Sebastian', 'King', 'sebastian.king@example.com', '123-456-7917', '2525 Birchwood Dr, Springfield, IL'),
(29, 'Ava', 'Wright', 'ava.wright@example.com', '123-456-7918', '2626 Pineview Ave, Springfield, IL'),
(30, 'Gabriel', 'Lopez', 'gabriel.lopez@example.com', '123-456-7919', '2727 Willow Rd, Springfield, IL'),
(31, 'Madison', 'Hill', 'madison.hill@example.com', '123-456-7920', '2828 Redwood Ln, Springfield, IL'),
(32, 'Daniel', 'Adams', 'daniel.adams@example.com', '123-456-7921', '2929 Maple Valley Rd, Springfield, IL'),
(33, 'Eleanor', 'Nelson', 'eleanor.nelson@example.com', '123-456-7922', '3030 Cedar Valley Ave, Springfield, IL'),
(34, 'Lucas', 'Carter', 'lucas.carter@example.com', '123-456-7923', '3131 Birch Ln, Springfield, IL'),
(35, 'Victoria', 'Mitchell', 'victoria.mitchell@example.com', '123-456-7924', '3232 Pine Hill Rd, Springfield, IL'),
(36, 'Leo', 'Perez', 'leo.perez@example.com', '123-456-7925', '3333 Oak Grove Dr, Springfield, IL'),
(37, 'Ella', 'Robinson', 'ella.robinson@example.com', '123-456-7926', '3434 Maplewood Ave, Springfield, IL'),
(38, 'Isaac', 'Gonzalez', 'isaac.gonzalez@example.com', '123-456-7927', '3535 Birchwood Rd, Springfield, IL'),
(39, 'Grace', 'Martinez', 'grace.martinez@example.com', '123-456-7928', '3636 Pinewood Rd, Springfield, IL'),
(40, 'Owen', 'Taylor', 'owen.taylor@example.com', '123-456-7929', '3737 Willowbrook Dr, Springfield, IL'),
(41, 'Lily', 'Moore', 'lily.moore@example.com', '123-456-7930', '3838 Cedar Grove Ave, Springfield, IL'),
(42, 'Cameron', 'Gomez', 'cameron.gomez@example.com', '123-456-7931', '3939 Maple St, Springfield, IL'),
(43, 'Ella', 'Evans', 'ella.evans@example.com', '123-456-7932', '4040 Oakwood Ln, Springfield, IL'),
(44, 'Ryan', 'Hall', 'ryan.hall@example.com', '123-456-7933', '4141 Birch Rd, Springfield, IL'),
(45, 'Madeline', 'Young', 'madeline.young@example.com', '123-456-7934', '4242 Pineview Ave, Springfield, IL'),
(46, 'Mason', 'Walker', 'mason.walker@example.com', '123-456-7935', '4343 Redwood Rd, Springfield, IL'),
(47, 'Henry', 'King', 'henry.king@example.com', '123-456-7936', '4444 Maplewood Dr, Springfield, IL'),
(48, 'Harper', 'Clark', 'harper.clark@example.com', '123-456-7937', '4545 Birchwood Ave, Springfield, IL'),
(49, 'Ella', 'Moore', 'ella.moore@example.com', '123-456-7938', '4646 Cedarwood St, Springfield, IL'),
(50, 'Samuel', 'Adams', 'samuel.adams@example.com', '123-456-7939', '4747 Pine Ridge Rd, Springfield, IL');

INSERT INTO Products (product_id, product_name, description, price, stock_quantity) VALUES
(1, 'Laptop', '15-inch laptop with Intel i7 processor', 999.99, 50),
(2, 'Smartphone', '5G smartphone with 128GB storage', 699.99, 100),
(3, 'Headphones', 'Noise-canceling wireless headphones', 199.99, 150),
(4, 'Smartwatch', 'Fitness tracker with heart rate monitor', 149.99, 80),
(5, 'Tablet', '10-inch Android tablet with stylus', 249.99, 70),
(6, 'Bluetooth Speaker', 'Portable Bluetooth speaker with bass boost', 59.99, 120),
(7, 'Keyboard', 'Mechanical keyboard with RGB lighting', 89.99, 200),
(8, 'Mouse', 'Wireless optical mouse', 19.99, 300),
(9, 'Webcam', '1080p HD webcam with built-in microphone', 79.99, 60),
(10, 'Monitor', '24-inch Full HD LED monitor', 129.99, 40),
(11, 'Printer', 'All-in-one inkjet printer', 99.99, 50),
(12, 'Charger', 'Fast charging USB-C charger', 29.99, 150),
(13, 'External Hard Drive', '1TB portable external hard drive', 69.99, 100),
(14, 'USB Flash Drive', '64GB USB 3.0 flash drive', 15.99, 200),
(15, 'Gaming Mouse', 'Ergonomic gaming mouse with customizable buttons', 49.99, 80),
(16, 'Graphics Card', 'NVIDIA GeForce RTX 3060 graphics card', 399.99, 30),
(17, 'Motherboard', 'ATX motherboard with Intel chipset', 129.99, 20),
(18, 'CPU', 'Intel Core i5 processor', 249.99, 60),
(19, 'RAM', '16GB DDR4 RAM', 79.99, 90),
(20, 'SSD', '500GB solid state drive', 69.99, 110),
(21, 'Power Supply', '750W power supply unit', 89.99, 50),
(22, 'Laptop Bag', 'Stylish laptop bag for 15-inch laptops', 39.99, 60),
(23, 'Phone Case', 'Durable silicone phone case for iPhone', 19.99, 200),
(24, 'Screen Protector', 'Tempered glass screen protector for smartphones', 9.99, 250),
(25, 'Camera', 'DSLR camera with 24MP sensor', 549.99, 40),
(26, 'Tripod', 'Adjustable tripod for cameras and smartphones', 29.99, 80),
(27, 'Drone', 'Quadcopter drone with 4K camera', 799.99, 30),
(28, 'Action Camera', 'GoPro-style action camera with waterproof casing', 149.99, 50),
(29, 'Electric Scooter', 'Foldable electric scooter with 15-mile range', 399.99, 25),
(30, 'Vacuum Cleaner', 'Cordless vacuum cleaner with HEPA filter', 199.99, 60),
(31, 'Coffee Maker', 'Single-serve coffee maker with brew strength control', 49.99, 100),
(32, 'Air Fryer', '5-liter air fryer with digital controls', 89.99, 75),
(33, 'Microwave', '1000W microwave with touch control panel', 79.99, 50),
(34, 'Blender', 'High-speed blender for smoothies and shakes', 59.99, 120),
(35, 'Electric Kettle', '1.7L electric kettle with boil-dry protection', 29.99, 150),
(36, 'Juicer', 'Citrus juicer with automatic shut-off', 39.99, 90),
(37, 'Toaster', '4-slice toaster with adjustable browning', 39.99, 80),
(38, 'Dishwasher', 'Compact countertop dishwasher', 349.99, 20),
(39, 'Refrigerator', 'Energy-efficient fridge with dual freezer compartments', 799.99, 15),
(40, 'Washing Machine', 'Front-load washing machine with 5kg capacity', 399.99, 25),
(41, 'Fan', 'Oscillating tower fan with remote control', 49.99, 100),
(42, 'Heater', 'Portable space heater with adjustable thermostat', 59.99, 90),
(43, 'Dehumidifier', 'Compact dehumidifier for rooms up to 500 sq ft', 99.99, 70),
(44, 'Humidifier', 'Ultrasonic humidifier with night light feature', 39.99, 120),
(45, 'Air Purifier', 'HEPA air purifier with three-stage filtration', 129.99, 50),
(46, 'Smart Light Bulb', 'Wi-Fi enabled LED light bulb with app control', 19.99, 150),
(47, 'Smart Plug', 'Wi-Fi enabled smart plug for home automation', 24.99, 200),
(48, 'Security Camera', 'Wireless security camera with motion detection', 129.99, 40),
(49, 'Smart Thermostat', 'Programmable smart thermostat with app control', 149.99, 30),
(50, 'Robot Vacuum', 'Robotic vacuum cleaner with automatic charging', 299.99, 20);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2024-12-01', 1099.98),
(2, 2, '2024-12-02', 1199.99),
(3, 3, '2024-12-02', 899.97),
(4, 4, '2024-12-03', 499.99),
(5, 5, '2024-12-04', 799.99),
(6, 6, '2024-12-05', 399.98),
(7, 7, '2024-12-06', 599.98),
(8, 8, '2024-12-07', 149.99),
(9, 9, '2024-12-08', 199.99),
(10, 10, '2024-12-09', 1299.99),
(11, 11, '2024-12-09', 259.98),
(12, 12, '2024-12-10', 999.99),
(13, 13, '2024-12-11', 549.99),
(14, 14, '2024-12-11', 349.99),
(15, 15, '2024-12-12', 89.99),
(16, 16, '2024-12-12', 179.99),
(17, 17, '2024-12-13', 399.99),
(18, 18, '2024-12-13', 149.99),
(19, 19, '2024-12-14', 249.99),
(20, 20, '2024-12-14', 199.99),
(21, 21, '2024-12-15', 79.99),
(22, 22, '2024-12-16', 99.99),
(23, 23, '2024-12-16', 599.99),
(24, 24, '2024-12-17', 799.99),
(25, 25, '2024-12-18', 399.99),
(26, 26, '2024-12-18', 199.99),
(27, 27, '2024-12-19', 1299.99),
(28, 28, '2024-12-19', 89.99),
(29, 29, '2024-12-20', 249.99),
(30, 30, '2024-12-20', 599.99),
(31, 31, '2024-12-21', 149.99),
(32, 32, '2024-12-22', 199.99),
(33, 33, '2024-12-22', 799.99),
(34, 34, '2024-12-23', 499.99),
(35, 35, '2024-12-23', 59.99),
(36, 36, '2024-12-24', 69.99),
(37, 37, '2024-12-25', 79.99),
(38, 38, '2024-12-25', 599.99),
(39, 39, '2024-12-26', 399.99),
(40, 40, '2024-12-26', 49.99),
(41, 41, '2024-12-27', 149.99),
(42, 42, '2024-12-27', 129.99),
(43, 43, '2024-12-28', 199.99),
(44, 44, '2024-12-28', 99.99),
(45, 45, '2024-12-29', 249.99),
(46, 46, '2024-12-29', 159.99),
(47, 47, '2024-12-30', 349.99),
(48, 48, '2024-12-30', 129.99),
(49, 49, '2024-12-31', 799.99),
(50, 50, '2024-12-31', 599.99);

INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1, 999.99),
(2, 1, 2, 1, 99.99),
(3, 2, 3, 2, 99.99),
(4, 2, 5, 1, 249.99),
(5, 3, 4, 1, 149.99),
(6, 3, 7, 1, 89.99),
(7, 4, 6, 1, 59.99),
(8, 4, 10, 1, 129.99),
(9, 5, 2, 2, 99.99),
(10, 5, 3, 1, 199.99),
(11, 6, 8, 1, 19.99),
(12, 6, 9, 1, 79.99),
(13, 7, 2, 3, 99.99),
(14, 7, 11, 1, 99.99),
(15, 8, 5, 1, 249.99),
(16, 8, 4, 1, 149.99),
(17, 9, 6, 2, 59.99),
(18, 9, 7, 1, 89.99),
(19, 10, 8, 1, 19.99),
(20, 10, 12, 1, 79.99),
(21, 11, 1, 2, 999.99),
(22, 11, 13, 1, 69.99),
(23, 12, 14, 1, 79.99),
(24, 12, 4, 1, 149.99),
(25, 13, 3, 1, 199.99),
(26, 13, 2, 2, 99.99),
(27, 14, 6, 1, 59.99),
(28, 14, 5, 1, 249.99),
(29, 15, 2, 1, 99.99),
(30, 15, 16, 1, 49.99),
(31, 16, 7, 1, 89.99),
(32, 16, 15, 1, 49.99),
(33, 17, 17, 1, 399.99),
(34, 17, 18, 1, 129.99),
(35, 18, 13, 1, 69.99),
(36, 18, 14, 1, 79.99),
(37, 19, 3, 1, 199.99),
(38, 19, 8, 1, 19.99),
(39, 20, 2, 1, 99.99),
(40, 20, 4, 1, 149.99),
(41, 21, 5, 1, 249.99),
(42, 21, 12, 1, 79.99),
(43, 22, 6, 1, 59.99),
(44, 22, 9, 1, 79.99),
(45, 23, 1, 1, 999.99),
(46, 23, 17, 1, 399.99),
(47, 24, 7, 1, 89.99),
(48, 24, 8, 1, 19.99),
(49, 25, 10, 1, 129.99),
(50, 25, 16, 1, 49.99);

INSERT INTO Payments (payment_id, order_id, payment_date, amount, payment_method) VALUES
(1, 1, '2024-12-01', 1099.98, 'Credit Card'),
(2, 2, '2024-12-02', 1199.99, 'PayPal'),
(3, 3, '2024-12-02', 899.97, 'Debit Card'),
(4, 4, '2024-12-03', 499.99, 'Credit Card'),
(5, 5, '2024-12-04', 799.99, 'Credit Card'),
(6, 6, '2024-12-05', 399.98, 'PayPal'),
(7, 7, '2024-12-06', 599.98, 'Debit Card'),
(8, 8, '2024-12-07', 149.99, 'Credit Card'),
(9, 9, '2024-12-08', 199.99, 'PayPal'),
(10, 10, '2024-12-09', 1299.99, 'Debit Card'),
(11, 11, '2024-12-09', 259.98, 'Credit Card'),
(12, 12, '2024-12-10', 999.99, 'PayPal'),
(13, 13, '2024-12-11', 549.99, 'Credit Card'),
(14, 14, '2024-12-11', 349.99, 'Debit Card'),
(15, 15, '2024-12-12', 89.99, 'PayPal'),
(16, 16, '2024-12-12', 179.99, 'Credit Card'),
(17, 17, '2024-12-13', 399.99, 'Debit Card'),
(18, 18, '2024-12-13', 149.99, 'PayPal'),
(19, 19, '2024-12-14', 249.99, 'Credit Card'),
(20, 20, '2024-12-14', 199.99, 'PayPal'),
(21, 21, '2024-12-15', 79.99, 'Debit Card'),
(22, 22, '2024-12-16', 99.99, 'Credit Card'),
(23, 23, '2024-12-16', 599.99, 'PayPal'),
(24, 24, '2024-12-17', 799.99, 'Credit Card'),
(25, 25, '2024-12-18', 399.99, 'Debit Card'),
(26, 26, '2024-12-18', 199.99, 'PayPal'),
(27, 27, '2024-12-19', 1299.99, 'Credit Card'),
(28, 28, '2024-12-19', 89.99, 'Debit Card'),
(29, 29, '2024-12-20', 249.99, 'PayPal'),
(30, 30, '2024-12-20', 599.99, 'Credit Card'),
(31, 31, '2024-12-21', 149.99, 'PayPal'),
(32, 32, '2024-12-22', 199.99, 'Credit Card'),
(33, 33, '2024-12-22', 799.99, 'Debit Card'),
(34, 34, '2024-12-23', 499.99, 'PayPal'),
(35, 35, '2024-12-23', 59.99, 'Credit Card'),
(36, 36, '2024-12-24', 69.99, 'Debit Card'),
(37, 37, '2024-12-25', 79.99, 'PayPal'),
(38, 38, '2024-12-25', 599.99, 'Credit Card'),
(39, 39, '2024-12-26', 399.99, 'Debit Card'),
(40, 40, '2024-12-26', 49.99, 'PayPal'),
(41, 41, '2024-12-27', 149.99, 'Credit Card'),
(42, 42, '2024-12-27', 129.99, 'PayPal'),
(43, 43, '2024-12-28', 199.99, 'Debit Card'),
(44, 44, '2024-12-28', 99.99, 'Credit Card'),
(45, 45, '2024-12-29', 249.99, 'PayPal'),
(46, 46, '2024-12-29', 159.99, 'Debit Card'),
(47, 47, '2024-12-30', 349.99, 'Credit Card'),
(48, 48, '2024-12-30', 129.99, 'PayPal'),
(49, 49, '2024-12-31', 799.99, 'Debit Card'),
(50, 50, '2024-12-31', 599.99, 'Credit Card');

/*SQL Queries
Here are 24 sample SQL queries that can use to extract information from this system.*/
-- 1. Simple SELECT Query
SELECT * FROM Customers;

-- 2. SELECT Specific Columns
SELECT customer_id, first_name, last_name FROM Customers;

-- 3. WHERE Clause for Filtering
SELECT * FROM Products WHERE price > 100;

-- 4. AND/OR Conditions in WHERE
SELECT * FROM Orders WHERE total_amount > 500 AND order_date > '2024-12-01';

-- 5. ORDER BY Clause
SELECT * FROM Products ORDER BY price DESC;

-- 6. DISTINCT Keyword
SELECT DISTINCT payment_method FROM Payments;

-- 7. COUNT Function
SELECT COUNT(*) FROM Orders WHERE order_date = '2024-12-01';

-- 8. SUM Function
SELECT SUM(total_amount) FROM Orders;

-- 9. GROUP BY Clause
SELECT customer_id, COUNT(order_id) FROM Orders GROUP BY customer_id;

-- 10. JOIN - INNER JOIN
SELECT o.order_id, c.first_name, c.last_name
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

-- 11. LEFT JOIN
SELECT o.order_id, c.first_name, c.last_name
FROM Orders o
LEFT JOIN Customers c ON o.customer_id = c.customer_id;

-- 12. RIGHT JOIN
SELECT o.order_id, c.first_name, c.last_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;

-- 13. SELECT with LIKE
SELECT * FROM Products WHERE product_name LIKE '%phone%';

-- 14. SELECT with IN
SELECT * FROM Products WHERE product_id IN (1, 2, 5, 8);

-- 15. UPDATE Statement
UPDATE Customers SET email = 'newemail@example.com' WHERE customer_id = 3;

-- 16. LIMIT Clause
SELECT * FROM Orders LIMIT 5;

-- 17. BETWEEN Operator
SELECT * FROM Orders WHERE order_date BETWEEN '2024-12-01' AND '2024-12-15';

-- 18. Subquery
SELECT first_name, last_name FROM Customers
WHERE customer_id IN (SELECT customer_id FROM Orders WHERE total_amount > 500);

-- 19. SELECT with NOT IN
SELECT * FROM Products WHERE product_id NOT IN (1, 2, 3, 4);

-- 20. Using NULL with IS NULL
SELECT * FROM Customers WHERE email IS NULL;

-- 21. CASE Statement
SELECT order_id, 
       CASE 
           WHEN total_amount > 1000 THEN 'High'
           WHEN total_amount BETWEEN 500 AND 1000 THEN 'Medium'
           ELSE 'Low'
       END AS order_value
FROM Orders;

-- 22. Alias for Tables
SELECT o.order_id, c.first_name, p.product_name 
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- 23. UNION
SELECT product_name FROM Products WHERE price < 100
UNION
SELECT product_name FROM Products WHERE price > 1000;

-- 24. EXISTS Subquery
SELECT customer_id, first_name, last_name
FROM Customers
WHERE EXISTS (SELECT * FROM Orders WHERE Orders.customer_id = Customers.customer_id);

-- This setup provides a comprehensive base for an online shopping system, with ER diagrams, tables, data insertions, and a wide range of queries. 

