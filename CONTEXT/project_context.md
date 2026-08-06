# Project Context: BITLC-SQL-Practice

## Objective
A simple SQL starter project for Microsoft SQL Server (T-SQL).

## Files
- `My-first-sql-db.sql`: Directly executable T-SQL script. Drops any existing Foreign Keys referencing `Customers`, recreates the `Customers` table, inserts test data, and queries it.
- `README.md`: Minimal documentation.

## Schema: Customers
- `CustomerID`: INT IDENTITY(1,1) PRIMARY KEY
- `FirstName`: NVARCHAR(50) NOT NULL
- `LastName`: NVARCHAR(50) NOT NULL
- `Email`: NVARCHAR(100) UNIQUE
- `CreatedAt`: DATETIME DEFAULT GETDATE()
