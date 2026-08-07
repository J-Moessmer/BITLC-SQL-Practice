USE master;
GO

-- 0. Datenbank zurücksetzen und neu erstellen
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

-- 1. Tabellenerstellung

CREATE TABLE Abteilung (
    AbteilungsNr INT IDENTITY(1,1),
    Bezeichnung NVARCHAR(100) NOT NULL,
    Standort NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Abteilung PRIMARY KEY (AbteilungsNr)
);
GO

CREATE TABLE Mitarbeiter (
    PersonalNr INT IDENTITY(1,1),
    Vorname NVARCHAR(50) NOT NULL,
    Nachname NVARCHAR(50) NOT NULL,
    Geburtsdatum DATE NOT NULL,
    Gehalt DECIMAL(10,2) NOT NULL,
    Taetigkeit NVARCHAR(100) NOT NULL,
    AbteilungsNr INT NOT NULL,
    CONSTRAINT PK_Mitarbeiter PRIMARY KEY (PersonalNr),
    CONSTRAINT FK_Mitarbeiter_Abteilung FOREIGN KEY (AbteilungsNr)
        REFERENCES Abteilung(AbteilungsNr)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT CHK_Mitarbeiter_Gehalt CHECK (Gehalt >= 0)
);
GO

CREATE TABLE Projekt (
    ProjektNr INT IDENTITY(1,1),
    Bezeichnung NVARCHAR(100) NOT NULL,
    Projektbeginn DATE NOT NULL,
    Projektende DATE NULL,
    Leiter_PersonalNr INT NOT NULL,
    CONSTRAINT PK_Projekt PRIMARY KEY (ProjektNr),
    CONSTRAINT FK_Projekt_Mitarbeiter FOREIGN KEY (Leiter_PersonalNr)
        REFERENCES Mitarbeiter(PersonalNr)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT CHK_Projekt_Datum CHECK (Projektende IS NULL OR Projektende >= Projektbeginn)
);
GO

CREATE TABLE Mitarbeiter_Projekt (
    PersonalNr INT NOT NULL,
    ProjektNr INT NOT NULL,
    Stundenzahl DECIMAL(6,2) NOT NULL,
    CONSTRAINT PK_Mitarbeiter_Projekt PRIMARY KEY (PersonalNr, ProjektNr),
    CONSTRAINT FK_MitarbeiterProjekt_Mitarbeiter FOREIGN KEY (PersonalNr)
        REFERENCES Mitarbeiter(PersonalNr)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT FK_MitarbeiterProjekt_Projekt FOREIGN KEY (ProjektNr)
        REFERENCES Projekt(ProjektNr)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT CHK_MitarbeiterProjekt_Stunden CHECK (Stundenzahl >= 0)
);
GO