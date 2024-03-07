create database casestudy2;

use casestudy2;

-- Create customers table
CREATE TABLE customers (
    customerid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50)
);

-- Insert records into customers table
INSERT INTO customers (customerid, firstname, lastname, city, state)
VALUES
(10101, 'John',' Gray', 'Lynden', 'Washington'),
(10298, 'Leroy','Brown', 'Pinetop', 'Arizona'),
(10299, 'Elroy',' Keller', 'Snoqualmie', 'Washington'),
(10315, 'Lisa ','Jones', 'Oshkosh', 'Wisconsin'),
(10325, 'Ginger',' Schultz', 'Pocatello', 'Idaho'),
(10329, 'Kelly',' Mendoza', 'Kailua', 'Hawaii'),
(10330, 'Shawn',' Dalton', 'Cannon Beach', 'Oregon'),
(10338, 'Michael', 'Howell', 'Tillamook', 'Oregon'),
(10339, 'Anthony', 'Sanchez', 'Winslow', 'Arizona'),
(10408, 'Elroy', 'Cleaver', 'Globe', 'Arizona'),
(10410, 'Mary Ann', 'Howell', 'Charleston', 'South Carolina'),
(10413, 'Donald', 'Davids', 'Gila Bend', 'Arizona'),
(10419, 'Linda', 'Sakahara', 'Nogales', 'Arizona'),
(10429, 'Sarah', 'Graham', 'Greensboro', 'North Carolina'),
(10438, 'Kevin', 'Smith', 'Durango', 'Colorado'),
(10439, 'Conrad', 'Giles', 'Telluride', 'Colorado'),
(10449, 'Isabela', 'Moore', 'Yuma', 'Arizona');

