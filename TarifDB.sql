CREATE DATABASE TarifDB;
GO
USE TarifDB;
GO

CREATE TABLE Ansprechpartner (
    AnsprechpartnerNr INT AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Vorname VARCHAR(50) NOT NULL,
    Telefon VARCHAR(30) NULL,
    Mail VARCHAR(100) NULL,
    CONSTRAINT PK_Ansprechpartner PRIMARY KEY (AnsprechpartnerNr)
);

CREATE TABLE Tarif(
    TarifNr INT AUTO_INCREMENT,
    Bezeichnung VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Tarif PRIMARY KEY (TarifNr)
);


CREATE TABLE Kunde(
    KundenNr INT AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Vorname VARCHAR(50) NOT NULL,
    Strasse VARCHAR(100) NOT NULL,
    PLZ VARCHAR(10) NOT NULL,
    Ort VARCHAR(100) NOT NULL,
    AnsprechpartnerNr INT NOT NULL,
    CONSTRAINT PK_Kunde PRIMARY KEY (KundenNr),
    CONSTRAINT FK_Kunde_Ansprechpartner FOREIGN KEY (AnsprechpartnerNr) 
        REFERENCES Ansprechpartner(AnsprechpartnerNr)
        ON UPDATE CASCADE 
        ON DELETE RESTRICT
);

CREATE TABLE Kunde_Tarif (
    KTNr INT AUTO_INCREMENT,
    KundenNr INT NOT NULL,
    TarifNr INT NOT NULL,
    Beginn DATE NOT NULL,
    Ende DATE NULL,
    CONSTRAINT PK_Kunde_Tarif PRIMARY KEY (KTNr),
    CONSTRAINT FK_KundeTarif_Kunde FOREIGN KEY (KundenNr) 
        REFERENCES Kunde(KundenNr)
        ON UPDATE CASCADE 
        ON DELETE RESTRICT,
    CONSTRAINT FK_KundeTarif_Tarif FOREIGN KEY (TarifNr) 
        REFERENCES Tarif(TarifNr)
        ON UPDATE CASCADE 
        ON DELETE RESTRICT
);
