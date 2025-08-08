

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-------------------  part 1 (2)


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


select * from Customer
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

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

select * from Account
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

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
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

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





--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
------ Question 3

------1 and 4

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


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

------2 and 5
DROP TRIGGER insert_transaction;
CREATE TRIGGER insert_transaction
ON Transactionn
AFTER INSERT
AS
BEGIN	
    INSERT INTO Audit_Trail (user_id,action,Timestamp,Details)
    VALUES (92,'Amount Inserted',GETDATE(), 'Account 92 deposit money');
END;

	Insert into Transactionn values(4,92,'deposit',2500, GETDATE())


DROP TRIGGER delete_transaction;
CREATE TRIGGER delete_transaction
ON Transactionn
AFTER DELETE
AS
BEGIN	
    INSERT INTO Audit_Trail (user_id,action,Timestamp,Details)
    VALUES (92,'Transaction Deleted',GETDATE(), 'Transaction form Accont 92 deleted');
END;



Insert into Transactionn values(4,92,'deposit',500, GETDATE())
Insert into Transactionn values(5,92,'deposit',1000, GETDATE())
Insert into Transactionn values(6,92,'deposit',500, GETDATE())
Insert into Transactionn values(7,92,'deposit',3000, GETDATE())
Insert into Transactionn values(8,92,'deposit',2500, GETDATE())


select * from audit_trail



--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
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

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
------7

select Account.Account_ID , Customer.Name, Account.Account_Type, Transactionn.Transaction_Type, Transactionn.Amount, Transactionn.Timestamp
FROM Account 

inner join Customer
ON Customer.Customer_ID = Account.Customer_ID

inner join Transactionn 
ON Transactionn.Account_ID = Account.Account_ID

WHERE Account.Account_ID = 92;

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
