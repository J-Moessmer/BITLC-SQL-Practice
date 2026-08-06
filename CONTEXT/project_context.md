# Project Context: BITLC-SQL-Practice

## Objective
A simple SQL starter project for Microsoft SQL Server (T-SQL).

## Database
- `MyFirstSqlDb`: Dedicated user database created for practicing SQL.
- `TarifDB`: Additional sample database for tariff and customer relationships.

## Files
- `sql/MyFirstSql/My-first-sql-db.sql`: Script that creates `Authors`, `Book`, and `AuthorBook` tables with sample data.
- `sql/MyFirstSql/README.md`: Documentation for the My First SQL DB script.
- `sql/TarifDB/TarifDB.sql`: Script that creates `Ansprechpartner`, `Tarif`, `Kunde`, and `Kunde_Tarif` tables with sample data and relationships.
- `sql/TarifDB/README.md`: Documentation for the Tarif DB script.
- `README.md`: Main repository README with table of contents.

## Schemas
- **Authors**: `ID`, `FirstName`, `LastName`, `CONSTRAINT PK_Authors PRIMARY KEY (ID)`
- **Book**: `BookID`, `Title`, `ISBN`, `CONSTRAINT PK_Book PRIMARY KEY (BookID)`
- **AuthorBook**: `AuthorID`, `BookID`, `CONSTRAINT PK_AuthorBook PRIMARY KEY (AuthorID, BookID)`, `CONSTRAINT FK_AuthorBook_Authors`, `CONSTRAINT FK_AuthorBook_Book`
- **Ansprechpartner**: `AnsprechpartnerNr`, `Name`, `Vorname`, `Telefon`, `Mail`, `CONSTRAINT PK_Ansprechpartner PRIMARY KEY (AnsprechpartnerNr)`
- **Tarif**: `TarifNr`, `Bezeichnung`, `CONSTRAINT PK_Tarif PRIMARY KEY (TarifNr)`
- **Kunde**: `KundenNr`, `Name`, `Vorname`, `Strasse`, `PLZ`, `Ort`, `AnsprechpartnerNr`, `CONSTRAINT PK_Kunde PRIMARY KEY (KundenNr)`, `CONSTRAINT FK_Kunde_Ansprechpartner`
- **Kunde_Tarif**: `KTNr`, `KundenNr`, `TarifNr`, `Beginn`, `Ende`, `CONSTRAINT PK_Kunde_Tarif PRIMARY KEY (KTNr)`, `CONSTRAINT FK_KundeTarif_Kunde`, `CONSTRAINT FK_KundeTarif_Tarif`
