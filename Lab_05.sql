IF EXISTS (SELECT * FROM sys.databases WHERE Name='BookLibrary')
DROP DATABASE BookLibrary
GO

CREATE DATABASE BookLibrary1
GO

USE BookLibrary1
GO

CREATE TABLE Book (
    BookCode INT PRIMARY KEY,
    BookTitle varchar(100) NOT NULL,
    Author varchar(100) NOT NULL,
    Edition  int ,
    BookPrice money, 
    Copies int
)
SELECT * FROM Book
GO

CREATE TABLE Member (
	MemberCode int UNIQUE,
	Name varchar (50) NOT NULL,
	Address varchar (100) NOT NULL,
	PhoneNumber int
)


CREATE TABLE IssueDetails (
	BookCode int CONSTRAINT fk FOREIGN KEY (BookCode) REFERENCES Book (BookCode),
	MemberCode int CONSTRAINT fk2 FOREIGN KEY (MemberCode) REFERENCES Member (MemberCode),
	IssueDate datetime,
	ReturnDate datetime
)

SELECT * FROM IssueDetails
GO

ALTER TABLE IssueDetails
DROP CONSTRAINT fk
GO
ALTER TABLE IssueDetails
DROP CONSTRAINT fk2
GO

ALTER TABLE Book
DROP CONSTRAINT PK__Book__0A5FFCC6D9B384C2
GO
ALTER TABLE Member
DROP CONSTRAINT [UQ__Member__84CA63773B57EB54]
GO

ALTER TABLE Book
ADD CONSTRAINT fk3 PRIMARY KEY (BookCode)
GO

ALTER TABLE Member
ADD CONSTRAINT fk4 UNIQUE (MemberCode)
GO

ALTER TABLE IssueDetails
ADD CONSTRAINT fk5 FOREIGN KEY (BookCode) REFERENCES Book (BookCode)
GO
ALTER TABLE IssueDetails
ADD CONSTRAINT fk6 FOREIGN KEY (MemberCode) REFERENCES Member (MemberCode)
GO

ALTER TABLE Book ADD CONSTRAINT dk CHECK (BookPrice >0  AND BookPrice <100)
GO
ALTER TABLE Member
ADD CONSTRAINT fk7 UNIQUE (PhoneNumber)
GO

ALTER TABLE IssueDetails
ALTER COLUMN BookCode int NOT NULL
GO
ALTER TABLE IssueDetails
ALTER COLUMN MemberCode int NOT NULL
GO

ALTER TABLE IssueDetails
ADD PRIMARY KEY (BookCode, MemberCode)

SELECT * FROM Book

INSERT INTO Book (BookCode, BookTitle, Author, Edition, BookPrice, Copies) VALUES ( 123, 'Vat ly', 'NewTon', 3, 20, 5)
INSERT INTO Book (BookCode, BookTitle, Author, Edition, BookPrice, Copies) VALUES ( 456, 'Car', 'Henry', 5, 62, 2)
INSERT INTO Book (BookCode, BookTitle, Author, Edition, BookPrice, Copies) VALUES ( 789, 'Music', 'Tran Tien', 7, 55, 3)

SELECT * FROM Member
GO
INSERT INTO Member (MemberCode, Name, Address, PhoneNumber) VALUES (9420, 'Quyet', 'Thai Nguyen', 0986476656)
INSERT INTO Member (MemberCode, Name, Address, PhoneNumber) VALUES (1539, 'Tuan', 'Vinh Phuc', 0988674774)
INSERT INTO Member (MemberCode, Name, Address, PhoneNumber) VALUES (2203, 'Nguyet', 'Bac Giang', 0977532421)

SELECT * FROM IssueDetails
GO
INSERT INTO IssueDetails (BookCode, MemberCode, IssueDate, ReturnDate) VALUES (123, 9420, 22/4/2021, 28/4/2021)
INSERT INTO IssueDetails (BookCode, MemberCode, IssueDate, ReturnDate) VALUES (456, 1539, 13/6/2021, 29/6/2021)
INSERT INTO IssueDetails (BookCode, MemberCode, IssueDate, ReturnDate) VALUES (789, 2203, 26/6/2021, 03/7/2021)