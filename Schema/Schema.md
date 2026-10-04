1. Customers

| Attribute          | Data Type    | Key         |
| ------------------ | ------------ | ----------- |
| Customer_ID        | INT          | Primary Key |
| Customer_Name      | VARCHAR(100) | —           |
| Customer_Mobile_No | VARCHAR(15)  | —           |

2. Employees

| Attribute  | Data Type     | Key         |
| ---------- | ------------- | ----------- |
| Emp_ID     | INT           | Primary Key |
| Emp_Name   | VARCHAR(100)  | —           |
| Emp_Mob_No | VARCHAR(15)   | —           |
| Emp_Gender | VARCHAR(10)   | —           |
| Emp_Age    | INT           | —           |
| Emp_Salary | DECIMAL(10,2) | —           |

3. Menu Items

| Attribute | Data Type     | Key         |
| --------- | ------------- | ----------- |
| Item_ID   | INT           | Primary Key |
| Item_Name | VARCHAR(100)  | —           |
| Category  | VARCHAR(50)   | —           |
| Price     | DECIMAL(10,2) | —           |

4. Orders

| Attribute    | Data Type     | Key         |
| ------------ | ------------- | ----------- |
| Order_ID     | INT           | Primary Key |
| Customer_ID  | INT           | Foreign Key |
| Emp_ID       | INT           | Foreign Key |
| Order_Date   | DATETIME      | —           |
| Total_Amount | DECIMAL(10,2) | —           |

5. Order Items

| Attribute     | Data Type     | Key         |
| ------------- | ------------- | ----------- |
| Order_Item_ID | INT           | Primary Key |
| Order_ID      | INT           | Foreign Key |
| Item_ID       | INT           | Foreign Key |
| Quantity      | INT           | —           |
| Sub_Total     | DECIMAL(10,2) | —           |

6. Payments

| Attribute      | Data Type   | Key         |
| -------------- | ----------- | ----------- |
| Payment_ID     | INT         | Primary Key |
| Order_ID       | INT         | Foreign Key |
| Payment_Date   | DATETIME    | —           |
| Payment_Method | VARCHAR(30) | —           |
| Status         | VARCHAR(20) | —           |

Relationships

1. Places

 Customers — Places — Orders

 The Places relationship connects Customers with Orders.

| Attribute   | Key         |
| ----------- | ----------- |
| Customer_ID | Foreign Key |
| Order_ID    | Foreign Key |

2. Handles

 Employees — Handles — Orders

 The Handles relationship connects Employees with Orders.

| Attribute | Key         |
| --------- | ----------- |
| Emp_ID    | Foreign Key |
| Order_ID  | Foreign Key |

3. Contains

 Orders — Contains — Order Items

 The Contains relationship connects Orders with Order Items.

| Attribute     | Key         |
| ------------- | ----------- |
| Order_ID      | Foreign Key |
| Order_Item_ID | Foreign Key |

4. Includes

 Menu Items — Includes — Order Items

 The Includes relationship connects Menu Items with Order Items.

| Attribute     | Key         |
| ------------- | ----------- |
| Item_ID       | Foreign Key |
| Order_Item_ID | Foreign Key |

5. Has

 Orders — Has — Payments

 The Has relationship connects Orders with Payments.

| Attribute  | Key         |
| ---------- | ----------- |
| Order_ID   | Foreign Key |
| Payment_ID | Foreign Key |


