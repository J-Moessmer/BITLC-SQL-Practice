# My First SQL DB

This script sets up a simple relational model in the `MyFirstSqlDb` database, containing:

- **Authors** – `ID` (PK), `FirstName`, `LastName`
- **Book** – `BookID` (PK), `Title`, `ISBN`
- **AuthorBook** – junction table linking authors to books (`AuthorID`, `BookID`)

The script drops any existing tables (in the correct order) and recreates them with primary‑key and foreign‑key constraints. Sample data for two authors and two books is inserted, followed by verification `SELECT` statements.
