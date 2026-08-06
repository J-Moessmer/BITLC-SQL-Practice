-- 1. Remove any foreign keys referencing the Customers table
DECLARE @sql NVARCHAR(MAX) = N'';
SELECT @sql += N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + N'.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + 
               N' DROP CONSTRAINT ' + QUOTENAME(name) + N';'
FROM sys.foreign_keys
WHERE referenced_object_id = OBJECT_ID('dbo.Customers');

IF @sql <> N''
    EXEC sp_executesql @sql;
GO

-- 2. Drop Customers table if it exists
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL 
    DROP TABLE dbo.Customers;
GO

-- 3. Recreate Customers table
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

-- 5. Query data
SELECT * FROM Customers;
GO
