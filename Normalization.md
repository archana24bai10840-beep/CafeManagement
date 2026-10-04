DATABASE NORMALIZATION – CAFE MANAGEMENT SYSTEM

1. Introduction
Normalization is a database design technique used to organize data properly into different tables.
The main goals of normalization are:

-Reduce data redundancy (duplicate data)
-Avoid data inconsistency
-Prevent insertion, deletion, and update anomalies
-Improve database structure
-Maintain data integrity

For our Cafe Management System, we identified the following main tables:
-Customers
-Employees
-Menu_Items
-Orders
-Order_Items
-Payments

2. Unnormalized Form (UNF)
Before normalization, information could be stored in one large table.
For example:

Order_ID |Customer_ID|	Customer_Name|Employee|	Items           |	Payment|
---------|-----------|---------------|--------|-----------------|--------|
1001     |C01        |	Aarav        |Rahul   |	Cappuccino, Cake|	UPI    |
1002     |C02	       |Priya          |Neha	  |Coffee, Sandwich |	Card   |
Problem

The Items column contains multiple values:
Cappuccino, Cake

This violates the idea that each field should contain one value.
It also causes problems when we want to:
-Search for one particular item
-Change an item
-Add another item
-Count how many times an item was ordered

Therefore, this is Unnormalized Form (UNF).

3. First Normal Form (1NF)

A table is in 1NF when:

-Each column contains atomic/single values.
-There are no repeating groups.
-Each row can be uniquely identified.

Before 1NF
Order_ID |	Customer_Name |	Items           |
---------|----------------|-----------------|
1001     |	Aarav         |	Cappuccino, Cake|

The Items column contains multiple values.

After 1NF
We separate the items:
Order_ID | Customer_Name |	Item      |
---------|---------------|------------|
1001     |	Aarav        |	Cappuccino|
---------|---------------|------------|
1001	   |  Aarav        |	Cake      |

Now each cell contains only one value.
Therefore, the data satisfies 1NF.

For our Cafe System
The Order_Items table helps us represent individual items in an order.
Order_ID → Item_ID → Quantity
For example:
Order_ID |	Item_ID |	Quantity|
---------|----------|---------|
1001	   |201	      |  2      |
---------|----------|---------|
1001	   |204       |	 1      |

So an order can contain multiple items without storing multiple items in one cell.

4. Second Normal Form (2NF)

A table is in 2NF when:

It is already in 1NF.
It has no partial dependency.
What is Partial Dependency?
Partial dependency occurs when a non-key attribute depends on only part of a composite key.

Consider an order-item table:

Order_ID | Item_ID | Item_Name |	Price |	Quantity |
---------|---------|-----------|--------|----------|
1001     |	201	   | Cappuccino|	120   |	  2      |
---------|---------|-----------|--------|----------|
1001	   |  204	   |  Cake     |	200   | 	1      |

Suppose the combined key is:
(Order_ID, Item_ID)

But:
Item_ID → Item_Name
Item_ID → Price

Item_Name and Price depend only on Item_ID, not on the entire combination (Order_ID, Item_ID).
Therefore, there is a partial dependency.
Solution
We separate the information.
Menu_Items Table :

Item_ID |	Item_Name    |	Category | Price |
--------|--------------|-----------|-------|
201     |	Cappuccino   |	Beverage |	120  |
--------|--------------|-----------|-------|
204	    |Chocolate Cake|	Dessert	 |  200  |

Order_Items Table
Order_Item_ID |	Order_ID |	Item_ID	| Quantity |
--------------|----------|----------|----------|
1             |	 1001    |	 201    |  	2      |
--------------|----------|----------|----------|
2	            |  1001	   |   204    |  	1      |

Now menu information depends on Item_ID, while order-item information depends on the order-item record.
Therefore, the partial dependency is removed and the database satisfies 2NF.

5. Third Normal Form (3NF)
A table is in 3NF when:
-It is already in 2NF.
-There is no transitive dependency.

What is Transitive Dependency?
A transitive dependency occurs when:
A → B → C
In simple words, one non-key attribute depends on another non-key attribute.

Example in our Cafe System
Consider if we stored employee information like this:

Emp_ID | Emp_Name |	Role_ID	| Role_Name |
-------|----------|---------|-----------|
101    |	Rahul   |	R01	    | Barista   |
-------|----------|---------|-----------|
102    | 	Neha	  | R02	    | Server

We could have:

Emp_ID → Role_ID
Role_ID → Role_Name

Therefore:

Emp_ID → Role_ID → Role_Name

Role_Name indirectly depends on Emp_ID.

This is a transitive dependency.

Solution

We would separate the role information:

Employees
Emp_ID | Emp_Name |	Role_ID |
-------|----------|---------|
101    |	Rahul	  |  R01    |
-------|----------|---------|
102	   |  Neha	  |   R02   |

Roles
Role_ID |	Role_Name |
--------|-----------|
R01     |	Barista   |
--------|-----------|
R02	    |  Server   |

Now the transitive dependency is removed.

How our actual Cafe database achieves 3NF

Our final design separates information according to its own primary key:

Customers
Customer_ID → Customer_Name
              Customer_Mobile_No
Employees
Emp_ID → Emp_Name
         Emp_Mob_No
         Emp_Gender
         Emp_Age
         Emp_Salary
