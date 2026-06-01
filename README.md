# Inventory and Sales Management System
# Overview

This project is a SQL Relational Database application created for the CSE 310 Applied Programming course. The software uses Python and SQLite to manage products, customers, and orders in a relational database system. The program allows users to view, add, update, and delete product information while also demonstrating relationships between multiple database tables using SQL joins.

The purpose of this project is to demonstrate understanding of SQL relational databases, database structure, CRUD operations, and Python database integration.

## Features

View all products
Add new products
Update product information
Delete products
View customer orders
SQL JOIN queries
Error handling with try/except
Relational database design using primary and foreign keys

## Database Structure

The project contains the following relational tables:

### Products

Stores product information including:

Product ID
Product name
Price
Quantity

### Customers

Stores customer information including:

Customer ID
First name
Last name
Email

### Orders

Stores customer order information including:

Order ID
Customer ID
Order date

### Order_Items

Connects orders and products together using foreign keys.

## Technologies Used

- Python
- SQLite
- DB Browser for SQLite
- Visual Studio Code

## How to Run the Program

1. Open the project folder in Visual Studio Code.
2. Make sure Python is installed.
3. Run the following command in the terminal:

python main.py

4. Use the menu options to interact with the database system.

## SQL Concepts Demonstrated

This project demonstrates:

- CREATE TABLE
- INSERT
- SELECT
- UPDATE
- DELETE
- JOIN queries
- Primary Keys
- Foreign Keys
- Relational Database Integrity

## Author

Joshua Jimenez

CSE 310 – Applied Programming