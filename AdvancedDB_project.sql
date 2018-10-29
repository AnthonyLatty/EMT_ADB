/*

Project Description
----------------------
Express Money Transfer Ltd operates a remittance service in Jamaica. Express has
several third party partners who utilize their services to transfer money between
countries. This project utilizes our DataBase Design project scenario.

CHANGE LOG 14.10.2018
------------------------
Added check validate gender entry in Client table
Added check to validate email entry in Employee table using a wildcard
Changed Emp_years_of_service in Employee table to a computed value
Changed Transaction_date_received in Transaction table to allow null values since this column may be updated at a later time
Changed Emp_mobile_number varchar size from 7 to 10 to allow entry of area code given the impending implementation of 658
Added data values for transaction records
Added views
Added 4 stored procedures


Group Members
-------------------
Marc-Anthony Latty (1403605)
Kristen Clarke (1608054)
Nicole Hamilton (1602246)
Javel Rowe (1402620)

*/

GO
create database Express_Money_Transfer;
GO

GO
use Express_Money_Transfer;
GO


GO
create table Client
(
  Client_trn varchar(9) primary key not null,
  Client_first_name varchar(50) not null,
  Client_middle_name varchar(50),
  Client_last_name varchar(50) not null,
  Client_dob date not null,
  Client_home_address varchar(100),
  Client_mobile_number varchar(7) not null,
  Client_gender char CHECK(Client_gender LIKE '[fF]' OR Client_gender LIKE '[mM]')
);
GO

GO
create table Employee(
  Emp_ID int  primary key not null, 
  Emp_first_name varchar(250) not null,
  Emp_middle_name varchar(250),
  Emp_last_name varchar(250) not null,
  Emp_position varchar(250),
  Emp_date_hired date not null,
  Emp_home_address varchar(250),
  Emp_email varchar(250) not null CHECK(Emp_email LIKE '%@%'), --ENSURE EMAIL GOES IN WITH  SYMBOL
  Emp_years_of_service as DATEDIFF(YEAR,Emp_date_hired,GETDATE()), --Changed this to a computed value
  Supervisor_ID int foreign key references Employee
)
GO

/*drop table Employee
drop table Transactions
drop table Employee_mobile_number
drop table Full_time_employee
drop table Part_time_employee
drop table Employee_transaction_handle_log */

GO
create table Transactions(
  Transaction_ID int identity(1,1) primary key not null,
  Transaction_trn varchar(9) foreign key references Client,
  Emp_ID int foreign key references Employee,
  Transaction_third_party_company varchar(250),
  Transaction_security_question varchar(250),
  Transaction_amount money not null CHECK(Transaction_amount > 0),
  Transaction_security_answer varchar(250),
  Transaction_date_sent date not null,
  Transaction_date_received date --CHECK(Transaction_date_received >= Transaction_date_sent) --changed this to allow null since the transaction may not be received on the date it was sent
)
GO

GO
create table Employee_mobile_number(
  Emp_ID int  primary key foreign key references Employee,
  Emp_mobile_number varchar(10) --changed to 10 from 7
);
GO
GO
create table Full_time_employee(
  Emp_ID int  primary key foreign key references Employee,
  Salary money not null CHECK(Salary > 0)
);
GO
GO
create table Part_time_employee(
  Emp_ID int  primary key foreign key references Employee,
  Number_of_days_worked int 
);
GO
GO
create table Employee_transaction_handle_log(
  Emp_ID int  foreign key references Employee,
  Transaction_ID int primary key foreign key references Transactions,
  Date_created date not null
);
GO


/*
  Populate Database with records
*/

