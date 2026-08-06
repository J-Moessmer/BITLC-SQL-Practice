# Project Context: BITLC-SQL-Practice

## Objective
A simple SQL starter project for Microsoft SQL Server (T-SQL).

## Database
- `MyFirstSqlDb`: Dedicated user database created for practicing SQL.

## Files
- `My-first-sql-db.sql`: Standard T-SQL script managing `Authors`, `Book` (singular, with `ISBN`), and `AuthorBook` junction table. Drops child table `AuthorBook` first before dropping duplicate `Books` table.
- `README.md`: Minimal documentation.

## Schemas
- `Authors`: `ID`, `FirstName`, `LastName`, `CONSTRAINT PK_Authors PRIMARY KEY (ID)`
- `Book`: `BookID`, `Title`, `ISBN`, `CONSTRAINT PK_Book PRIMARY KEY (BookID)`
- `AuthorBook`: `AuthorID`, `BookID`, `CONSTRAINT PK_AuthorBook PRIMARY KEY (AuthorID, BookID)`, `CONSTRAINT FK_AuthorBook_Authors`, `CONSTRAINT FK_AuthorBook_Book`
