


--------------------------------  part 1 (2)
drop table Customer
CREATE TABLE Customer (
    Customer_ID Float PRIMARY KEY,
    Name NVARCHAR(255),
	Email NVARCHAR(255),
	Phone float,
	Address NVARCHAR(255),
 
);
---------  First import data and then copy all the data into existing table
Insert Into [dbo].[Customer](customer_ID,name,email,phone,address)
Select Customer_ID,name,email,phone,address from [dbo].[Customer$]



drop table Account
CREATE TABLE Account 
(
    Account_ID float PRIMARY KEY,
    Customer_ID float,
	Account_Type NVARCHAR(255),
    Balance float,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

Insert Into [dbo].[Account](Account_ID,Customer_ID,Account_Type,Balance)
Select Account_ID, Customer_ID,Account_type,Balance from [dbo].['Account Table$']


drop table transactionn
CREATE TABLE Transactionn 
(
    Transaction_ID float PRIMARY KEY,
    Account_ID float,
    Transaction_Type nVARCHAR(255),
    Amount float,
    Timestamp DATETIME,
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID)
);
Insert Into [dbo].[Transactionn](Transaction_ID,Account_ID,Transaction_Type,Amount,Timestamp)
Select Transaction_ID,Account_ID,Transaction_Type,Amount,Timestamp from [dbo].[Transaction$]



drop table audit_trail
CREATE TABLE Audit_Trail 
(
    Audit_ID int IDENTITY(1,1) PRIMARY KEY,
    user_id float,
    action nvarchar(255),
    Timestamp DATETIME, 
    Details VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Account(Account_ID)
);

Insert Into [dbo].[Audit_Trail](user_id,action,Timestamp, Details)
Select user_id,action,Timestamp, Details from [dbo].[Audit_Trail$]


------- Part no 3
----------  1 and 4

DROP TRIGGER insert_customer;
CREATE TRIGGER insert_customer
ON Customer
AFTER INSERT
AS
BEGIN
	Insert into Account values(92,5,'checking',1000)
    INSERT INTO Audit_Trail (user_id,action,Timestamp,Details)
    VALUES (92,'Insert Customer',GETDATE(), 'New Customer added');
END;


Insert into Customer values (4,'Hashim Awan','awanhashim90@gmail.com','0983412321','street2,main road')
---  adding value by value and have to manuallly add the a new customer ID and account ID in a trigger to follow the requirements.
Insert into Customer values (5,'Mahad Rehman','durranimahad80@gmail.com','02392132','street3,main Block')


-----------3 and 6

Drop trigger Update_Trigger
CREATE TRIGGER Update_Trigger
ON Account
AFTER UPDATE
AS
BEGIN
      INSERT INTO Audit_Trail (user_id,action,Timestamp,Details)
    VALUES (76,'Update',GETDATE(), 'Balance Updated');
END;


UPDATE Account
SET Balance = Balance - 100
WHERE Account_ID = 76;

Select* from Audit_Trail
Select* from account

---==========               REMAINING
----------------------------------    FROM GPT For Understanding
--2
CREATE TRIGGER trg_insert_delete_transaction
ON Transaction
AFTER INSERT, DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO Audit_Trail (Timestamp, Operation_Performed, Cashier_ID)
        VALUES (GETDATE(), 'Insert', NULL);
    END;
    ELSE
    BEGIN
        INSERT INTO Audit_Trail (Timestamp, Operation_Performed, Cashier_ID)
        VALUES (GETDATE(), 'Delete', NULL);
    END;
END;


--3

--4

-- Inserting a new customer
INSERT INTO Customer (Customer_ID, Name, Account_Type)
VALUES (1, 'John Doe', 'Savings');

-- Creating an account for the new customer
INSERT INTO Account (Account_ID, Customer_ID, Balance)
VALUES (101, 1, 0);


--5
-- Performing financial transactions
INSERT INTO Transaction (Account_ID, Transaction_Type, Amount, Timestamp)
VALUES (101, 'Deposit', 100, GETDATE()),
       (101, 'Withdrawal', 50, GETDATE()),
       (101, 'Deposit', 200, GETDATE()),
       (101, 'Withdrawal', 100, GETDATE());


-- 6
-- Updating balance of the customer
UPDATE Account
SET Balance = Balance + 50
WHERE Account_ID = 101;


--7 


-- Query to check all transactions performed by the customer
SELECT C.Account_ID, C.Name, C.Account_Type, T.Transaction_Type, T.Amount, T.Timestamp
FROM Customer C
JOIN Account A ON C.Customer_ID = A.Customer_ID
JOIN Transaction T ON A.Account_ID = T.Account_ID
WHERE C.Customer_ID = 1;

