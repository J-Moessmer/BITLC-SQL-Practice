-- ============================================================
-- SQL ÜBUNGSDATEI - practice.db
-- ============================================================
-- Tipps:
-- 1. Führe dieses Skript aus oder nutze eine VS Code Extension 
--    (z. B. "SQLite Viewer" oder "SQLite"), um Abfragen zu testen.
-- 2. Wenn du die Datenbank zurücksetzen möchtest, führe einfach 
--    `python setup_db.py` im Terminal aus.
-- ============================================================

-- ------------------------------------------------------------
-- LEVEL 1: Grundlagen (SELECT, WHERE, ORDER BY, LIMIT)
-- ------------------------------------------------------------

-- Aufgabe 1.1: Zeige alle Kunden aus Deutschland an.
SELECT * 
FROM customers 
WHERE country = 'Germany';

-- Aufgabe 1.2: Zeige alle Produkte mit einem Preis unter 100 € an, sortiert nach Preis absteigend.
SELECT name, price 
FROM products 
WHERE price < 100 
ORDER BY price DESC;


-- ------------------------------------------------------------
-- LEVEL 2: Aggregationen & Gruppierungen (COUNT, SUM, AVG, GROUP BY)
-- ------------------------------------------------------------

-- Aufgabe 2.1: Wie viele Kunden gibt es pro Land?
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country;

-- Aufgabe 2.2: Berechne den durchschnittlichen Preis aller Produkte in der Kategorie "Elektronik" (category_id = 1).
SELECT AVG(price) AS avg_price
FROM products
WHERE category_id = 1;


-- ------------------------------------------------------------
-- LEVEL 3: Verknüpfungen (JOINs)
-- ------------------------------------------------------------

-- Aufgabe 3.1: Liste alle Produkte zusammen mit ihrem Kategorienamen auf.
SELECT p.product_id, p.name AS product_name, c.name AS category_name, p.price
FROM products p
JOIN categories c ON p.category_id = c.category_id;

-- Aufgabe 3.2: Zeige alle Bestellungen mit Kundennamen, Bestelldatum und Status an.
SELECT o.order_id, c.first_name || ' ' || c.last_name AS customer_name, o.order_date, o.status, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;


-- ------------------------------------------------------------
-- LEVEL 4: Fortgeschritten (Subqueries & CTEs)
-- ------------------------------------------------------------

-- Aufgabe 4.1: Finde alle Kunden, die mindestens eine Bestellung getätigt haben.
SELECT *
FROM customers
WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders);

-- Aufgabe 4.2: Berechne den Gesamtumsatz pro Kunde (nur für 'Completed' Bestellungen).
WITH CustomerSales AS (
    SELECT o.customer_id, SUM(o.total_amount) AS total_spent
    FROM orders o
    WHERE o.status = 'Completed'
    GROUP BY o.customer_id
)
SELECT c.first_name, c.last_name, COALESCE(cs.total_spent, 0) AS total_spent
FROM customers c
LEFT JOIN CustomerSales cs ON c.customer_id = cs.customer_id
ORDER BY total_spent DESC;