GO
-- Insert into Employee table
insert into Employee (
						Emp_ID,
                        Emp_first_name,
                        Emp_middle_name,
                        Emp_last_name,
                        Emp_position,
                        Emp_date_hired,
                        Emp_home_address,
                        Emp_email,
                        Supervisor_ID)
  values (1,'Jennifer','Judia','Jonas','Manager','1992/05/12','25 King Street, Kingston','jennjones@gmail.com',1),
         (2,'Alicia','Kedesha','Lowe','Manager','05/05/1993','30 King Street, Kingston','lowe@gmail.com',1),
         (3,'David','Andrew','Smith','Teller','09/05/1992','Haughton Grove, Hanover','david@yahoo.com',2),
         (4,'Kristen','Kristinina','Cork','Manager','03/05/1992','12 Barnett Street, St. James','knina@gmail.com',2),
         (5,'Nicole','Nico','Hamlet','Manager','12/05/2000','25 Mango Street, Spanish Town','nicole@gmail.com',3),
         (6,'Mark','Anthony','Lotto','Manager','08/05/1992','25 King Street, Kingston','mark@gmail.com',4),
         (7,'Marc','Jeffrey','Latty','Teller','11/05/2003','55 King Street, Hanover','marc@yahoo.com',4),
         (8,'Jayvelle','Brad','Supreme','Manager','09/05/2004','25 Pear Street, Kingston','supremejay@gmail.com',5),
         (9,'Anna','Manina','Spokes','Manager','12/05/2006','100 King Street, Kingston','spokanna@gmail.com',5),
         (10,'Opal','Jeffrey','Winters','Teller','10/06/2010','250 Jones Street, Spanish Town','opal@gmail.com',6),
         (11,'Tess','Ann','Juniper','Teller','11/09/2015','25 Plum Street, Hanover','tessiper@gmail.com',6),
		 (12,'Jessica','Princess','Queen','Customer Support','10/09/2018','100 King Street, Kingston','jess@gmail.com',1),
         (13,'Julia','Sasha','Kilford','Customer Support','10/08/2018','250 Jones Street, Spanish Town','kilford@gmail.com',1),
         (14,'Kelcy','Anna','James','Customer Support','10/09/2018','25 Plum Street, Hanover','kelc@gmail.com',1);
GO

GO
-- Insert into client table
insert into Client (Client_trn,
                      Client_first_name,
                      Client_middle_name,
                      Client_last_name,
                      Client_dob,
                      Client_home_address,
                      Client_mobile_number,
                      Client_gender)
  values  ('659215486', 'Allison', 'Kaela', 'Parks', '1992-03-05', '25 King Street, Kingston', '2569458', 'F'),
          ('256984236', 'David', 'Andrew', 'Smith', '1990-12-12', 'Haughton Grove, Hanover', '5698456', 'M'),
          ('869541236', 'Dervon', 'George', 'Morrett', '1980-03-05', '12 Barnett Street, St. James', '2569845', 'M'),
          ('496235688', 'Paul', 'Carlos', 'James', '1987-10-01', '56 Pickle Drive, St.Ann', '6954856', 'M'),
          ('365899425', 'Beverly', 'Grace', 'Jenner', '1995-05-08', '2 Norwick Drive, St. Mary', '6954265', 'F'),
          ('155698236', 'Victoria', 'Giselle', 'Graham', '1972-10-11', 'Brick Lane, St. Thomas', '6958425', 'F'),
          ('589623000', 'Brandon', 'Marcus', 'Archer', '1990-01-06', 'Beckford Street, Clarendon', '8569251', 'M'),
          ('985692154', 'Ansley' ,'Andrew', 'Hill', '1974-09-10', 'Barnett Street, St.James', '3625496', 'M'),
          ('612548695', 'Jeffery', 'Marik', 'Ellis', '1972-10-09', 'Mountain View, Kingston', '2569845', 'M'),
          ('869542100', 'Mikayla', 'Stephanie', 'Richards', '1995-10-12', 'Catherine Mount, Westmoreland', '4956212', 'F');
GO

GO
-- Insert into Employee mobile number table
insert into Employee_mobile_number (Emp_ID, Emp_mobile_number)
  values (1,'8765217785'),
         (2,'8768463345'),
         (3,'8769886123'),
         (4,'8764430987'),
         (5,'8763421010'),
         (6,'8764102323'),
         (7,'8763039018'),
         (8,'8763890103'),
         (9,'8765021454'),
         (10,'8763050000'),
         (11,'8762340171');
GO

GO
-- Insert into Transactions table
insert into Transactions (Transaction_trn,
                          Emp_ID,
                          Transaction_third_party_company,
                          Transaction_security_question,
                          Transaction_amount,
                          Transaction_security_answer,
                          Transaction_date_sent,
                          Transaction_date_received)
