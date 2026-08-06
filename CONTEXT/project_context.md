# Projekt-Kontext: BITLC-SQL-Practice

## 1. Uebersicht & Zielsetzung
Dieses Repository dient dem Erlernen und Ueben von SQL-Abfragen in zwei Umgebungen:
- SQLite (lokale Entwicklungsdatenbank `practice.db`, verwaltet ueber `setup_db.py`)
- Microsoft SQL Server / T-SQL (verwaltet ueber `init_db_mssql.sql`)

## 2. Datenbankschema (E-Commerce Domain)

### Tabellen & Spalten

1. `categories`
   - `category_id`: Primary Key (AUTOINCREMENT / IDENTITY)
   - `name`: VARCHAR/TEXT (NOT NULL, UNIQUE)
   - `description`: VARCHAR/TEXT

2. `customers`
   - `customer_id`: Primary Key (AUTOINCREMENT / IDENTITY)
   - `first_name`: VARCHAR/TEXT (NOT NULL)
   - `last_name`: VARCHAR/TEXT (NOT NULL)
   - `email`: VARCHAR/TEXT (NOT NULL, UNIQUE)
   - `city`: VARCHAR/TEXT
   - `country`: VARCHAR/TEXT (DEFAULT 'Germany')
   - `created_at`: DATETIME/DATETIME2 (DEFAULT GETDATE / CURRENT_TIMESTAMP)

3. `products`
   - `product_id`: Primary Key (AUTOINCREMENT / IDENTITY)
   - `name`: VARCHAR/TEXT (NOT NULL)
   - `category_id`: Foreign Key -> `categories(category_id)` (ON DELETE SET NULL)
   - `price`: REAL/DECIMAL(10,2) (CHECK price >= 0)
   - `stock_quantity`: INT (CHECK stock_quantity >= 0)

4. `orders`
   - `order_id`: Primary Key (AUTOINCREMENT / IDENTITY)
   - `customer_id`: Foreign Key -> `customers(customer_id)` (ON DELETE CASCADE)
   - `order_date`: DATETIME/DATETIME2
   - `status`: VARCHAR/TEXT ('Pending', 'Processing', 'Completed', 'Cancelled')
   - `total_amount`: REAL/DECIMAL(10,2)

5. `order_items`
   - `order_item_id`: Primary Key (AUTOINCREMENT / IDENTITY)
   - `order_id`: Foreign Key -> `orders(order_id)` (ON DELETE CASCADE)
   - `product_id`: Foreign Key -> `products(product_id)` (ON DELETE RESTRICT/NO ACTION)
   - `quantity`: INT (CHECK quantity > 0)
   - `unit_price`: REAL/DECIMAL(10,2)

## 3. Dateistruktur & Verantwortlichkeiten
- `practice.db`: SQLite Datenbankdatei
- `setup_db.py`: Erstellt `practice.db` aus `schema_sqlite.sql` und `sample_data_sqlite.sql`
- `schema_sqlite.sql`: SQLite DDL
- `sample_data_sqlite.sql`: SQLite DML (Testdaten)
- `init_db_mssql.sql`: Combined DDL/DML fuer Microsoft SQL Server (T-SQL)
- `schema.sql`: T-SQL DDL
- `sample_data.sql`: T-SQL DML
- `queries.sql`: Uebungs-Queries
- `CONTEXT/project_context.md`: Dieses Kontextdokument zur Reduzierung des Tokenverbrauchs.
