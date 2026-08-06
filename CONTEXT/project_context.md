# Projekt-Kontext: BITLC-SQL-Practice

## Zielsetzung
Ein einfaches SQL-Startprojekt fuer Microsoft SQL Server (T-SQL).

## Dateien
- `start.sql`: Dynamisches T-SQL Skript. Erstellt `MeinShopDB` nur falls nicht vorhanden (vermeidet `model`-Datenbank Sperrkonflikte), erstellt/ersetzt die Tabelle `Kunden`, fuegt Testdaten ein und fragt sie ab.
- `README.md`: Minimalistische Dokumentation.

## Schema: Kunden
- `KundenID`: INT IDENTITY(1,1) PRIMARY KEY
- `Vorname`: NVARCHAR(50) NOT NULL
- `Nachname`: NVARCHAR(50) NOT NULL
- `Email`: NVARCHAR(100) UNIQUE
- `ErstelltAm`: DATETIME DEFAULT GETDATE()
