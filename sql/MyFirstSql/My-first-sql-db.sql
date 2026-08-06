-- 1. Switch context to your dedicated database
USE MyFirstSqlDb;
GO

-- 3. create Authors table
CREATE TABLE Authors (
    ID INT IDENTITY(1,1) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_Authors PRIMARY KEY (ID)
);
GO

-- 4. create Book table (singular) with a proper BookID primary key and an ISBN column
CREATE TABLE Book (
    BookID INT IDENTITY(1,1) NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    ISBN NVARCHAR(20) UNIQUE,
    CONSTRAINT PK_Book PRIMARY KEY (BookID)
);
GO

-- 5. create AuthorBook junction table referencing the correct keys
CREATE TABLE AuthorBook (
    AuthorID INT NOT NULL,
    BookID INT NOT NULL,
    CONSTRAINT PK_AuthorBook PRIMARY KEY (AuthorID, BookID),
    CONSTRAINT FK_AuthorBook_Authors FOREIGN KEY (AuthorID) REFERENCES Authors(ID),
    CONSTRAINT FK_AuthorBook_Book FOREIGN KEY (BookID) REFERENCES Book(BookID)
);
GO

-- 6. Optional: Populate some test data (feel free to adjust or remove)
INSERT INTO Authors (FirstName, LastName) VALUES ('Stephen', 'King'), ('J.K.', 'Rowling');
INSERT INTO Book (Title, ISBN) VALUES ('The Shining', '9780307743657'), ('Harry Potter and the Philosopher''s Stone', '9780747532699');
INSERT INTO AuthorBook (AuthorID, BookID) VALUES (1,1), (2,2);
GO

-- 7. Verify tables
SELECT * FROM Authors;
SELECT * FROM Book;
SELECT * FROM AuthorBook;
GO
