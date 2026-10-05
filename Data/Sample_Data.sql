-- =========================================
-- CAFE MANAGEMENT SYSTEM
-- SAMPLE DATA
-- =========================================

USE Cafe_Management;

-- CUSTOMERS
INSERT INTO Customers_3NF
(Customer_ID, Customer_Name, Customer_Mobile_No)
VALUES
(1, 'Aarav Sharma', '9876543210'),
(2, 'Priya Singh', '9876543211'),
(3, 'Rohan Gupta', '9876543212'),
(4, 'Ananya Verma', '9876543213'),
(5, 'Kabir Mehta', '9876543214');

-- EMPLOYEES
INSERT INTO Employees_3NF
(Emp_ID, Emp_Name, Emp_Mob_No, Emp_Gender, Emp_Age, Emp_Salary)
VALUES
(101, 'Rahul Kumar', '9811111111', 'Male', 24, 25000.00),
(102, 'Neha Sharma', '9822222222', 'Female', 23, 27000.00),
(103, 'Aditya Singh', '9833333333', 'Male', 26, 30000.00),
(104, 'Sneha Gupta', '9844444444', 'Female', 25, 28000.00),
(105, 'Karan Verma', '9855555555', 'Male', 27, 32000.00);

-- MENU ITEMS
INSERT INTO Menu_Items_3NF
(Item_ID, Item_Name, Category, Price)
VALUES
(201, 'Cappuccino', 'Beverage', 120.00),
(202, 'Cold Coffee', 'Beverage', 150.00),
(203, 'Veg Sandwich', 'Food', 180.00),
(204, 'Chocolate Cake', 'Dessert', 200.00),
(205, 'French Fries', 'Snacks', 130.00);

-- ORDERS
INSERT INTO Orders_3NF
(Order_ID, Customer_ID, Emp_ID, Order_Date, Total_Amount)
VALUES
(1001, 1, 101, '2026-09-29 10:30:00', 440.00),
(1002, 2, 102, '2026-09-29 11:15:00', 510.00),
(1003, 3, 103, '2026-09-29 12:00:00', 260.00),
(1004, 4, 104, '2026-09-29 13:20:00', 120.00),
(1005, 5, 105, '2026-09-29 14:00:00', 180.00);

-- ORDER ITEMS
INSERT INTO Order_Items_3NF
(Order_Item_ID, Order_ID, Item_ID, Quantity, Sub_Total)
VALUES
(1, 1001, 201, 2, 240.00),
(2, 1001, 204, 1, 200.00),
(3, 1002, 202, 1, 150.00),
(4, 1002, 203, 2, 360.00),
(5, 1003, 205, 2, 260.00),
(6, 1004, 201, 1, 120.00),
(7, 1005, 203, 1, 180.00);

-- PAYMENTS
INSERT INTO Payments_3NF
(Payment_ID, Order_ID, Payment_Date, Payment_Method, Status)
VALUES
(501, 1001, '2026-09-29 10:40:00', 'UPI', 'Paid'),
(502, 1002, '2026-09-29 11:30:00', 'Card', 'Paid'),
(503, 1003, '2026-09-29 12:15:00', 'Cash', 'Paid'),
(504, 1004, '2026-09-29 13:35:00', 'UPI', 'Paid'),
(505, 1005, '2026-09-29 14:20:00', 'Card', 'Pending');

-- VERIFY DATA
SELECT * FROM Customers_3NF;
SELECT * FROM Employees_3NF;
SELECT * FROM Menu_Items_3NF;
SELECT * FROM Orders_3NF;
SELECT * FROM Order_Items_3NF;
SELECT * FROM Payments_3NF;
