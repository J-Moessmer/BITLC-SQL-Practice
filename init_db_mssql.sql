-- ============================================================
-- INITIALISIERUNGSSKRIPT FÜR MICROSOFT SQL SERVER (T-SQL)
-- Führt das Schema-Erstellen und das Einfügen der Beispieldaten aus.
-- ============================================================

-- ------------------------------------------------------------
-- 1. SCHEMATA / TABELLEN LÖSCHEN UND NEU ERSTELLEN
-- ------------------------------------------------------------
IF OBJECT_ID('dbo.order_items', 'U') IS NOT NULL DROP TABLE dbo.order_items;
IF OBJECT_ID('dbo.orders', 'U') IS NOT NULL DROP TABLE dbo.orders;
IF OBJECT_ID('dbo.products', 'U') IS NOT NULL DROP TABLE dbo.products;
IF OBJECT_ID('dbo.customers', 'U') IS NOT NULL DROP TABLE dbo.customers;
IF OBJECT_ID('dbo.categories', 'U') IS NOT NULL DROP TABLE dbo.categories;
GO

CREATE TABLE categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL UNIQUE,
    description NVARCHAR(255)
);
GO

CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    city NVARCHAR(50),
    country NVARCHAR(50) DEFAULT 'Germany',
    created_at DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    category_id INT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);
GO

CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME2 DEFAULT GETDATE(),
    status NVARCHAR(20) CHECK (status IN ('Pending', 'Processing', 'Completed', 'Cancelled')) DEFAULT 'Pending',
    total_amount DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);
GO

CREATE TABLE order_items (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price >= 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE NO ACTION
);
GO

-- ------------------------------------------------------------
-- 2. BEISPIELDATEN EINFÜGEN
-- ------------------------------------------------------------
SET IDENTITY_INSERT categories ON;
INSERT INTO categories (category_id, name, description) VALUES
(1, N'Elektronik', N'Smartphones, Laptops und Zubehör'),
(2, N'Bücher', N'Fachbücher, Romane und Sachbücher'),
(3, N'Kleidung', N'Herren- und Damenbekleidung'),
(4, N'Haushalt', N'Möbel und Küchengeräte');
SET IDENTITY_INSERT categories OFF;
GO

SET IDENTITY_INSERT customers ON;
INSERT INTO customers (customer_id, first_name, last_name, email, city, country, created_at) VALUES
(1, N'Max', N'Mustermann', N'max.mustermann@example.com', N'Berlin', N'Germany', '2024-01-15 10:30:00'),
(2, N'Anna', N'Schmidt', N'anna.schmidt@example.com', N'München', N'Germany', '2024-02-01 14:15:00'),
(3, N'Lukas', N'Weber', N'lukas.weber@example.com', N'Hamburg', N'Germany', '2024-02-20 09:00:00'),
(4, N'Laura', N'Fischer', N'laura.fischer@example.com', N'Wien', N'Austria', '2024-03-05 16:45:00'),
(5, N'Felix', N'Meyer', N'felix.meyer@example.com', N'Zürich', N'Switzerland', '2024-03-12 11:20:00');
SET IDENTITY_INSERT customers OFF;
GO

SET IDENTITY_INSERT products ON;
INSERT INTO products (product_id, name, category_id, price, stock_quantity) VALUES
(1, N'Laptop Pro 15"', 1, 1299.99, 15),
(2, N'Smartphone X', 1, 799.50, 30),
(3, N'Wireless Headphones', 1, 149.90, 50),
(4, N'SQL für Anfänger (Buch)', 2, 29.99, 100),
(5, N'Clean Code (Buch)', 2, 39.95, 40),
(6, N'T-Shirt Classic', 3, 19.99, 120),
(7, N'Jeans Slim Fit', 3, 59.90, 60),
(8, N'Kaffeemaschine Express', 4, 89.00, 25);
SET IDENTITY_INSERT products OFF;
GO

SET IDENTITY_INSERT orders ON;
INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES
(1, 1, '2024-03-01 11:00:00', N'Completed', 1329.98),
(2, 2, '2024-03-02 15:30:00', N'Completed', 799.50),
(3, 1, '2024-03-10 09:45:00', N'Completed', 149.90),
(4, 3, '2024-03-15 14:00:00', 'Processing', 69.94),
(5, 4, '2024-03-18 17:10:00', N'Pending', 89.00),
(6, 5, '2024-03-20 12:00:00', N'Cancelled', 59.90);
SET IDENTITY_INSERT orders OFF;
GO

SET IDENTITY_INSERT order_items ON;
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1, 1299.99),
(2, 1, 4, 1, 29.99),
(3, 2, 2, 1, 799.50),
(4, 3, 3, 1, 149.90),
(5, 4, 4, 1, 29.99),
(6, 4, 5, 1, 39.95),
(7, 5, 8, 1, 89.00),
(8, 6, 7, 1, 59.90);
SET IDENTITY_INSERT order_items OFF;
GO
