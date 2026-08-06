# BITLC-SQL-Practice

Ein Repository zum Ueben von SQL mit Unterstuetzung fuer SQLite (lokale .db-Datei) und Microsoft SQL Server (T-SQL).

---

## Repository-Struktur

### SQLite (Lokale Datenbank ohne Server)
- [practice.db](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/practice.db): Die einsatzbereite SQLite-Datenbank.
- [setup_db.py](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/setup_db.py): Python-Skript zum automatischen Erstellen und Zuruecksetzen der SQLite-Datenbank.
- [schema_sqlite.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/schema_sqlite.sql): SQLite Tabellenschema.
- [sample_data_sqlite.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/sample_data_sqlite.sql): SQLite Testdaten.

### Microsoft SQL Server (T-SQL)
- [init_db_mssql.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/init_db_mssql.sql): Komplettes Skript fuer MS SQL Server / SSMS / Azure Data Studio.
- [schema.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/schema.sql): T-SQL Tabellenschema.
- [sample_data.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/sample_data.sql): T-SQL Testdaten.

### Abfragen und Uebungen
- [queries.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/queries.sql): Uebungsaufgaben (Level 1 bis Level 4).

---

## Erste Schritte

### Option A: SQLite (per Python)
Fuehre im Terminal aus:
```bash
python setup_db.py
```
Damit wird practice.db mit allen Tabellen und Daten neu erstellt.

### Option B: Microsoft SQL Server (T-SQL)
Fuehre in deiner SQL Server Umgebung (SSMS, Azure Data Studio oder VS Code MSSQL Extension) das Skript [init_db_mssql.sql](file:///c:/Users/Jmoessmer/Documents/_GITHUB_Repos/BITLC-SQL-Practice/init_db_mssql.sql) aus.
