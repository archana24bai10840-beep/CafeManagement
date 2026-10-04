-- Cafe Management System
-- Database Schema


-- 1. CUSTOMERS

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_mobile_no VARCHAR(15)
);


-- 2. EMPLOYEES

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    emp_mob_no VARCHAR(15),
    emp_gender VARCHAR(10),
    emp_age INT,
    emp_salary DECIMAL(10,2)
);


-- 3. MENU ITEMS

CREATE TABLE Menu_Items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL
);


-- 4. ORDERS

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    emp_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10,2),

    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    CONSTRAINT fk_order_employee
        FOREIGN KEY (emp_id)
        REFERENCES Employees(emp_id)
);


-- 5. ORDER ITEMS

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    sub_total DECIMAL(10,2),

    CONSTRAINT fk_orderitem_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    CONSTRAINT fk_orderitem_menu
        FOREIGN KEY (item_id)
        REFERENCES Menu_Items(item_id)
);


-- 6. PAYMENTS

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATETIME,
    payment_method VARCHAR(30),
    status VARCHAR(20),

    CONSTRAINT fk_payment_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);
