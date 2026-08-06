-- Beispieldaten für die Übungsdatenbank

-- Kategorien einfügen
INSERT INTO categories (category_id, name, description) VALUES
(1, 'Elektronik', 'Smartphones, Laptops und Zubehör'),
(2, 'Bücher', 'Fachbücher, Romane und Sachbücher'),
(3, 'Kleidung', 'Herren- und Damenbekleidung'),
(4, 'Haushalt', 'Möbel und Küchengeräte');

-- Kunden einfügen
INSERT INTO customers (customer_id, first_name, last_name, email, city, country, created_at) VALUES
(1, 'Max', 'Mustermann', 'max.mustermann@example.com', 'Berlin', 'Germany', '2024-01-15 10:30:00'),
(2, 'Anna', 'Schmidt', 'anna.schmidt@example.com', 'München', 'Germany', '2024-02-01 14:15:00'),
(3, 'Lukas', 'Weber', 'lukas.weber@example.com', 'Hamburg', 'Germany', '2024-02-20 09:00:00'),
(4, 'Laura', 'Fischer', 'laura.fischer@example.com', 'Wien', 'Austria', '2024-03-05 16:45:00'),
(5, 'Felix', 'Meyer', 'felix.meyer@example.com', 'Zürich', 'Switzerland', '2024-03-12 11:20:00');

-- Produkte einfügen
INSERT INTO products (product_id, name, category_id, price, stock_quantity) VALUES
(1, 'Laptop Pro 15"', 1, 1299.99, 15),
(2, 'Smartphone X', 1, 799.50, 30),
(3, 'Wireless Headphones', 1, 149.90, 50),
(4, 'SQL für Anfänger (Buch)', 2, 29.99, 100),
(5, 'Clean Code (Buch)', 2, 39.95, 40),
(6, 'T-Shirt Classic', 3, 19.99, 120),
(7, 'Jeans Slim Fit', 3, 59.90, 60),
(8, 'Kaffeemaschine Express', 4, 89.00, 25);

-- Bestellungen einfügen
INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES
(1, 1, '2024-03-01 11:00:00', 'Completed', 1329.98),
(2, 2, '2024-03-02 15:30:00', 'Completed', 799.50),
(3, 1, '2024-03-10 09:45:00', 'Completed', 149.90),
(4, 3, '2024-03-15 14:00:00', 'Processing', 69.94),
(5, 4, '2024-03-18 17:10:00', 'Pending', 89.00),
(6, 5, '2024-03-20 12:00:00', 'Cancelled', 59.90);

-- Bestellpositionen einfügen
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1, 1299.99),
(2, 1, 4, 1, 29.99),
(3, 2, 2, 1, 799.50),
(4, 3, 3, 1, 149.90),
(5, 4, 4, 1, 29.99),
(6, 4, 5, 1, 39.95),
(7, 5, 8, 1, 89.00),
(8, 6, 7, 1, 59.90);
