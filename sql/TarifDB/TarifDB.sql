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

-- 1. Switch context to your dedicated database
IF DB_ID('TarifDB') IS NULL
BEGIN
    CREATE DATABASE TarifDB;
END;
GO

-- 1. Switch context to your dedicated database
USE TarifDB;
GO

-- 2. Create Ansprechpartner table
CREATE TABLE Ansprechpartner (
    AnsprechpartnerNr INT IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Vorname NVARCHAR(50) NOT NULL,
    Telefon NVARCHAR(30) NULL,
    Mail NVARCHAR(100) NULL,
    CONSTRAINT PK_Ansprechpartner PRIMARY KEY (AnsprechpartnerNr)
);
GO

-- 3. Create Tarif table
CREATE TABLE Tarif (
    TarifNr INT IDENTITY(1,1),
    Bezeichnung NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Tarif PRIMARY KEY (TarifNr)
);
GO

-- 4. Create Kunde table
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

-- 5. Create Kunde_Tarif junction table
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
