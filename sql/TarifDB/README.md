# Tarif DB

This folder contains a script that demonstrates a simple **tariff‑and‑customer** model on SQL Server. The script is configured for rapid development:

* **Starts in `master`**, drops and recreates the `TarifDB` database on every run (dev mode).
* Creates four tables with proper primary‑key and foreign‑key constraints.
* Uses cascade updates on foreign keys and no cascade delete, making referential integrity explicit.
* No sample data is inserted – you can add your own after the schema is created.

---
## How to run
```powershell
sqlcmd -S .\SQLEXPRESS -d master -i "sql\TarifDB\TarifDB.sql" -C
```
* `-S .\SQLEXPRESS` – your local Express instance.
* `-d master` – required so the script can drop/create the target database.
* `-C` – trusts the self‑signed certificate (needed for ODBC Driver 18).

---
## Core script excerpt
```sql
USE master;
GO

-- 0. Drop and recreate database for clean testing
IF DB_ID('TarifDB') IS NOT NULL
BEGIN
    ALTER DATABASE TarifDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE TarifDB;
END;
GO
CREATE DATABASE TarifDB;
GO
USE TarifDB;
GO

-- Ansprechpartner table
CREATE TABLE Ansprechpartner (
    AnsprechpartnerNr INT IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Vorname NVARCHAR(50) NOT NULL,
    Telefon NVARCHAR(30) NULL,
    Mail NVARCHAR(100) NULL,
    CONSTRAINT PK_Ansprechpartner PRIMARY KEY (AnsprechpartnerNr)
);
GO

-- Tarif table
CREATE TABLE Tarif (
    TarifNr INT IDENTITY(1,1),
    Bezeichnung NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Tarif PRIMARY KEY (TarifNr)
);
GO

-- Kunde table
CREATE TABLE Kunde (
    KundenNr INT IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Vorname NVARCHAR(50) NOT NULL,
    Strasse NVARCHAR(100) NOT NULL,
    PLZ NVARCHAR(10) NOT NULL,
    Ort NVARCHAR(100) NOT NULL,
    AnsprechpartnerNr INT NOT NULL,
    CONSTRAINT PK_Kunde PRIMARY KEY (KundenNr),
    CONSTRAINT FK_Kunde_Ansprechpartner FOREIGN KEY (AnsprechpartnerNr)
        REFERENCES Ansprechpartner(AnsprechpartnerNr)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);
GO

-- Kunde_Tarif junction table
CREATE TABLE Kunde_Tarif (
    KTNr INT IDENTITY(1,1),
    KundenNr INT NOT NULL,
    TarifNr INT NOT NULL,
    Beginn DATE NOT NULL,
    Ende DATE NULL,
    CONSTRAINT PK_Kunde_Tarif PRIMARY KEY (KTNr),
    CONSTRAINT FK_KundeTarif_Kunde FOREIGN KEY (KundenNr)
        REFERENCES Kunde(KundenNr)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT FK_KundeTarif_Tarif FOREIGN KEY (TarifNr)
        REFERENCES Tarif(TarifNr)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);
GO
```
---
## Verification
After the script runs you can query the newly created tables, for example:
```sql
SELECT * FROM Ansprechpartner;
SELECT * FROM Tarif;
SELECT * FROM Kunde;
SELECT * FROM Kunde_Tarif;
```
Add your own INSERT statements to populate the tables and explore the relationships.

---
Feel free to extend the schema, add seed data, or modify constraints to suit your learning goals.

This script creates a sample tariff‑and‑customer database (`TarifDB`). It defines:

- **Ansprechpartner** – contact person details
- **Tarif** – tariff definitions
- **Kunde** – customers linked to an Ansprechpartner
- **Kunde_Tarif** – junction table assigning tariffs to customers with start/end dates

The script drops nothing; it assumes a clean database. After running, you can query the tables to explore relationships, cascade updates, and basic referential integrity.
