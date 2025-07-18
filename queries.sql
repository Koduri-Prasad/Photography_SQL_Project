CREATE DATABASE PHOTOGRAPHY;
USE PHOTOGRAPHY;


CREATE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(15),
  email VARCHAR(100),
  city VARCHAR(50)
);

INSERT INTO Customers (name, phone, email, city)
VALUES 
  ('Renuka', '6281300978', 'renu@gmail.com', 'Hyderabad'),
  ('Prasad', '7702423978', 'prasadkoduri@gmail.com', 'Rajahmundry'),
  ('Meghana', '9966954522', 'meghanakoduri@gmail.com', 'Bangalore'),
  ('Venkat', '8184857257', 'venkat@gmail.com', 'Chennai'),
  ('Pavan', '9866557175', 'pavan@gmail.com', 'Mumbai');

SELECT * FROM Customers;


CREATE TABLE Shoot_Types (
  shoot_type_id INT AUTO_INCREMENT PRIMARY KEY,
  type_name VARCHAR(50) NOT NULL,
  base_price DECIMAL(10,2) NOT NULL
);

INSERT INTO Shoot_Types (type_name, base_price)
VALUES
  ('Wedding Shoot', 15000.00),
  ('Pre-Wedding Shoot', 10000.00),
  ('Baby Shoot', 8000.00),
  ('Portfolio Shoot', 6000.00),
  ('Birthday/Event Shoot', 7000.00);
  
  SELECT * FROM Shoot_Types;
  
  
  CREATE TABLE Bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  shoot_type_id INT,
  booking_date DATE,
  shoot_date DATE,
  status VARCHAR(20),
  total_price DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (shoot_type_id) REFERENCES Shoot_Types(shoot_type_id)
);

INSERT INTO Bookings (customer_id, shoot_type_id, booking_date, shoot_date, status, total_price)
VALUES
  (5, 1, '2024-12-01', '2024-12-15', 'Confirmed', 16000.00),  
  (2, 4, '2025-01-10', '2025-01-20', 'Completed', 6000.00),   
  (3, 2, '2025-02-01', '2025-02-05', 'Pending', 8500.00);     

SELECT * FROM Bookings;


CREATE TABLE Photographers (
  photographer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  experience_years INT,
  specialization VARCHAR(50)
);

INSERT INTO Photographers (name, experience_years, specialization)
VALUES
  ('Navyavenkat', 5, 'Owner & Senior Photographer'),
  ('Reddy', 3, 'Wedding Photography'),
  ('Prasad', 2, 'Portfolio & Baby Shoots'),
  ('Pavan Kumar', 2, 'Product & Outdoor Shoots'),
  ('Sai', 1, 'Assistant Photographer'),
  ('Akash', 1, 'Baby & Candid Shoots');
  
  SELECT * FROM Photographers;
  
  
  CREATE TABLE Shoot_Assignments (
  assignment_id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id INT,
  photographer_id INT,
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
  FOREIGN KEY (photographer_id) REFERENCES Photographers(photographer_id)
);

INSERT INTO Shoot_Assignments (booking_id, photographer_id)
VALUES
  (1, 1),  
  (1, 2),  
  (2, 3);  
  
  SELECT * FROM Shoot_Assignments;


--- inner join examples

SELECT 
  b.booking_id,
  c.name AS customer_name,
  s.type_name AS shoot_type,
  b.booking_date,
  b.shoot_date,
  b.status,
  b.total_price
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Shoot_Types s ON b.shoot_type_id = s.shoot_type_id;


SELECT 
  p.name AS photographer_name,
  st.type_name AS shoot_type,
  c.name AS customer_name,
  b.shoot_date
FROM Shoot_Assignments sa
JOIN Photographers p ON sa.photographer_id = p.photographer_id
JOIN Bookings b ON sa.booking_id = b.booking_id
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Shoot_Types st ON b.shoot_type_id = st.shoot_type_id;


SELECT b.booking_id, s.type_name
FROM Bookings b
JOIN Shoot_Types s ON b.shoot_type_id = s.shoot_type_id;

SELECT 
  c.name AS customer_name,
  s.type_name AS shoot_type,
  b.shoot_date,
  p.name AS photographer_name,
  b.status
FROM bookings b 
JOIN customers c ON b.customer_id = c.customer_id
JOIN shoot_types s ON b.shoot_type_id = s.shoot_type_id
JOIN shoot_assignments sa ON b.booking_id = sa.booking_id
JOIN photographers p ON sa.photographer_id = p.photographer_id
WHERE b.status = 'Confirmed';

