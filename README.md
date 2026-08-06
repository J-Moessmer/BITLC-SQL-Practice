# BITLC-SQL-Practice 🗄️

Ein lokales Repository zum Üben und Erlernen von SQL-Abfragen mit **SQLite**.

---

## 📁 Repository-Struktur

- **[practice.db](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/practice.db)**: Die einsatzbereite SQLite-Datenbank.
- **[schema.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/schema.sql)**: Enthält alle `CREATE TABLE`-Befehle für das Datenbankschema.
- **[sample_data.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/sample_data.sql)**: Enthält Testdaten (Kunden, Produkte, Kategorien, Bestellungen).
- **[setup_db.py](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/setup_db.py)**: Python-Skript zum Erstellen oder Zurücksetzen der Datenbank.
- **[queries.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/queries.sql)**: Beispielabfragen und Übungsaufgaben (Grundlagen bis fortgeschritten).

---

## 📊 Datenbankschema (E-Commerce)

Die Datenbank simuliert einen einfachen Online-Shop mit folgenden Tabellen:

1. **`categories`**: Produktkategorien (`category_id`, `name`, `description`)
2. **`customers`**: Kundenstamm (`customer_id`, `first_name`, `last_name`, `email`, `city`, `country`, `created_at`)
3. **`products`**: Artikelkatalog (`product_id`, `name`, `category_id`, `price`, `stock_quantity`)
4. **`orders`**: Bestellungen (`order_id`, `customer_id`, `order_date`, `status`, `total_amount`)
5. **`order_items`**: Bestellpositionen (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`)

---

## 🚀 Erste Schritte

### 1. Datenbank zurücksetzen / neu erstellen
Falls du Testdaten veränderst oder neu anfangen möchtest:
```bash
python setup_db.py
```

### 2. SQL in VS Code ausführen & anzeigen
Empfohlene VS Code Extensions:
- **SQLite Viewer** (Florian Klampfer): Tabellen direkt in VS Code visuell betrachten.
- **SQLite** (alexcvzz): SQL-Queries aus `.sql`-Dateien direkt gegen die `practice.db` ausführen.

---

## 📝 Übungen ausprobieren
Öffne die Datei **[queries.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/queries.sql)** für praxisnahe Übungsaufgaben von `SELECT` und `JOIN` bis hin zu Aggregate-Funktionen und CTEs.
