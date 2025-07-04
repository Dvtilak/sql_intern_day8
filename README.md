# ECommerceDB : Stored Procedures and Functions

## Objective
- To modularize SQL logic using stored procedures and user-defined functions in the ecommercedb database.

## What This Covers
- Creating and calling `stored procedures` for common operations
- Using `IN`, `OUT`, and `INOUT` parameters
- Writing `user-defined functions` for reusable logic
- Managing procedures (e.g., dropping, updating)

### Benefits
- Centralized logic for repetitive operations
- Improved maintainability and abstraction
- Enables dynamic behavior using input/output parameters

##  Implemented Procedures & Functions
- total_customers – Lists all customers.
- insert_customer – Inserts a new customer with current timestamp.
- total_orders_by_customers – Returns total order count for a given customer.
- get_customer_summary – Returns customer name and total orders using OUT parameters.
- get_order_count – Function that returns order count for a given customer ID.
- drop procedure – Used to delete an existing stored procedure.