SELECT
  c.name AS customer_name,
  s.type_name AS shoot_type,
  p.name AS photographer_name,
  b.status
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN shoot_types s ON b.shoot_type_id = s.shoot_type_id
JOIN shoot_assignments sa ON b.booking_id = sa.booking_id
JOIN photographers p ON sa.photographer_id = p.photographer_id
WHERE b.status = 'Completed';

SELECT 
  p.name AS photographer_name,
  COUNT(sa.assignment_id) AS total_shoots
FROM photographers p
JOIN shoot_assignments sa ON p.photographer_id = sa.photographer_id
GROUP BY p.name;

SELECT
  c.name AS customer_name,
  COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
GROUP BY c.name
HAVING COUNT(b.booking_id) > 1;

SELECT
  c.name AS customer_name,
  s.type_name AS shoot_type,
  COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN shoot_types s ON b.shoot_type_id = s.shoot_type_id
GROUP BY c.name, s.type_name;


-- left join examples

SELECT
  p.name AS photographer_name,
  b.shoot_date
FROM Photographers p
LEFT JOIN Shoot_Assignments sa ON p.photographer_id = sa.photographer_id
LEFT JOIN Bookings b ON sa.booking_id = b.booking_id;


SELECT
b.booking_id,
c.name AS customer_name,
s.type_name AS Shoot_type,
b.shoot_date
From bookings b
Join Customers c on b.customer_id = c.customer_id
Join shoot_types s on b.shoot_type_id = s.shoot_type_id;

SELECT
 c.name AS customer_name,
 s.type_name AS shoot_type,
 p.name AS photographer_name
 FROM bookings b
 JOIN customers c on b.customer_id = c.customer_id
 Join shoot_types s on b.shoot_type_id = s.shoot_type_id
 Join shoot_assignments sa on b.booking_id = sa.booking_id
 JOIN photographers p on sa.photographer_id = p.photographer_id;


SELECT
  st.type_name AS shoot_type,
  COUNT(b.booking_id) AS total_bookings
FROM shoot_types st
LEFT JOIN bookings b ON st.shoot_type_id = b.shoot_type_id
GROUP BY st.type_name;

SELECT
b.booking_id,
c.name AS customer_name,
st.type_name AS Shoot_type,
b.shoot_date,
p.name As Photographer_name
FROM bookings b
JOIN Customers c On b.customer_id = c.customer_id
Join Shoot_Types st On b.shoot_type_id = st.shoot_type_id
Join Shoot_assignments Sa On b.booking_id = sa.booking_id
JOIN Photographers p on sa.photographer_id = p.photographer_id; 


SELECT
  c.customer_id,
  c.name AS customer_name,
  b.booking_id,
  b.shoot_date,
  b.status
FROM customers c
LEFT JOIN bookings b ON c.customer_id = b.customer_id;


SELECT
  b.booking_id,
  b.shoot_date,
  b.status,
  p.name AS photographer_name
FROM bookings b
LEFT JOIN shoot_assignments sa ON b.booking_id = sa.booking_id
LEFT JOIN photographers p ON sa.photographer_id = p.photographer_id;

-- right join examples

SELECT 
  p.name AS photographer_name,
  sa.assignment_id,
  b.shoot_date
FROM photographers p
RIGHT JOIN shoot_assignments sa ON p.photographer_id = sa.photographer_id
RIGHT JOIN bookings b ON sa.booking_id = b.booking_id;


-- full join examples

SELECT 
  b.booking_id,
  c.name AS customer_name,
  p.name AS photographer_name
FROM bookings b
LEFT JOIN shoot_assignments sa ON b.booking_id = sa.booking_id
LEFT JOIN photographers p ON sa.photographer_id = p.photographer_id
LEFT JOIN customers c ON b.customer_id = c.customer_id

UNION

SELECT 
  b.booking_id,
  c.name AS customer_name,
  p.name AS photographer_name
FROM photographers p
RIGHT JOIN shoot_assignments sa ON p.photographer_id = sa.photographer_id
RIGHT JOIN bookings b ON sa.booking_id = b.booking_id
RIGHT JOIN customers c ON b.customer_id = c.customer_id;


-- self join examples

SELECT 
  p1.name AS Photographer_1,
  p2.name AS Photographer_2,
  p1.experience_years
FROM photographers p1
JOIN photographers p2 
  ON p1.experience_years = p2.experience_years
  AND p1.photographer_id <> p2.photographer_id;

