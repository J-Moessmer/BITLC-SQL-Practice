--SELECT session_id, host_name, program_name, login_name, status
--FROM sys.dm_exec_sessions
--WHERE database_id = DB_ID('model');
--KILL 81;

CREATE DATABASE TarifDB;
GO

USE TarifDB;
GO


--DROP TABLE IF EXISTS Kunde_Tarif;
--DROP TABLE IF EXISTS Kunde;
--DROP TABLE IF EXISTS Tarif;
--DROP TABLE IF EXISTS Ansprechpartner;

-- 2. Schema neu aufbauen
CREATE TABLE Ansprechpartner (
    AnsprechpartnerNr INT IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Vorname NVARCHAR(50) NOT NULL,
    Telefon NVARCHAR(30) NULL,
    Mail NVARCHAR(100) NULL,
    CONSTRAINT PK_Ansprechpartner PRIMARY KEY (AnsprechpartnerNr)
);
GO

CREATE TABLE Tarif (
    TarifNr INT IDENTITY(1,1),
    Bezeichnung NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_Tarif PRIMARY KEY (TarifNr)
);
GO

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