values 
('659215486',2,'SAGICOR','What time of the day were you born?',50000,'Noon','2018-07-12','2018-07-13'),
('256984236',3,'NCB','What was your dream job as a child? ',10000,'Batman','2018-06-12','2018-06-15'),
('869541236',4,'JN','Who was your childhood hero? ',15000,'Clifford the Big Red Dog','2018-05-12','2018-05-14'),
('496235688',4,'JN','What is your childhood name?',23000,'Cailou','2018-04-12','2018-04-14'),
('365899425',12,'GRACE KENNEDY','What was the first concert you attended?',35000,'Winter Jawz','2018-04-12','2018-04-12'),
('155698236',12,'NCB','What is your mother''s middle name? ',40000,'Muriel','2018-09-12','2018-09-15'),
('985692154',12,'JN','What is your preferred musical genre? ',44000,'Jazz','2018-09-12','2018-09-14'),
('612548695',13,'JN','What was your high school mascot?',20000,'Tin Man','2018-09-12','2018-09-14'),
('869542100',13,'GRACE KENNEDY','Who was your first kiss?',22000,'KK','2018-03-12','2018-03-12');
GO

GO	 
SELECT * FROM Transactions
GO

GO
-- Insert into Full time employee table
insert into Full_time_employee (Emp_ID,Salary)
values (1,150000),
		(2,130000),
		(3,150000),
		(4,150000),
		(5,90000),
		(6,150000);
GO

GO		
select * from Part_time_employee 
GO		
		
		


GO
-- Insert into Part time employee table --change to regular insert statement
INSERT INTO Part_time_employee (Emp_ID,Number_of_days_worked)
SELECT Emp_ID,DATEDIFF(DAY,Emp_date_hired,GETDATE()) FROM Employee where DATEDIFF(DAY,Emp_date_hired,GETDATE()) < 365
GO

GO
-- Insert into Employee transaction handle table --change to regular insert statement
INSERT INTO Employee_transaction_handle_log(Emp_ID,Transaction_ID,Date_created)
SELECT Emp_ID,Transaction_ID,Transaction_date_sent FROM Transactions
GO

GO
select * from Employee_transaction_handle_log
GO
/*
  Demo 2: Stored Procedure and Functions
*/




-- Function that tracks employee
GO
CREATE FUNCTION Employee_Transaction_Tracker(@transaction_ID int)
RETURNS varchar(7)
AS
BEGIN
DECLARE @Emp_ID varchar(7)
SET @Emp_ID = (SELECT Emp_ID FROM Transactions WHERE Transaction_ID = @transaction_ID)

RETURN @Emp_ID
END
GO
-- end function



-- Function that get average employee time by third party company
GO
CREATE FUNCTION Avg_Transfer_time_by_3rd_party(@third_party_company_name varchar(50), @sentDate date, @receivedDate date)
RETURNS int
AS
BEGIN
DECLARE @avg_time int
SET @avg_time = (SELECT AVG(DATEDIFF(DAY,@sentDate,@receivedDate)) FROM Transactions WHERE Transaction_third_party_company = @third_party_company_name)
RETURN @avg_time
END
GO
-- end function



-- Function that get check employee security answer
GO
CREATE FUNCTION Security_Answer_Checker(@sec_answer varchar(50), @trn varchar(9)) --PASS TRN AS WELL
RETURNS char
AS
  BEGIN
    DECLARE @count int
    DECLARE @boolValue char
    SET @count = (SELECT COUNT(*) FROM Transactions
            INNER JOIN Client ON
            Transactions.Transaction_trn = Client.Client_trn
            WHERE Transaction_trn=@trn AND Transaction_security_answer = @sec_answer)
    IF(@count = 0)
    BEGIN
      SET @boolValue = 'F'
    END
    ELSE
    BEGIN
      SET @boolValue = 'T'
    END

    return @boolValue
  END
GO
-- end function

--DEMO 1 VIEWS--
/*Joins Part_time_employee, Full_time_employee & Employee tables together then puts Null for values that don't match. 
In this case, persons with a value for num days worked are PART TIME while those with Salary values are FULL TIME
*/
GO
CREATE VIEW Full_Employee_Details as
SELECT Employee.*,Number_of_days_worked,Salary from Employee 
full outer join Part_time_employee on Employee.Emp_ID = Part_time_employee.Emp_ID 
full outer join Full_time_employee on Employee.Emp_ID = Full_time_employee.Emp_ID
GO

GO
SELECT * FROM Full_Employee_Details
GO

