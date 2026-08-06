-- 1. Prüfen, ob die Datenbank bereits existiert (wird nur erstellt, wenn sie noch nicht existiert)
IF DB_ID('MeinShopDB') IS NULL
BEGIN
    EXEC('CREATE DATABASE MeinShopDB');
END
GO

-- 2. Zu MeinShopDB wechseln (falls vorhanden)
IF DB_ID('MeinShopDB') IS NOT NULL
BEGIN
    USE MeinShopDB;
END
GO

-- 3. Tabelle "Kunden" neu anlegen (alte Tabelle vorher löschen, falls vorhanden)
IF OBJECT_ID('dbo.Kunden', 'U') IS NOT NULL 
    DROP TABLE dbo.Kunden;
GO

CREATE TABLE Kunden (
    KundenID INT IDENTITY(1,1) PRIMARY KEY,
    Vorname NVARCHAR(50) NOT NULL,
    Nachname NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    ErstelltAm DATETIME DEFAULT GETDATE()
);
GO

-- 4. Testdaten einfügen
INSERT INTO Kunden (Vorname, Nachname, Email)
VALUES 
    ('Max', 'Mustermann', 'max@example.com'),
    ('Erika', 'Musterfrau', 'erika@example.com');
GO

-- 5. Daten abfragen
SELECT * FROM Kunden;
GO
