-- 1. Switch context to master database
USE master;
GO

-- 2. Terminate any background connections locking the 'model' database
ALTER DATABASE model SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
ALTER DATABASE model SET MULTI_USER;
GO

-- 3. Create dedicated database MyFirstSqlDb if it does not exist yet
IF DB_ID('MyFirstSqlDb') IS NULL
BEGIN
    CREATE DATABASE MyFirstSqlDb;
END
GO

-- 4. Clean up any leftover test tables created in master by mistake
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL DROP TABLE dbo.Customers;
IF OBJECT_ID('dbo.order_items', 'U') IS NOT NULL DROP TABLE dbo.order_items;
IF OBJECT_ID('dbo.orders', 'U') IS NOT NULL DROP TABLE dbo.orders;
IF OBJECT_ID('dbo.products', 'U') IS NOT NULL DROP TABLE dbo.products;
IF OBJECT_ID('dbo.categories', 'U') IS NOT NULL DROP TABLE dbo.categories;
GO

-- 5. Switch context to MyFirstSqlDb
USE MyFirstSqlDb;
GO

-- 6. Reset / recreate test table "Customers" inside MyFirstSqlDb
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

-- 7. Insert test data
INSERT INTO Customers (FirstName, LastName, Email)
VALUES 
    ('John', 'Doe', 'john@example.com'),
    ('Jane', 'Smith', 'jane@example.com');
GO

-- 8. Query data from MyFirstSqlDb
SELECT * FROM Customers;
GO
