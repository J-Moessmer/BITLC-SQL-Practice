-- 1. Clean up any leftover user table from master database
USE master;
GO
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
GO

-- 2. Switch context to your dedicated database MyFirstSqlDb
USE MyFirstSqlDb;
GO

-- 3. Reset / recreate test table "Customers" inside MyFirstSqlDb
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL 
    DROP TABLE dbo.Customers;
GO

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- 4. Insert test data
INSERT INTO Customers (FirstName, LastName, Email)
VALUES 
    ('John', 'Doe', 'john@example.com'),
    ('Jane', 'Smith', 'jane@example.com');
GO

-- 5. Query data from MyFirstSqlDb
SELECT * FROM Customers;
GO
