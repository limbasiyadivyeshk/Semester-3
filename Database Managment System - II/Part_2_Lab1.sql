Create Table Person(
	PersonId		int					Primary Key,
	PersonName		Varchar(50)			Not Null,
	Salary			Decimal(8,2)		Not Null,
	JoiningDate		Datetime			Not NUll,
	City			Varchar(50)			NOt Null,
	Age				int,				
	BirthDate		Datetime			Not Null
)

Create Table PersonLog(
	PLogId		int						Primary Key Identity(101, 1),
	PesonId		int						Not Null,
	PersonName	Varchar(50)				Not Null,
	Operation	Varchar(50)				Not Null,
	UodatedDate	Datetime				Not Null
)
=========================================================

--1. Create INSERT, UPDATE & DELETE Stored Procedures for Person table.
-- PR_Person_Insert 1,'Karan',25555,'2014-01-15','Rajkot',19,'2003-06-30'
Create Procedure PR_Person_Insert
	@PersonID			int,
	@PersonName			Varchar(50),
	@Salary				Decimal(8, 2),
	@JoiningDate		DateTime,
	@City				Varchar(50),
	@Age				int,
	@BirthDate			Datetime
AS
Begin
	Insert into Person
	Values(
		@PersonID,	
		@PersonName,	
		@Salary,		
		@JoiningDate,
		@City,		
		@Age,		
		@BirthDate	
	)
End

Select * From Person

----------------------------------------------
-- PR_Person_Update 1,'moliya',20001,'2015-01-15','Rajkot',20,'2003-09-09'
Create Procedure PR_Person_Update
	@PersonID			int,
	@PersonName			Varchar(50),
	@Salary				Decimal(8, 2),
	@JoiningDate		DateTime,
	@City				Varchar(50),
	@Age				int,
	@BirthDate			Datetime
AS
Begin
	Update Person
	Set
		PersonName		=	@PersonName,	
		Salary			=	@Salary,		
		JoiningDate		=	@JoiningDate,
		City			=	@City,		
		Age				=	@Age,		
		BirthDate		=	@BirthDate	
	Where
		PersonId		=	@PersonId
End

Select * From Person

---------------------------------------------
-- PR_Person_Delete	1
Create Procedure PR_Person_Delete 
	@PersonID int
As
Begin
	Delete From Person
	Where PersonId = @PersonId
End
	

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the Person table. For that,
--create a new table PersonLog to log (enter) all operations performed on the Person table.
Create trigger TR_Person_Insert
On Person
For Insert
As
Begin
	Declare	@PersonId int, @PersonName Varchar(50)
	Select	@PersonId = inserted.PersonId,
			@PersonName	= inserted.PersonName
	From Inserted

	Insert into PersonLog Values(@PersonId, @PersonName, 'Insert', getDate())
End

------------------------------------------------
Create trigger TR_Person_Update
On Person
For Update
As
Begin
	Declare	@PersonId int, @PersonName Varchar(50)
	Select	@PersonId = inserted.PersonId,
			@PersonName	= inserted.PersonName
	From Inserted

	Insert into PersonLog Values(@PersonId, @PersonName, 'Update', getDate())
End
------------------------------------------------
Create trigger TR_Person_Delete
On Person
For	Delete
As
Begin
	Declare	@PersonId int, @PersonName Varchar(50)
	Select	@PersonId = deleted.PersonId,
			@PersonName	= deleted.PersonName
	From Deleted

	Insert into PersonLog Values(@PersonId, @PersonName, 'delete', getDate())
End


--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Person
--table. For that, log all operation performed on the Person table into PersonLog.

Create trigger TR_Person_InsertInstead
On Person
Instead of Insert
As
Begin
	Declare	@PersonId int, @PersonName Varchar(50)
	Select	@PersonId = inserted.PersonId,
			@PersonName	= inserted.PersonName
	From Inserted

	Insert into PersonLog Values(@PersonId, @PersonName, 'Insert', getDate())
End

------------------------------------------------
Create trigger TR_Person_UpdateInstead
On Person
Instead of Update
As
Begin
	Declare	@PersonId int, @PersonName Varchar(50)
	Select	@PersonId = inserted.PersonId,
			@PersonName	= inserted.PersonName
	From Inserted

	Insert into PersonLog Values(@PersonId, @PersonName, 'Update', getDate())
End
------------------------------------------------
Create trigger TR_Person_DeleteInstead
On Person
Instead of Delete
As
Begin
	Declare	@PersonId int, @PersonName Varchar(50)
	Select	@PersonId = deleted.PersonId,
			@PersonName	= deleted.PersonName
	From Deleted

	Insert into PersonLog Values(@PersonId, @PersonName, 'delete', getDate())
End


--4. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints 
--‘Record deleted successfully from PersonLog’.
Create	Trigger TR_PersonLog_Delete
On PersonLog
For Delete
As
Begin
	Print 'record Delete SuccessFully.'
End


--5. Create INSERT trigger on person table, which calculates the age and update that age in Person 
--table.
Alter Trigger TR_Person_CulculateDate
On Person
For Insert
As
Begin
	Declare @PersonId int, @BirthDate Datetime
	Select @PersonId = inserted.PersonID,
			@BirthDate = inserted.birthDate
	From Inserted

	Update Person 
	Set Age = DATEDIFF(year, @BirthDate, GETDATE())

	Where PersonId = @PersonId
End

Insert Into Person values(2,'Kishan',456789,'2015-06-06','Baroda',Null,'2003-06-06')

Select * from Person
Select * from PersonLog
