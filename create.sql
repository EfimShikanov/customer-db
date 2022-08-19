CREATE DATABASE [CustomerLib_Shikanov]
GO

USE [CustomerLib_Shikanov]
GO

DROP TABLE Address
DROP TABLE Notes
DROP TABLE Customer


CREATE TABLE Customer
(
	CustomerId INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50) CHECK (LEN(LastName) > 0) NOT NULL,
	PhoneNumber VARCHAR(15) CHECK (PhoneNumber LIKE '[0-9]%') DEFAULT 'Unknown',
	Email VARCHAR(50) CHECK (Email LIKE '%[a-zA-Z0-9._-][@][a-zA-Z0-9]%[.][a-zA-Z0-9]%') DEFAULT 'Unknown',
	TotalPurchasesAmount MONEY DEFAULT NULL
)

CREATE TABLE Address
(
	AddressId INT IDENTITY(1,1) PRIMARY KEY,
	CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerId),
	AddressLine VARCHAR(100) CHECK (LEN(AddressLine) > 0) NOT NULL,
	AddressLine2 VARCHAR(100),
	AddressType VARCHAR(50) CHECK (AddressType IN ('Shipping', 'Billing')),
	City VARCHAR(50) CHECK (LEN(City) > 0) NOT NULL,
	PostalCode VARCHAR(6) CHECK (LEN(PostalCode) > 0) NOT NULL,
	State VARCHAR(20) CHECK (LEN(State) > 0) NOT NULL,
	Country VARCHAR(50) CHECK (Country IN ('United States', 'Canada'))
)

CREATE TABLE Notes
(
	NoteId INT IDENTITY(1,1) PRIMARY KEY,
	CustomerId INT FOREIGN KEY REFERENCES Customer(CustomerId),
	Note VARCHAR(50) CHECK (LEN(NOTE) > 0) NOT NULL
)

GO

SELECT * FROM Customer
SELECT * FROM Address
SELECT * FROM Notes