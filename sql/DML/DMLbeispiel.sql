USE master
GO

IF DB_ID('DMLBeispiel') IS NOT NULL
BEGIN
    ALTER DATABASE DMLBeispiel SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DMLBeispiel;
END;
GO

CREATE DATABASE DMLBeispiel
GO

USE DMLBeispiel
GO

CREATE TABLE kunde (
    id INT,
    vorname NVARCHAR(50) NOT NULL,
    name NVARCHAR(59)  NOT NULL,
    gebDat DATE NULL,
    CONSTRAINT pk_kunde 
        PRIMARY KEY (id)
);

CREATE TABLE bestellung (
    id INT IDENTITY,
    datum DATE NOT NULL,
    summe MONEY NOT NULL,
    kunde_id INT NOT NULL,
    CONSTRAINT pk_bestellung 
        PRIMARY KEY(id),
    CONSTRAINT fk_bestellung_kunde 
        FOREIGN KEY(kunde_id) 
        REFERENCES kunde(id)
);

GO