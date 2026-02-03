-- Creation of the Database
CREATE DATABASE DashDine_DB;

USE DashDine_DB;


-- Creation of Tables


-- Creation of Customer Table

-- Customer Table stores customer profile information
CREATE TABLE customers(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Creation of Addresses Table
-- Addresses table holds customer addresses, customer can have multiple delivery addresses.

CREATE TABLE addresses(
	address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    street VARCHAR(150),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Creation of Restaurant
-- Stores Restaurant information

CREATE TABLE restaurants(
	restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE
);


-- Creation of Menu_items
-- Menu_Items table stores each restaurant  menu items.

CREATE TABLE menu_items(
	item_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT,
    item_name VARCHAR(100),
    price DECIMAL(8,2),
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Creation of Orders Table
--  Orders Table - Tracks each customer order.

CREATE TABLE orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Creation of order_items
-- Line items per order

CREATE TABLE order_items(
	order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    item_price DECIMAL(8,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

-- Creation of drivers table
-- Delivery driver information

CREATE TABLE drivers(
	driver_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    vehicle_type VARCHAR(30)
);

-- Creation of Deliveries Table
-- Assign drivers to orders

CREATE TABLE deliveries(
	delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    driver_id INT,
    pickup_time  DATETIME,
    delivery_time DATETIME,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);



-- Creation of Payments table
-- Tracks payment details

CREATE TABLE payments(
	payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    paid_amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);



-- Insertion of Dummy Data



-- DashDine Dummy Data Insert Statements
-- Food Delivery Application Sample Data



-- 1. INSERT CUSTOMERS (20 customers)

INSERT INTO customers (first_name, last_name, email, phone) VALUES
('Emily', 'Johnson', 'emily.johnson@email.com', '555-0101'),
('Michael', 'Chen', 'michael.chen@email.com', '555-0102'),
('Sarah', 'Williams', 'sarah.williams@email.com', '555-0103'),
('David', 'Brown', 'david.brown@email.com', '555-0104'),
('Jessica', 'Martinez', 'jessica.martinez@email.com', '555-0105'),
('James', 'Anderson', 'james.anderson@email.com', '555-0106'),
('Maria', 'Garcia', 'maria.garcia@email.com', '555-0107'),
('Robert', 'Taylor', 'robert.taylor@email.com', '555-0108'),
('Linda', 'Moore', 'linda.moore@email.com', '555-0109'),
('Christopher', 'Lee', 'christopher.lee@email.com', '555-0110'),
('Amanda', 'Wilson', 'amanda.wilson@email.com', '555-0111'),
('Daniel', 'Harris', 'daniel.harris@email.com', '555-0112'),
('Michelle', 'Clark', 'michelle.clark@email.com', '555-0113'),
('Matthew', 'Lewis', 'matthew.lewis@email.com', '555-0114'),
('Jennifer', 'Walker', 'jennifer.walker@email.com', '555-0115'),
('Joshua', 'Hall', 'joshua.hall@email.com', '555-0116'),
('Ashley', 'Allen', 'ashley.allen@email.com', '555-0117'),
('Andrew', 'Young', 'andrew.young@email.com', '555-0118'),
('Stephanie', 'King', 'stephanie.king@email.com', '555-0119'),
('Ryan', 'Wright', 'ryan.wright@email.com', '555-0120');


-- 2. INSERT ADDRESSES (30 addresses - some customers have multiple)

INSERT INTO addresses (customer_id, street, city, state, zip_code) VALUES
(1, '123 Maple Street', 'Boston', 'MA', '02101'),
(1, '456 Oak Avenue', 'Boston', 'MA', '02102'),
(2, '789 Pine Road', 'Cambridge', 'MA', '02138'),
(3, '321 Elm Drive', 'Somerville', 'MA', '02143'),
(4, '654 Birch Lane', 'Boston', 'MA', '02115'),
(5, '987 Cedar Court', 'Brookline', 'MA', '02446'),
(6, '147 Willow Way', 'Cambridge', 'MA', '02139'),
(7, '258 Ash Street', 'Boston', 'MA', '02116'),
(8, '369 Spruce Avenue', 'Somerville', 'MA', '02144'),
(9, '741 Walnut Road', 'Boston', 'MA', '02118'),
(10, '852 Cherry Lane', 'Cambridge', 'MA', '02140'),
(11, '963 Poplar Drive', 'Brookline', 'MA', '02445'),
(12, '159 Magnolia Street', 'Boston', 'MA', '02119'),
(13, '267 Sycamore Court', 'Somerville', 'MA', '02145'),
(14, '378 Hickory Way', 'Cambridge', 'MA', '02141'),
(15, '489 Dogwood Avenue', 'Boston', 'MA', '02120'),
(16, '591 Beech Road', 'Brookline', 'MA', '02467'),
(17, '612 Redwood Lane', 'Cambridge', 'MA', '02142'),
(18, '723 Fir Drive', 'Boston', 'MA', '02121'),
(19, '834 Cypress Street', 'Somerville', 'MA', '02146'),
(20, '945 Juniper Court', 'Boston', 'MA', '02122'),
(2, '112 Business Park', 'Cambridge', 'MA', '02138'),
(3, '223 University Ave', 'Somerville', 'MA', '02143'),
(5, '334 Downtown Plaza', 'Brookline', 'MA', '02446'),
(7, '445 Harbor View', 'Boston', 'MA', '02116'),
(10, '556 Tech Center', 'Cambridge', 'MA', '02140'),
(12, '667 Medical District', 'Boston', 'MA', '02119'),
(15, '778 Financial Row', 'Boston', 'MA', '02120'),
(17, '889 Student Housing', 'Cambridge', 'MA', '02142'),
(19, '990 Artist Loft', 'Somerville', 'MA', '02146');


-- 3. INSERT RESTAURANTS (15 restaurants)

INSERT INTO restaurants (restaurant_name, city, is_active) VALUES
('Pizza Paradise', 'Boston', TRUE),
('Burger Haven', 'Cambridge', TRUE),
('Sushi Central', 'Somerville', TRUE),
('Taco Express', 'Boston', TRUE),
('Pasta Palace', 'Brookline', TRUE),
('Thai Kitchen', 'Cambridge', TRUE),
('Dragon Wok', 'Boston', TRUE),
('Mediterranean Grill', 'Somerville', TRUE),
('Breakfast Club', 'Boston', TRUE),
('Veggie Delight', 'Cambridge', TRUE),
('BBQ Masters', 'Brookline', TRUE),
('Indian Spice', 'Boston', TRUE),
('Sandwich Station', 'Cambridge', TRUE),
('Healthy Bowls', 'Somerville', TRUE),
('Dessert Dreams', 'Boston', TRUE);


-- 4. INSERT MENU ITEMS (60+ items across all restaurants)


-- Pizza Paradise (restaurant_id = 1)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(1, 'Margherita Pizza', 12.99, TRUE),
(1, 'Pepperoni Pizza', 14.99, TRUE),
(1, 'Vegetarian Pizza', 13.99, TRUE),
(1, 'BBQ Chicken Pizza', 15.99, TRUE),
(1, 'Garlic Bread', 5.99, TRUE);

-- Burger Haven (restaurant_id = 2)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(2, 'Classic Cheeseburger', 9.99, TRUE),
(2, 'Bacon Burger', 11.99, TRUE),
(2, 'Veggie Burger', 10.99, TRUE),
(2, 'Double Burger', 13.99, TRUE),
(2, 'French Fries', 4.99, TRUE),
(2, 'Onion Rings', 5.99, TRUE);

-- Sushi Central (restaurant_id = 3)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(3, 'California Roll', 8.99, TRUE),
(3, 'Spicy Tuna Roll', 10.99, TRUE),
(3, 'Salmon Nigiri Set', 14.99, TRUE),
(3, 'Tempura Shrimp Roll', 11.99, TRUE),
(3, 'Miso Soup', 3.99, TRUE);

-- Taco Express (restaurant_id = 4)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(4, 'Chicken Tacos (3)', 8.99, TRUE),
(4, 'Beef Burrito', 10.99, TRUE),
(4, 'Fish Tacos (3)', 9.99, TRUE),
(4, 'Quesadilla', 7.99, TRUE),
(4, 'Nachos Supreme', 11.99, TRUE),
(4, 'Guacamole & Chips', 6.99, TRUE);

-- Pasta Palace (restaurant_id = 5)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(5, 'Spaghetti Carbonara', 13.99, TRUE),
(5, 'Fettuccine Alfredo', 12.99, TRUE),
(5, 'Lasagna', 14.99, TRUE),
(5, 'Penne Arrabbiata', 11.99, TRUE),
(5, 'Caesar Salad', 7.99, TRUE);

-- Thai Kitchen (restaurant_id = 6)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(6, 'Pad Thai', 12.99, TRUE),
(6, 'Green Curry', 13.99, TRUE),
(6, 'Tom Yum Soup', 9.99, TRUE),
(6, 'Spring Rolls (4)', 6.99, TRUE),
(6, 'Mango Sticky Rice', 7.99, TRUE);

-- Dragon Wok (restaurant_id = 7)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(7, 'Kung Pao Chicken', 11.99, TRUE),
(7, 'Sweet and Sour Pork', 12.99, TRUE),
(7, 'Beef with Broccoli', 13.99, TRUE),
(7, 'Vegetable Lo Mein', 10.99, TRUE),
(7, 'Fried Rice', 8.99, TRUE);

-- Mediterranean Grill (restaurant_id = 8)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(8, 'Chicken Shawarma Plate', 13.99, TRUE),
(8, 'Falafel Wrap', 9.99, TRUE),
(8, 'Lamb Kebab Plate', 16.99, TRUE),
(8, 'Hummus & Pita', 6.99, TRUE),
(8, 'Greek Salad', 8.99, TRUE);

-- Breakfast Club (restaurant_id = 9)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(9, 'Pancake Stack', 8.99, TRUE),
(9, 'Classic Breakfast', 10.99, TRUE),
(9, 'Avocado Toast', 9.99, TRUE),
(9, 'Breakfast Burrito', 11.99, TRUE),
(9, 'French Toast', 9.99, TRUE);

-- Veggie Delight (restaurant_id = 10)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(10, 'Buddha Bowl', 11.99, TRUE),
(10, 'Quinoa Salad', 10.99, TRUE),
(10, 'Vegan Burger', 12.99, TRUE),
(10, 'Smoothie Bowl', 9.99, TRUE);

-- BBQ Masters (restaurant_id = 11)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(11, 'Pulled Pork Sandwich', 12.99, TRUE),
(11, 'Ribs Platter', 18.99, TRUE),
(11, 'Brisket Plate', 16.99, TRUE),
(11, 'BBQ Wings', 10.99, TRUE);

-- Indian Spice (restaurant_id = 12)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(12, 'Chicken Tikka Masala', 13.99, TRUE),
(12, 'Butter Chicken', 13.99, TRUE),
(12, 'Vegetable Biryani', 11.99, TRUE),
(12, 'Naan Bread', 2.99, TRUE);

-- Sandwich Station (restaurant_id = 13)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(13, 'Turkey Club', 9.99, TRUE),
(13, 'Italian Sub', 10.99, TRUE),
(13, 'Grilled Cheese', 7.99, TRUE),
(13, 'BLT', 8.99, TRUE);

-- Healthy Bowls (restaurant_id = 14)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(14, 'Poke Bowl', 13.99, TRUE),
(14, 'Acai Bowl', 10.99, TRUE),
(14, 'Grain Bowl', 11.99, TRUE);

-- Dessert Dreams (restaurant_id = 15)
INSERT INTO menu_items (restaurant_id, item_name, price, is_available) VALUES
(15, 'Chocolate Cake', 6.99, TRUE),
(15, 'Ice Cream Sundae', 7.99, TRUE),
(15, 'Cheesecake', 7.99, TRUE),
(15, 'Brownie Delight', 5.99, TRUE);


-- 5. INSERT DRIVERS (12 drivers)

INSERT INTO drivers (first_name, last_name, phone, vehicle_type) VALUES
('Alex', 'Thompson', '555-0201', 'Car'),
('Brianna', 'Rodriguez', '555-0202', 'Bike'),
('Carlos', 'Nguyen', '555-0203', 'Scooter'),
('Diana', 'Patel', '555-0204', 'Car'),
('Ethan', 'Kim', '555-0205', 'Bike'),
('Fiona', 'Davis', '555-0206', 'Car'),
('Gabriel', 'Silva', '555-0207', 'Scooter'),
('Hannah', 'Murphy', '555-0208', 'Car'),
('Isaac', 'Cohen', '555-0209', 'Bike'),
('Julia', 'Santos', '555-0210', 'Car'),
('Kevin', 'O''Brien', '555-0211', 'Scooter'),
('Lauren', 'Mitchell', '555-0212', 'Car');


-- 6. INSERT ORDERS (40 orders with realistic dates)

INSERT INTO orders (customer_id, restaurant_id, order_date, status, total_amount) VALUES
(1, 1, '2024-01-15 18:30:00', 'Delivered', 28.98),
(2, 2, '2024-01-15 19:15:00', 'Delivered', 21.98),
(3, 3, '2024-01-16 12:45:00', 'Delivered', 33.96),
(4, 4, '2024-01-16 20:00:00', 'Delivered', 27.97),
(5, 5, '2024-01-17 19:30:00', 'Delivered', 26.98),
(6, 6, '2024-01-17 18:00:00', 'Delivered', 32.97),
(7, 7, '2024-01-18 17:45:00', 'Delivered', 24.98),
(8, 8, '2024-01-18 20:30:00', 'Delivered', 30.97),
(9, 9, '2024-01-19 09:00:00', 'Delivered', 20.98),
(10, 10, '2024-01-19 12:30:00', 'Delivered', 22.98),
(11, 11, '2024-01-20 18:15:00', 'Delivered', 35.97),
(12, 12, '2024-01-20 19:45:00', 'Delivered', 29.97),
(13, 13, '2024-01-21 13:00:00', 'Delivered', 18.98),
(14, 14, '2024-01-21 12:00:00', 'Delivered', 25.98),
(15, 15, '2024-01-22 16:30:00', 'Delivered', 14.98),
(16, 1, '2024-01-22 19:00:00', 'Delivered', 27.98),
(17, 2, '2024-01-23 20:15:00', 'Delivered', 23.98),
(18, 3, '2024-01-23 18:45:00', 'Delivered', 19.98),
(19, 4, '2024-01-24 19:30:00', 'Delivered', 29.96),
(20, 5, '2024-01-24 17:00:00', 'Delivered', 27.98),
(1, 6, '2024-01-25 18:30:00', 'Delivered', 26.98),
(2, 7, '2024-01-25 20:00:00', 'Delivered', 21.98),
(3, 8, '2024-01-26 19:15:00', 'Delivered', 23.98),
(4, 9, '2024-01-26 09:30:00', 'Delivered', 19.98),
(5, 10, '2024-01-27 12:45:00', 'Delivered', 34.97),
(6, 1, '2024-01-27 18:00:00', 'Delivered', 32.97),
(7, 2, '2024-01-28 19:30:00', 'Delivered', 26.97),
(8, 3, '2024-01-28 20:15:00', 'Delivered', 36.96),
(9, 4, '2024-01-29 18:45:00', 'Delivered', 24.97),
(10, 5, '2024-01-29 19:00:00', 'Delivered', 26.98),
(11, 6, '2024-01-30 17:30:00', 'In Transit', 19.98),
(12, 7, '2024-01-30 18:15:00', 'In Transit', 24.98),
(13, 8, '2024-01-31 12:00:00', 'Preparing', 30.97),
(14, 9, '2024-01-31 10:30:00', 'Preparing', 29.97),
(15, 10, '2024-02-01 13:15:00', 'Preparing', 22.98),
(16, 11, '2024-02-01 19:00:00', 'Pending', 29.98),
(17, 12, '2024-02-02 18:30:00', 'Pending', 27.97),
(18, 13, '2024-02-02 12:45:00', 'Pending', 19.98),
(19, 14, '2024-02-03 11:30:00', 'Pending', 24.98),
(20, 15, '2024-02-03 15:00:00', 'Pending', 13.98);


-- 7. INSERT ORDER ITEMS (90+ line items)


-- Order 1 (customer 1, Pizza Paradise)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(1, 1, 2, 12.99),
(1, 5, 1, 5.99);

-- Order 2 (customer 2, Burger Haven)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(2, 6, 2, 9.99),
(2, 10, 1, 4.99);

-- Order 3 (customer 3, Sushi Central)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(3, 12, 2, 8.99),
(3, 13, 1, 10.99),
(3, 16, 1, 3.99);

-- Order 4 (customer 4, Taco Express)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(4, 17, 2, 8.99),
(4, 22, 1, 6.99);

-- Order 5 (customer 5, Pasta Palace)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(5, 23, 1, 13.99),
(5, 24, 1, 12.99);

-- Order 6 (customer 6, Thai Kitchen)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(6, 28, 2, 12.99),
(6, 30, 1, 6.99);

-- Order 7 (customer 7, Dragon Wok)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(7, 33, 1, 11.99),
(7, 35, 1, 13.99);

-- Order 8 (customer 8, Mediterranean Grill)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(8, 38, 1, 13.99),
(8, 40, 1, 16.99);

-- Order 9 (customer 9, Breakfast Club)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(9, 43, 1, 8.99),
(9, 45, 1, 11.99);

-- Order 10 (customer 10, Veggie Delight)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(10, 48, 1, 11.99),
(10, 49, 1, 10.99);

-- Order 11 (customer 11, BBQ Masters)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(11, 52, 1, 12.99),
(11, 53, 1, 18.99),
(11, 55, 1, 10.99);

-- Order 12 (customer 12, Indian Spice)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(12, 56, 2, 13.99),
(12, 59, 1, 2.99);

-- Order 13 (customer 13, Sandwich Station)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(13, 60, 1, 9.99),
(13, 61, 1, 8.99);

-- Order 14 (customer 14, Healthy Bowls)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(14, 64, 1, 13.99),
(14, 66, 1, 11.99);

-- Order 15 (customer 15, Dessert Dreams)
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(15, 67, 2, 6.99);

-- Order 16
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(16, 2, 1, 14.99),
(16, 3, 1, 13.99);

-- Order 17
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(17, 7, 1, 11.99),
(17, 11, 1, 5.99);

-- Order 18
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(18, 14, 1, 11.99),
(18, 12, 1, 8.99);

-- Order 19
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(19, 18, 2, 10.99),
(19, 20, 1, 7.99);

-- Order 20
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(20, 25, 1, 14.99),
(20, 27, 1, 7.99);

-- Order 21
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(21, 29, 1, 13.99),
(21, 31, 1, 7.99);

-- Order 22
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(22, 34, 1, 12.99),
(22, 37, 1, 8.99);

-- Order 23
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(23, 39, 1, 9.99),
(23, 41, 1, 6.99),
(23, 42, 1, 8.99);

-- Order 24
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(24, 44, 1, 10.99),
(24, 46, 1, 9.99);

-- Order 25
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(25, 48, 1, 11.99),
(25, 50, 1, 12.99),
(25, 51, 1, 9.99);

-- Order 26
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(26, 1, 2, 12.99),
(26, 4, 1, 15.99);

-- Order 27
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(27, 8, 1, 10.99),
(27, 9, 1, 13.99);

-- Order 28
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(28, 15, 2, 14.99),
(28, 16, 1, 3.99);

-- Order 29
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(29, 19, 2, 9.99),
(29, 22, 1, 6.99);

-- Order 30
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(30, 24, 1, 12.99),
(30, 26, 1, 11.99);

-- Order 31
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(31, 28, 1, 12.99),
(31, 32, 1, 7.99);

-- Order 32
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(32, 33, 1, 11.99),
(32, 36, 1, 10.99);

-- Order 33
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(33, 38, 1, 13.99),
(33, 40, 1, 16.99);

-- Order 34
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(34, 43, 2, 8.99),
(34, 47, 1, 9.99);

-- Order 35
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(35, 49, 1, 10.99),
(35, 51, 1, 9.99);

-- Order 36
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(36, 53, 1, 18.99),
(36, 54, 1, 16.99);

-- Order 37
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(37, 57, 1, 13.99),
(37, 58, 1, 11.99),
(37, 59, 1, 2.99);

-- Order 38
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(38, 62, 1, 7.99),
(38, 63, 1, 8.99);

-- Order 39
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(39, 65, 1, 10.99),
(39, 66, 1, 11.99);

-- Order 40
INSERT INTO order_items (order_id, item_id, quantity, item_price) VALUES
(40, 68, 1, 7.99),
(40, 69, 1, 7.99);


-- 8. INSERT DELIVERIES (38 deliveries - some orders pending/preparing)

INSERT INTO deliveries (order_id, driver_id, pickup_time, delivery_time) VALUES
(1, 1, '2024-01-15 18:45:00', '2024-01-15 19:15:00'),
(2, 2, '2024-01-15 19:30:00', '2024-01-15 19:55:00'),
(3, 3, '2024-01-16 13:00:00', '2024-01-16 13:35:00'),
(4, 4, '2024-01-16 20:15:00', '2024-01-16 20:45:00'),
(5, 5, '2024-01-17 19:45:00', '2024-01-17 20:20:00'),
(6, 6, '2024-01-17 18:15:00', '2024-01-17 18:50:00'),
(7, 7, '2024-01-18 18:00:00', '2024-01-18 18:30:00'),
(8, 8, '2024-01-18 20:45:00', '2024-01-18 21:20:00'),
(9, 9, '2024-01-19 09:15:00', '2024-01-19 09:45:00'),
(10, 10, '2024-01-19 12:45:00', '2024-01-19 13:15:00'),
(11, 11, '2024-01-20 18:30:00', '2024-01-20 19:05:00'),
(12, 12, '2024-01-20 20:00:00', '2024-01-20 20:35:00'),
(13, 1, '2024-01-21 13:15:00', '2024-01-21 13:40:00'),
(14, 2, '2024-01-21 12:15:00', '2024-01-21 12:50:00'),
(15, 3, '2024-01-22 16:45:00', '2024-01-22 17:10:00'),
(16, 4, '2024-01-22 19:15:00', '2024-01-22 19:50:00'),
(17, 5, '2024-01-23 20:30:00', '2024-01-23 21:00:00'),
(18, 6, '2024-01-23 19:00:00', '2024-01-23 19:30:00'),
(19, 7, '2024-01-24 19:45:00', '2024-01-24 20:20:00'),
(20, 8, '2024-01-24 17:15:00', '2024-01-24 17:50:00'),
(21, 9, '2024-01-25 18:45:00', '2024-01-25 19:20:00'),
(22, 10, '2024-01-25 20:15:00', '2024-01-25 20:45:00'),
(23, 11, '2024-01-26 19:30:00', '2024-01-26 20:05:00'),
(24, 12, '2024-01-26 09:45:00', '2024-01-26 10:15:00'),
(25, 1, '2024-01-27 13:00:00', '2024-01-27 13:40:00'),
(26, 2, '2024-01-27 18:15:00', '2024-01-27 18:50:00'),
(27, 3, '2024-01-28 19:45:00', '2024-01-28 20:20:00'),
(28, 4, '2024-01-28 20:30:00', '2024-01-28 21:10:00'),
(29, 5, '2024-01-29 19:00:00', '2024-01-29 19:35:00'),
(30, 6, '2024-01-29 19:15:00', '2024-01-29 19:55:00'),
(31, 7, '2024-01-30 17:45:00', NULL),
(32, 8, '2024-01-30 18:30:00', NULL);




-- 9. INSERT PAYMENTS (40 payments)

INSERT INTO payments (order_id, payment_method, payment_status, paid_amount) VALUES
(1, 'Credit Card', 'Completed', 28.98),
(2, 'Debit Card', 'Completed', 21.98),
(3, 'Credit Card', 'Completed', 33.96),
(4, 'Cash', 'Completed', 27.97),
(5, 'Credit Card', 'Completed', 26.98),
(6, 'PayPal', 'Completed', 32.97),
(7, 'Credit Card', 'Completed', 24.98),
(8, 'Debit Card', 'Completed', 30.97),
(9, 'Credit Card', 'Completed', 20.98),
(10, 'Credit Card', 'Completed', 22.98),
(11, 'Cash', 'Completed', 35.97),
(12, 'Credit Card', 'Completed', 29.97),
(13, 'Debit Card', 'Completed', 18.98),
(14, 'Credit Card', 'Completed', 25.98),
(15, 'PayPal', 'Completed', 14.98),
(16, 'Credit Card', 'Completed', 27.98),
(17, 'Credit Card', 'Completed', 23.98),
(18, 'Debit Card', 'Completed', 19.98),
(19, 'Credit Card', 'Completed', 29.96),
(20, 'Cash', 'Completed', 27.98),
(21, 'Credit Card', 'Completed', 26.98),
(22, 'Credit Card', 'Completed', 21.98),
(23, 'PayPal', 'Completed', 23.98),
(24, 'Credit Card', 'Completed', 19.98),
(25, 'Debit Card', 'Completed', 34.97),
(26, 'Credit Card', 'Completed', 32.97),
(27, 'Credit Card', 'Completed', 26.97),
(28, 'Cash', 'Completed', 36.96),
(29, 'Credit Card', 'Completed', 24.97),
(30, 'Credit Card', 'Completed', 26.98),
(31, 'Credit Card', 'Processing', 19.98),
(32, 'Debit Card', 'Processing', 24.98),
(33, 'Credit Card', 'Pending', 30.97),
(34, 'PayPal', 'Pending', 29.97),
(35, 'Credit Card', 'Pending', 22.98),
(36, 'Credit Card', 'Pending', 29.98),
(37, 'Debit Card', 'Pending', 27.97),
(38, 'Credit Card', 'Pending', 19.98),
(39, 'Credit Card', 'Pending', 24.98),
(40, 'Cash', 'Pending', 13.98);


-- Summary:
-- - 20 Customers
-- - 30 Addresses
-- - 15 Restaurants
-- - 67 Menu Items
-- - 12 Drivers
-- - 40 Orders (various statuses)
-- - 90+ Order Items
-- - 32 Deliveries
-- - 40 Payments






