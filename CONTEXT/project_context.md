# Project Context: BITLC-SQL-Practice

## Objective
A simple SQL starter project for Microsoft SQL Server (T-SQL).

## Database
- `MyFirstSqlDb`: Dedicated user database created by the script.

## Files
- `My-first-sql-db.sql`: Executes directly inside `MyFirstSqlDb`. Cleans leftover tables from `master`, recreates `Customers` table, inserts test data, and runs `SELECT`.
- `README.md`: Minimal documentation.

## Schema: Customers
- `CustomerID`: INT IDENTITY(1,1) PRIMARY KEY
- `FirstName`: NVARCHAR(50) NOT NULL
- `LastName`: NVARCHAR(50) NOT NULL
- `Email`: NVARCHAR(100) UNIQUE
- `CreatedAt`: DATETIME DEFAULT GETDATE()
