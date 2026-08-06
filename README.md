# BITLC-SQL-Practice 🗄️

Ein lokales Repository zum Üben und Erlernen von SQL-Abfragen mit **Microsoft SQL Server (T-SQL)**.

---

## 📁 Repository-Struktur

- **[init_db_mssql.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/init_db_mssql.sql)**: Komplettes Skript zum Erstellen der Tabellen und Einfügen aller Beispieldaten in SQL Server.
- **[schema.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/schema.sql)**: T-SQL Tabellendefinitionen.
- **[sample_data.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/sample_data.sql)**: T-SQL Testdaten (Kunden, Produkte, Kategorien, Bestellungen).
- **[queries.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/queries.sql)**: Beispielabfragen und Übungsaufgaben für T-SQL.

---

## 📊 Datenbankschema (E-Commerce)

1. **`categories`**: Produktkategorien (`category_id`, `name`, `description`)
2. **`customers`**: Kundenstamm (`customer_id`, `first_name`, `last_name`, `email`, `city`, `country`, `created_at`)
3. **`products`**: Artikelkatalog (`product_id`, `name`, `category_id`, `price`, `stock_quantity`)
4. **`orders`**: Bestellungen (`order_id`, `customer_id`, `order_date`, `status`, `total_amount`)
5. **`order_items`**: Bestellpositionen (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`)

---

## 🚀 Einrichtung in SQL Server

Führe in deiner SQL Server Umgebung (z. B. SSMS, Azure Data Studio oder VS Code MSSQL Extension) das Skript **[init_db_mssql.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/init_db_mssql.sql)** aus.

Dabei werden bestehende Tabellen automatisch gelöscht, neu angelegt und mit Testdaten befüllt.

---

## 📝 Übungen ausprobieren
Öffne die Datei **[queries.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/queries.sql)** für praxisnahe Übungsaufgaben von `SELECT` über `JOIN` bis hin zu Aggregate-Funktionen, `CONCAT`, `ISNULL` und CTEs.
