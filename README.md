# DineDash_Sql_proj

🍔 DineDash – Food Delivery Database Project (MySQL)

📌 Project Overview

DineDash is a MySQL-based relational database project that simulates the backend of a real-world food delivery application (similar to DoorDash or Uber Eats).

The project demonstrates database design, data modeling, SQL querying, stored procedures, and triggers to support core business operations such as customer ordering, restaurant management, deliveries, and payments.

This project is designed for portfolio presentation and to showcase practical SQL skills for Data Analyst, SQL Developer, and Data Engineer roles.


🛠️ Technologies Used

Database: MySQL

SQL Concepts:

Relational database design

Primary & foreign keys

Joins & aggregations

Stored procedures

Triggers

Transactions

Business analytics queries


📂 Project Structure
DineDash/
│
├── DineDash.sql
│   ├── Database creation
│   ├── Table schemas
│   ├── Relationships (FK constraints)
│   └── Sample data (customers, orders, restaurants, etc.)
│
├── Business_Queries.sql
│   ├── Business-focused analytical queries
│   └── Revenue, customers, delivery performance insights
│
├── StoreProcedure_Triggers.sql
│   ├── Stored procedures for order management
│   └── Triggers for data validation
│
└── README.md


🧱 Database Schema Overview

The database follows a normalized relational design with the following core entities:

Customers – User profile data

Addresses – Multiple delivery addresses per customer

Restaurants – Restaurant details and availability

Menu_Items – Items offered by restaurants

Orders – Customer orders with status tracking

Order_Items – Line items per order

Drivers – Delivery drivers

Deliveries – Driver assignments and delivery timing

Payments – Payment methods, status, and amounts

Relationships are enforced using foreign keys to maintain referential integrity.


📊 Business Questions Answered

The Business_Queries.sql file answers realistic business questions, including:

Total spend per customer

Top restaurant by total revenue

Top 5 customers by lifetime value

Highest revenue-generating menu items

Average delivery time per driver

Restaurants with the slowest deliveries

Payment method distribution

Daily revenue trends

These queries demonstrate:

Multi-table joins

Aggregations (SUM, AVG, COUNT)

Date-based analysis

Business-driven insights


⚙️ Stored Procedures

The project includes stored procedures to simulate production-safe operations:

🔹 create_order

Safely creates a new order using transactions and rollback handling to prevent partial or invalid data.

🔹 get_customer_orders

Retrieves full order history for a given customer — useful for customer support and analytics.

🔹 complete_order

Marks an order as completed and records payment information in a single transaction.


🔐 Triggers
🔸 Order Validation Trigger

A trigger ensures order totals cannot be negative, enforcing business rules at the database level:

BEFORE INSERT ON orders


This demonstrates data integrity enforcement beyond application logic.

🚀 How to Run the Project

Open MySQL Workbench or your preferred MySQL client

Run DineDash.sql to:

Create the database

Create all tables

Insert sample data

Run Business_Queries.sql to explore analytics

Run StoreProcedure_Triggers.sql to:

Create stored procedures

Create triggers

Test procedures using sample calls


🎯 Skills Demonstrated

Relational database design

SQL joins and aggregations

Business analytics using SQL

Stored procedures & transactions

Triggers and data validation

Real-world data modeling


📌 Future Enhancements

Index optimization for performance

Role-based access control

Order status history tracking

Refunds and promotions support

Integration with BI tools (Power BI / Tableau)


👤 Author

Josh Oxner
SQL • Data Analytics • Database Design
Linkedin: https://www.linkedin.com/in/joshua-oxner-615074107/

📫 Feel free to connect or provide feedback!