/*
Joins Transactions, Client & Employee table to show the details for all clients who have carried out transactions.
The IS NOT NULL command ensures only clients who have carried out transactions are shown since the 
full outer join returns everything and shows null for the columns that do not match. 
*/
GO
CREATE VIEW Client_Transaction_Details as
SELECT Client.Client_first_name, Client.Client_trn, Transactions.Transaction_ID, Transactions.Transaction_amount,Transactions.Transaction_date_sent,Transactions.Emp_ID, Employee.Emp_first_name, Employee.Emp_last_name
FROM Transactions
full outer join Client on Transactions.Transaction_trn = Client.Client_trn
full outer join Employee on Transactions.Emp_ID = Employee.Emp_ID
WHERE Transactions.Transaction_amount IS NOT NULL
GO

GO
SELECT * FROM Client_Transaction_Details
GO

/*
Displays all the details of Supervisors as well as how many employees they are supervising
*/
GO
CREATE VIEW Supervisor_Details as
SELECT  Supervisors.Emp_ID,Supervisors.Emp_first_name,Supervisors.Emp_last_name,COUNT(Supervisors.Emp_ID) AS Num_Employees_Supervising,TeleNumbers.Emp_mobile_number,Supervisors.Emp_email 
FROM Employee Staff, Employee Supervisors, Employee_mobile_number TeleNumbers
WHERE Supervisors.Emp_ID = Staff.Supervisor_ID AND Supervisors.Emp_ID = TeleNumbers.Emp_ID
GROUP BY Supervisors.Emp_first_name,Supervisors.Emp_last_name,Supervisors.Emp_ID,TeleNumbers.Emp_mobile_number,Supervisors.Emp_email 
GO

GO
SELECT * FROM Supervisor_Details
GO

/*
Creates a subquery that creates the age groups of all clients then calculates and displays the total amount of 
money sent by those in that age group, the amount of persons in that age group as well as a count of the amount of transactions
they are carrying out 
*/
GO
CREATE VIEW Transaction_Overview as
SELECT subquery.AGE_GROUP,SUM(subquery.Transaction_amount) AS TOTAL_TRANSACTION_AMOUNT,COUNT(subquery.AGE_GROUP) AS AGE_GROUP_POPULATION,COUNT(subquery.Transaction_amount) AS TOTAL_AMOUNT_OF_TXN FROM					
(SELECT CASE 
	WHEN DATEDIFF(YEAR,Client_dob,GETDATE()) < 18 THEN '<18' 
	WHEN DATEDIFF(YEAR,Client_dob,GETDATE()) BETWEEN 18 AND 24 THEN '18-24'
	WHEN DATEDIFF(YEAR,Client_dob,GETDATE()) BETWEEN 25 AND 34 THEN '25-34'  
	WHEN DATEDIFF(YEAR,Client_dob,GETDATE()) BETWEEN 35 AND 44 THEN '35-44'  
	WHEN DATEDIFF(YEAR,Client_dob,GETDATE()) BETWEEN 45 AND 54 THEN '45-54'  
	WHEN DATEDIFF(YEAR,Client_dob,GETDATE()) BETWEEN 55 AND 64 THEN '55-64'  
	WHEN DATEDIFF(YEAR,Client_dob,GETDATE())  > 65 THEN '>65' 
END AS AGE_GROUP,Transactions.Transaction_amount
from Client
FULL OUTER JOIN Transactions
ON Client.Client_trn=Transactions.Transaction_trn) subquery 
GROUP BY subquery.AGE_GROUP
GO

GO
SELECT * FROM Transaction_Overview
GO
/*
Determines if an employee is FULL TIME or PART TIME then shows their ID, NAME and the amount of transactions they have carried out
as well as the total value of all these transactions
*/
GO
CREATE VIEW Employee_Performance AS
SELECT 
CASE 
	WHEN Transactions.Emp_ID in (SELECT Emp_ID FROM Part_time_employee) THEN 'Part Time' 
	WHEN Transactions.Emp_ID in (SELECT Emp_ID FROM Full_time_employee) THEN 'Full Time'
END 
AS Employee_Status,Transactions.Emp_ID,
Employee.Emp_first_name,Employee.Emp_last_name,COUNT(Transaction_ID) AS Txn_Count,SUM(Transaction_amount) AS Total_Txns_Value
FROM Transactions
INNER JOIN Employee
ON Transactions.Emp_ID = Employee.Emp_ID
GROUP BY Transactions.Emp_ID,Employee.Emp_first_name,Employee.Emp_last_name
GO

