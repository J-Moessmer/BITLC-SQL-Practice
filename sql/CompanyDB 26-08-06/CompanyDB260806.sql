USE master;
GO

-- 0. Drop and recreate database for clean testing
IF DB_ID('CompanyDB260806') IS NOT NULL
BEGIN
    ALTER DATABASE CompanyDB260806 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE CompanyDB260806;
END;
GO
CREATE DATABASE CompanyDB260806;
GO
USE CompanyDB260806;
GO

-- 1. Switch context to your dedicated database
IF DB_ID('CompanyDB260806') IS NULL
BEGIN
    CREATE DATABASE CompanyDB260806;
END;
GO

-- 1. Switch context to your dedicated database
USE CompanyDB260806;
GO

CREATE TABLE Mitarbeiter_Projekt(
    
);

CREATE TABLE Projekte(
    
);

CREATE TABLE Mitarbeiter(
    Mitarbeiter_ID INT IDENTITY(1,1),
    Vorname NVARCHAR(50) NOT NULL,
    NACHNAME NVARCHAR (50) NOT NULL,
    Geburtsdatum DATE NOT NULL,
    Gehalt NVARCHAR (50),
    Tätigkeit NVARCHAR(50),
    
);

CREATE TABLE Abteilung(
    abteilung_ID INT IDENTITY(1,1),
    Bezeichnung NVARCHAR(50) NOT NULL,
    Standort NVARCHAR(50) NOT NULL,
);


