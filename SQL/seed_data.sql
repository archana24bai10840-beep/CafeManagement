--Insert Customers

INSERT INTO Customers_3NF
(Customer_ID, Customer_Name, Customer_Mobile_No)
VALUES
(1, 'Aarav Sharma', '9876543210');

INSERT INTO Customers_3NF
VALUES
(2, 'Priya Singh', '9876543211');

INSERT INTO Customers_3NF
VALUES
(3, 'Rohan Gupta', '9876543212');

INSERT INTO Customers_3NF
VALUES
(4, 'Ananya Verma', '9876543213');

INSERT INTO Customers_3NF
VALUES
(5, 'Kabir Mehta', '9876543214');

--Insert Employees

INSERT INTO Employees_3NF
VALUES
(101, 'Rahul Kumar', '9811111111', 'Male', 24, 25000);

INSERT INTO Employees_3NF
VALUES
(102, 'Neha Sharma', '9822222222', 'Female', 23, 27000);

INSERT INTO Employees_3NF
VALUES
(103, 'Aditya Singh', '9833333333', 'Male', 26, 30000);

INSERT INTO Employees_3NF
VALUES
(104, 'Sneha Gupta', '9844444444', 'Female', 25, 28000);

INSERT INTO Employees_3NF
VALUES
(105, 'Karan Verma', '9855555555', 'Male', 27, 32000);

--Insert Menu Items

INSERT INTO Menu_Items_3NF
VALUES
(201, 'Cappuccino', 'Beverage', 120.00);

INSERT INTO Menu_Items_3NF
VALUES
(202, 'Cold Coffee', 'Beverage', 150.00);

INSERT INTO Menu_Items_3NF
VALUES
(203, 'Veg Sandwich', 'Food', 180.00);

INSERT INTO Menu_Items_3NF
VALUES
(204, 'Chocolate Cake', 'Dessert', 200.00);

INSERT INTO Menu_Items_3NF
VALUES
(205, 'French Fries', 'Snacks', 130.00);

--Insert Orders

INSERT INTO Orders_3NF
VALUES
(1001, 1, 101, '2026-09-29 10:30:00');

INSERT INTO Orders_3NF
VALUES
(1002, 2, 102, '2026-09-29 11:15:00');

INSERT INTO Orders_3NF
VALUES
(1003, 3, 103, '2026-09-29 12:00:00');

INSERT INTO Orders_3NF
VALUES
(1004, 4, 104, '2026-09-29 13:20:00');

INSERT INTO Orders_3NF
VALUES
(1005, 5, 105, '2026-09-29 14:00:00');

--Insert Order Items

INSERT INTO Order_Items_3NF
VALUES
(1, 1001, 201, 2);

INSERT INTO Order_Items_3NF
VALUES
(2, 1001, 204, 1);

INSERT INTO Order_Items_3NF
VALUES
(3, 1002, 202, 1);

INSERT INTO Order_Items_3NF
VALUES
(4, 1002, 203, 2);

INSERT INTO Order_Items_3NF
VALUES
(5, 1003, 205, 2);

INSERT INTO Order_Items_3NF
VALUES
(6, 1004, 201, 1);

INSERT INTO Order_Items_3NF
VALUES
(7, 1005, 203, 1);

--Insert Payments

INSERT INTO Payments_3NF
VALUES
(501, 1001, '2026-09-29 10:40:00', 'UPI', 'Paid');

INSERT INTO Payments_3NF
VALUES
(502, 1002, '2026-09-29 11:30:00', 'Card', 'Paid');

INSERT INTO Payments_3NF
VALUES
(503, 1003, '2026-09-29 12:15:00', 'Cash', 'Paid');

INSERT INTO Payments_3NF
VALUES
(504, 1004, '2026-09-29 13:35:00', 'UPI', 'Paid');

INSERT INTO Payments_3NF
VALUES
(505, 1005, '2026-09-29 14:20:00', 'Card', 'Pending');