GO
SELECT * FROM Employee_Performance
GO

/*
Displays 3rd party company name, the amount of transactions they have delivered and their average delivery time.
*/
GO
CREATE VIEW Third_Party_Company_Performance AS
SELECT Transaction_third_party_company AS COMPANY_NAME, COUNT(Transaction_ID) AS NUM_TXNS,AVG(DATEDIFF(DAY,Transaction_date_sent,Transaction_date_received)) AS AVG_DELIVERY_TIME FROM Transactions
GROUP BY Transaction_third_party_company
GO

GO
SELECT * FROM Third_Party_Company_Performance
GO

/*
Displays whether a client has a birthday today or not
*/
GO
CREATE VIEW Birthdays_Today AS
SELECT * FROM Client
WHERE Client_dob = GETDATE()
GO

GO
SELECT * FROM Birthdays_Today
GO



--STORED PROCEDURES
GO
CREATE PROCEDURE dbo.sp_Insert_Client
(
  @Client_trn varchar(9),
  @Client_first_name varchar(50),
  @Client_middle_name varchar(50),
  @Client_last_name varchar(50) ,
  @Client_dob date,
  @Client_home_address varchar(100),
  @Client_mobile_number varchar(7),
  @Client_gender char
)

AS
BEGIN

INSERT INTO Client( Client_trn,Client_first_name,Client_middle_name,Client_last_name,Client_dob,Client_home_address,Client_mobile_number,Client_gender)
VALUES( 
		@Client_trn,
		@Client_first_name,
		@Client_middle_name,
		@Client_last_name,
		@Client_dob,
		@Client_home_address,
		@Client_mobile_number,
		@Client_gender
	   )
END
GO

GO
CREATE PROCEDURE dbo.sp_Count_Daily_TXNS

AS
BEGIN
RETURN SELECT COUNT(*) FROM Transactions WHERE Transaction_date_sent = GETDATE()
END
GO

GO
CREATE PROCEDURE dbo.sp_Mobile_Number_Lookup
(
	@IDnumber varchar(10),
	@tableName varchar(10)
)

AS
BEGIN

IF @tableName = 'Client'
BEGIN
SELECT Client_mobile_number FROM Client WHERE Client_trn = @IDnumber
END

IF @tableName = 'Employee'
BEGIN
SELECT Emp_mobile_number FROM Employee_mobile_number WHERE Emp_ID = CAST(@IDnumber AS INT)
END

END
GO


GO
CREATE PROCEDURE dbo.sp_Insert_Transaction 
(
  @Transaction_trn varchar(9) ,
  @Emp_ID int ,
  @Transaction_third_party_company varchar(250),
  @Transaction_security_question varchar(250),
  @Transaction_amount money ,
  @Transaction_security_answer varchar(250),
  @Transaction_date_sent date  ,
  @Transaction_date_received date,
  @date_Sent date output,
  @date_Received date output
  
)

AS
BEGIN
INSERT INTO Transactions(Transaction_trn,Emp_ID,Transaction_third_party_company,Transaction_security_question,Transaction_amount,Transaction_security_answer,Transaction_date_sent,Transaction_date_received) 
VALUES(
  @Transaction_trn ,
  @Emp_ID  ,
  @Transaction_third_party_company ,
  @Transaction_security_question ,
  @Transaction_amount  ,
  @Transaction_security_answer ,
  @Transaction_date_sent   ,
  @Transaction_date_received 
  )
END
select @date_Sent = @Transaction_date_sent;
select @date_Received = @Transaction_date_received;
GO

GO
CREATE PROCEDURE dbo.insert_client
(
  @Client_trn varchar(9) ,
  @Client_first_name varchar(50) ,
  @Client_middle_name varchar(50),
  @Client_last_name varchar(50) ,
  @Client_dob date ,
  @Client_home_address varchar(100),
  @Client_mobile_number varchar(7),
  @Client_gender char,
  @trn varchar(9) output,
  @mobile_num varchar(7) output,
  @DATE_OB date output
)

