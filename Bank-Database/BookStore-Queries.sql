CREATE TABLE Books (
BookID INT PRIMARY KEY,
Title VARCHAR(255),
AuthorName VARCHAR(100),
Price DECIMAL(10,2),
StockQuantity INT

);

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Email VARCHAR(255)
);

DROP TABLE Orders
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount DECIMAL(10,2)
);



INSERT INTO Books (BookID, Title, AuthorName, Price, StockQuantity) VALUES
(1, 'The Kite Runner', 'Khaled Hosseini', 15.99, 50),
(2, 'A Thousand Splendid Suns', 'Khaled Hosseini', 17.99, 40),
(3, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 12.99, 60),
(4, 'The Great Gatsby', 'Scott Fitzgerald', 14.99, 55),
(5, 'Pride and Prejudice', 'Jane Austen', 10.99, 30);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email) VALUES
(20, 'Ali', 'Khan', 'ali.khan@gmail.com'),
(30, 'Fatima', 'Ahmed', 'fatima.ahmed@gmail.com'),
(40, 'Hassan', 'Malik', 'hassan.malik@gmail.com'),
(43, 'Ashiq', 'Hussain', 'ashiq.hussain@gmail.com'),
(50, 'Asim', 'Iqbal', 'asim.iqbal@gmail.com');


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 20, '2024-05-01', 58.97),
(2, 30, '2024-05-02', 41.98),
(3, 40, '2024-05-03', 27.98),
(4, 40, '2024-05-04', 44.97),
(5, 50, '2024-05-05', 26.98);

select * from Orders



----Q1
BEGIN TRANSACTION
UPDATE Customers SET Email='khan@gmail.com' where Customers.CustomerID=20
COMMIT;

select * from Customers


----Q2
BEGIN TRANSACTION
	
	SAVE TRANSACTION BeforeSale;
	INSERT INTO Orders VALUES (6, 43, '2024-05-09', 14.99)
	
COMMIT;

select * from Orders


----Q3

Drop Procedure PurchaseBook

CREATE PROCEDURE PurchaseBook @CustomerID INT, @BookID INT,	@OrderDate DATETIME, @amount DECIMAL(10,2)
AS
BEGIN

	BEGIN TRANSACTION;

	IF (SELECT StockQuantity FROM Books WHERE BookID = @BookID) > 0
	BEGIN
		INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
		VALUES (@CustomerID, @OrderDate, @amount);
		UPDATE Books
		SET StockQuantity = StockQuantity - 1
		WHERE BookID = @BookID;
END
ELSE
BEGIN

	THROW 50003, 'The book is out of stock.', 1;
	ROLLBACK TRANSACTION
END
COMMIT;
END
GO
 EXEC PurchaseBook @customerID = 45,@bookID = 7,@orderDate = '2024-05-09',@amount = 20.99;
 
 SELECT * FROM Orders;