-- Create items_ordered table
CREATE TABLE items_ordered (
    customerid INT,
    order_date DATE,
    item VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (customerid, order_date, item),
    FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

-- Insert records into items_ordered table
INSERT INTO items_ordered (customerid, order_date, item, quantity, price)
VALUES
(10330, '1999-06-30', 'Pogo stick', 1, 28.00),
(10101, '1999-06-30', 'Raft', 1, 58.00),
(10298, '1999-07-01', 'Skateboard', 1, 33.00),
(10101, '1999-07-01', 'Life Vest', 4, 125.00),
(10299, '1999-07-06', 'Parachute', 1, 1250.00),
(10339, '1999-07-27', 'Umbrella', 1, 4.50),
(10449, '1999-08-13', 'Unicycle', 1, 180.79),
(10439, '1999-08-14', 'Ski Poles', 2, 25.50),
(10101, '1999-08-18', 'Rain Coat', 1, 18.30),
(10449, '1999-09-01', 'Snow Shoes', 1, 45.00),
(10439, '1999-09-18', 'Tent', 1, 88.00),
(10298, '1999-09-19', 'Lantern', 2, 29.00),
(10410, '1999-10-28', 'Sleeping Bag', 1, 89.22),
(10438, '1999-11-01', 'Umbrella', 1, 6.75),
(10438, '1999-11-02', 'Pillow', 1, 8.50),
(10298, '1999-12-01', 'Helmet', 1, 22.00),
(10449, '1999-12-15', 'Bicycle', 1, 380.50),
(10449, '1999-12-22', 'Canoe', 1, 280.00),
(10101, '1999-12-30', 'Hoola Hoop', 3, 14.75),
(10330, '2000-01-01', 'Flashlight', 4, 28.00),
(10101, '2000-01-02', 'Lantern', 1, 16.00),
(10299, '2000-01-18', 'Inflatable Mattress', 1, 38.00),
(10438, '2000-01-18', 'Tent', 1, 79.99),
(10413, '2000-01-19', 'Lawnchair', 4, 32.00),
(10410, '2000-01-30', 'Unicycle', 1, 192.50),
(10315, '2000-02-02', 'Compass', 1, 8.00),
(10449, '2000-02-29', 'Flashlight', 1, 4.50),
(10101, '2000-03-08', 'Sleeping Bag', 2, 88.70),
(10298, '2000-03-18', 'Pocket Knife', 1, 22.38),
(10449, '2000-03-19', 'Canoe paddle', 2, 40.00),
(10298, '2000-04-01', 'Ear Muffs', 1, 12.50),
(10330, '2000-04-19', 'Shovel', 1, 16.75);

#SELECT STATEMENT

-- From the items_ordered table, select a list of all items purchased for customerid 10449. Display the customerid, item, and price for this customer.

SELECT customerid, item, price
FROM items_ordered
WHERE customerid = 10449;

-- Select all columns from the items_ordered table for whoever purchased a Tent.

SELECT *
FROM items_ordered
WHERE item = 'Tent';

-- Select the customerid, order_date, and item values from the items_ordered table for any items in the item column that start with the letter "S".

SELECT customerid, order_date, item
FROM items_ordered
WHERE item LIKE 'S%';

-- Select the distinct items in the items_ordered table. In other words, display a listing of each of the unique items from the items_ordered table.

SELECT DISTINCT item
FROM items_ordered;

# Aggregate Functions

-- Select the maximum price of any item ordered in the items_ordered table. Hint: Select the maximum price only.

SELECT MAX(price) AS max_price
FROM items_ordered;

-- Select the average price of all of the items ordered that were purchased in the month of Dec.

SELECT AVG(price) AS average_price
FROM items_ordered
WHERE MONTH(order_date) = 12;

-- What are the total number of rows in the items_ordered table?

SELECT COUNT(*) AS total_rows
FROM items_ordered;

-- For all of the tents that were ordered in the items_ordered table, what is the price of the lowest tent? Hint: Your query should return the price only.

SELECT MIN(price) AS lowest_tent_price
FROM items_ordered
WHERE item = 'Tent';

# GROUP BY clause

-- How many people are in each unique state in the customers table? Select the state and display the number of people in each.
-- Hint: count is used to count rows in a column, sum works on numeric data only.

SELECT state, COUNT(*) AS number_of_people
FROM customers
GROUP BY state;

-- From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table. Hint: The items will need to be broken up into separate groups.

SELECT item, MAX(price) AS max_price, MIN(price) AS min_price
FROM items_ordered
GROUP BY item;

-- How many orders did each customer make? Use the items_ordered table. Select the customerid, number of orders they made, and the sum of their orders. Click the Group By answers link below if you have any problems.

SELECT customerid, COUNT(*) AS number_of_orders, SUM(price) AS total_order_sum
FROM items_ordered
GROUP BY customerid;

# HAVING clause

-- How many people are in each unique state in the customers table that have more than one person in the state? Select the state and display the number of how many people are in each if it's greater than 1.

SELECT state, COUNT(*) AS number_of_people
FROM customers
GROUP BY state
HAVING COUNT(*) > 1;

-- From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table. Only display the results if the maximum price for one of the items is greater than 190.00.

SELECT item, MAX(price) AS max_price, MIN(price) AS min_price
FROM items_ordered
GROUP BY item
HAVING MAX(price) > 190.00;

-- How many orders did each customer make? Use the items_ordered table. Select the customerid, number of orders they made, and the sum of their orders if they purchased more than 1 item.

SELECT customerid, COUNT(quantity), SUM(price)
FROM items_ordered
GROUP BY customerid
HAVING COUNT(quantity) > 1;

# Order By Clause

-- Select the lastname, firstname, and city for all customers in the customers table. Display the results in Ascending Order based on the lastname.

SELECT lastname, firstname, city
FROM customers
ORDER BY lastname;

-- Same thing as exercise #1, but display the results in Descending order.

SELECT lastname, firstname, city
FROM customers
ORDER BY lastname DESC;

-- Select the item and price for all of the items in the items_ordered table that the price is greater than 10.00. Display the results in Ascending order based on the price.

SELECT item, price
FROM items_ordered
WHERE price > 10.00
ORDER BY price ASC;

# Combining Conditions & Boolean Operators

-- Select the customerid, order_date, and item from the items_ordered table for all items unless they are 'Snow Shoes' or if they are 'Ear Muffs'. Display the rows as long as they are not either of these two items.

SELECT customerid, order_date, item 
FROM items_ordered 
WHERE (item <> 'Snow shoes') AND (item <> 'Ear muffs');

-- Select the item and price of all items that start with the letters 'S', 'P', or 'F'.

SELECT item, price
FROM items_ordered
WHERE (item LIKE 'S%') OR (item LIKE 'P%') OR (item LIKE 'F%');

# IN & BETWEEN

-- Select the date, item, and price from the items_ordered table for all of the rows that have a price value ranging from 10.00 to 80.00.

SELECT order_date, item, price
FROM items_ordered
WHERE price BETWEEN 10.00 AND 80.00;

-- Select the firstname, city, and state from the customers table for all of the rows where the state value is either: Arizona, Washington, Oklahoma, Colorado, or Hawaii.

SELECT firstname, city, state
FROM customers
WHERE state IN ('Arizona', 'Washington', 'Oklahoma', 'Colorado', 'Hawaii');

# Mathematical Functions

-- Select the item and per unit price for each item in the items_ordered table. Hint: Divide the price by the quantity.

SELECT item, price / quantity AS per_unit_price
FROM items_ordered;

# Table Joins
-- Write a query using a join to determine which items were ordered by each of the customers in the customers table. Select the customerid, firstname, lastname, order_date, item, and price for everything each customer purchased in the items_ordered table.

SELECT c.customerid, c.firstname, c.lastname, io.order_date, io.item, io.price
FROM customers c
INNER JOIN items_ordered io 
ON c.customerid = io.customerid;

-- Repeat exercise #1, however display the results sorted by state in descending order.

SELECT c.customerid, c.firstname, c.lastname, io.order_date, io.item, io.price
FROM customers c
INNER JOIN items_ordered io ON c.customerid = io.customerid
ORDER BY c.state DESC;