AS
BEGIN
insert into Client (Client_trn  ,
  Client_first_name  ,
  Client_middle_name ,
  Client_last_name  ,
  Client_dob  ,
  Client_home_address ,
  Client_mobile_number ,
  Client_gender)
  VALUES(
  @Client_trn  ,
  @Client_first_name  ,
  @Client_middle_name ,
  @Client_last_name  ,
  @Client_dob  ,
  @Client_home_address ,
  @Client_mobile_number ,
  @Client_gender)
  select @trn = @Client_trn;
  select @mobile_num  = @Client_mobile_number;
  END

GO

GO
CREATE PROCEDURE dbo.sp_insert_Employee
(
  @Emp_ID int  , 
  @Emp_first_name varchar(250),
  @Emp_middle_name varchar(250),
  @Emp_last_name varchar(250) ,
  @Emp_position varchar(250),
  @Emp_date_hired date ,
  @Emp_home_address varchar(250),
  @Emp_email varchar(250) ,
  @Supervisor_ID int,
  @date_hired date output 
)
AS
BEGIN
INSERT INTO Employee (Emp_ID,Emp_first_name ,Emp_middle_name,Emp_last_name,Emp_position ,Emp_date_hired ,Emp_home_address ,Emp_email,Supervisor_ID)

  VALUES (@Emp_ID   , 
  @Emp_first_name ,
  @Emp_middle_name ,
  @Emp_last_name  ,
  @Emp_position ,
  @Emp_date_hired  ,
  @Emp_home_address ,
  @Emp_email  ,
  @Supervisor_ID  )
  select @date_hired = @Emp_date_hired;
 END

GO


--Transactions--
GO
BEGIN TRANSACTION 
DECLARE @date_Sent date;
DECLARE @date_Received date;

EXECUTE dbo.sp_Insert_Transaction 155698236, 3, 'Sagicor','What is your childhood name?',100000,'Mel Mel','2018/09/12','2018/09/11', @date_Sent output,@date_Received output; 

if DATEDIFF(DAY,@date_Sent,@date_Received) < 0
begin
ROLLBACK TRANSACTION
print 'Date received cannot be earlier than date sent'
end
ELSE
BEGIN
COMMIT TRANSACTION
END

select * from Client
GO

GO
--use len to check length of trn
DECLARE @trn varchar(9);
DECLARE @mobile_num varchar(7);


BEGIN TRANSACTION
execute dbo.insert_client '555888777','Vick','M','Kant','1980/12/12','Montego Bay, St. james','6987741','F',@trn output,@mobile_num output,@DATE_OB output
if LEN(@mobile_num) < 7
BEGIN
ROLLBACK TRANSACTION
END
ELSE
BEGIN
COMMIT TRANSACTION
END


GO

GO
DECLARE @trn varchar(9);
DECLARE @DATE_OB date;



BEGIN TRANSACTION
execute dbo.insert_client '555888777','Vick','M','Kant','1980/12/12','Montego Bay, St. james','6987741','F',@trn output,@mobile_num output,@DATE_OB output
if LEN(@trn) < 9
BEGIN
ROLLBACK TRANSACTION
END
ELSE
BEGIN
COMMIT TRANSACTION
END
GO



GO
DECLARE @trn varchar(9);
DECLARE @DATE_OB date;



BEGIN TRANSACTION
execute dbo.insert_client '555888777','Vick','M','Kant','1980/12/12','Montego Bay, St. james','6987741','F',@trn output,@mobile_num output,@DATE_OB output
if DATEDIFF(YEAR,@DATE_OB,GETDATE()) > 200
BEGIN
ROLLBACK TRANSACTION
END
ELSE
BEGIN
COMMIT TRANSACTION
END
GO

GO
declare @date_hired date;
BEGIN TRANSACTION
execute dbo.sp_insert_Employee 50,'Vick','M','Kant','Teller','2000/12/10','10 Molynes Road, Kingston','vick@gmail.com',2,@date_hired output
if DATEDIFF(YEAR,@date_hired,GETDATE()) > 100
BEGIN
ROLLBACK TRANSACTION
END
ELSE
BEGIN
COMMIT TRANSACTION
END
GO
select * from employee 

CREATE PROCEDURE sp_frequent
AS 
BEGIN
DECLARE @count int;
DECLARE @max int;
SELECT @count = (SELECT MAX(SUBQUERY1.third_party)FROM (SELECT COUNT(Transaction_third_party_company)as third_party from Transactions group by Emp_ID) SUBQUERY1)
SELECT @count;
END

EXECUTE sp_frequent;
select * from Transactions