Menu_Items
Item_ID → Item_Name
          Category
          Price
Orders
Order_ID → Customer_ID
           Emp_ID
           Order_Date
           Total_Amount
Order_Items
Order_Item_ID → Order_ID
                Item_ID
                Quantity
                Sub_Total
Payments
Payment_ID → Order_ID
             Payment_Date
             Payment_Method
             Status

Therefore, the tables are organized so that non-key attributes depend on their respective keys.

6. Boyce-Codd Normal Form (BCNF)

BCNF is a stronger version of 3NF.

A table is in BCNF when:

For every functional dependency X → Y, X must be a super key.

In simple language:

Every determinant must be a candidate key.

For our Cafe Management System, our main tables are already designed around their primary keys, such as:

Customer_ID → Customer_Name
Item_ID → Item_Name
Emp_ID → Emp_Name
Order_ID → Order_Date
Payment_ID → Payment_Date

The determinants are the respective keys.

Therefore, our design does not introduce an obvious BCNF violation in these basic relationships.

7. Fourth Normal Form (4NF)

4NF deals with multivalued dependencies.

A table violates 4NF when one entity has two or more independent multi-valued attributes.

Example

Suppose we stored:

Item_ID	Item_Name	Available_Size	Available_Addon
201	Coffee	Small	Sugar
201	Coffee	Small	Extra Shot
201	Coffee	Large	Sugar
201	Coffee	Large	Extra Shot

Here, sizes and add-ons are independent multi-valued properties.

This can create unnecessary combinations.

Solution

Separate them:

Item_Size

Item_ID	Size
201	Small
201	Large

Item_Addon

Item_ID	Addon
201	Sugar
201	Extra Shot

This removes the multivalued dependency.

For our current Cafe project

We don't have independent multi-valued attributes like these in our six-table design, so 4NF does not require an additional decomposition.

8. Normalization Applied to Our Cafe Management System

Our final tables are:

Customers
Attribute	Description
Customer_ID	Primary Key
Customer_Name	Customer name
Customer_Mobile_No	Customer contact
Employees
Attribute	Description
Emp_ID	Primary Key
Emp_Name	Employee name
Emp_Mob_No	Employee contact
Emp_Gender	Employee gender
Emp_Age	Employee age
Emp_Salary	Employee salary
Menu_Items
Attribute	Description
Item_ID	Primary Key
Item_Name	Name of food/beverage
Category	Food/Beverage/Dessert etc.
Price	Item price
Orders
Attribute	Description
Order_ID	Primary Key
Customer_ID	Foreign Key
Emp_ID	Foreign Key
Order_Date	Date/time of order
Total_Amount	Total order amount
Order_Items
Attribute	Description
Order_Item_ID	Primary Key
Order_ID	Foreign Key
Item_ID	Foreign Key
Quantity	Quantity ordered
Sub_Total	Quantity × price
Payments
Attribute	Description
Payment_ID	Primary Key
Order_ID	Foreign Key
Payment_Date	Payment date
Payment_Method	Cash/Card/UPI
Status	Paid/Pending
9. Benefits of Normalization in Our Cafe System
1. Reduces Data Redundancy

Customer information does not have to be repeated for every item in an order.

For example, instead of repeatedly storing:

Aarav | 9876543210

for every item, we store it once in Customers.

2. Prevents Update Anomaly

If a customer's mobile number changes, we update it in one place.

We don't have to search through every order.

3. Prevents Insertion Anomaly

We can add a new menu item even if nobody has ordered it yet.

For example:

206 | Masala Tea | Beverage | 80

can be added directly to Menu_Items.

4. Prevents Deletion Anomaly

Deleting an order should not accidentally delete the customer or menu item information.

The information is stored separately.

5. Improves Data Integrity

Primary keys and foreign keys make sure that relationships remain valid.

For example:

Orders.Customer_ID
        ↓
Customers.Customer_ID

An order cannot refer to a customer that doesn't exist if the foreign-key constraint is enforced.

6. Makes the Database Easier to Maintain

Each table has a specific purpose:

Customers     → customer information
Employees     → employee information
Menu_Items    → menu information
Orders        → order information
Order_Items   → items inside orders
Payments      → payment information

This makes the system easier to understand and maintain.

10. Normalization Summary
Normal Form	Main Requirement	Cafe Example
1NF	Atomic values	Separate multiple items in an order
2NF	Remove partial dependency	Separate Menu_Items from Order_Items
3NF	Remove transitive dependency	Keep independent employee/customer/menu information in separate tables
BCNF	Every determinant is a candidate key	Tables are organized around their primary keys
4NF	Remove unwanted multivalued dependencies	Independent item sizes/add-ons would be separated
11. Conclusion

Normalization helped us create a properly structured Cafe Management System.

Our final database consists of:

Customers
Employees
Menu_Items
Orders
Order_Items
Payments

The relationships between these tables are maintained using primary keys and foreign keys.

By applying normalization, we:

Reduced duplicate data
Reduced data inconsistency
Avoided insertion anomalies
Avoided deletion anomalies
Avoided update anomalies
Improved data integrity
Made the database easier to maintain

Therefore, our Cafe Management System provides a structured and efficient database design.
