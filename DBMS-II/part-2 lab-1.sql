
--1.  Create INSERT, UPDATE & DELETE Stored Procedures for Person table.
--I.
create Procedure PR_Person_Info_Insert
	@PersonID		int,
	@PersonName		Varchar(50),
	@Salary			Decimal(8,2),
	@JoiningDate	Datetime,
	@City			Varchar(100),
	@Age			int,
	@BirthDate		Datetime

As
begin
	insert into Person_Info
	(
		PersonID,
		PersonName,
		Salary,
		JoiningDate,
		City,
		Age,
		BirthDate
	)	
	values 
	(
			@PersonID,
			@PersonName,
			@Salary,
			@JoiningDate,
			@City,
			@Age,
			@BirthDate
			)
end

insert into Person_Info

	values 
	(
		1,'Divyesh',10000,'2020-01-01','Rajkot',22,'2000-01-01'
			)

exec PR_Person_Info_Insert 9,'Divyesh',10000,'2020-01-01','Rajkot',22,'2000-01-01'

select * from Person_Info 
select * from PersonLog


--II.

Create Procedure PR_Person_Info_Update

	@PersonID		int,
	@PersonName		Varchar(50),
	@Salary			Decimal(8,2),
	@JoiningDate	Datetime,
	@City			Varchar(100),
	@Age			int,
	@BirthDate		Datetime
As
begin
update Person_Info 
set PersonName = @PersonName,
	Salary = @Salary,
	JoiningDate = @JoiningDate,
	City = @City,
	Age = @Age,
	BirthDate = @BirthDate	
where PersonID = @PersonID

end

exec PR_Person2_Update 1,'Divyesh',10000,'1-1-2020','Ahemdabad',22,'1-1-2000'

--III.

create Procedure PR_Person_Info_Delete
	@personID		int

as
begin

	delete from Person_Info
	where PersonID=@personID

end

exec PR_Person2_Delete 1


--2.Create a trigger that fires on INSERT, UPDATE and DELETE operation on the Person table. For that, 
--create a new table PersonLog to log (enter) all operations performed on the Person table.
--I.
	Create TRIGGER TR_Person_Info_Insert
	on Person_Info
	for insert
	as
	begin
	Declare		
		@PersonID		int,
		@PersonName		Varchar(50)
		
	select	@PersonID = PersonID from inserted
	select	@PersonName = PersonName from inserted

	insert into PersonLog
	(
	PersonID,
	PersonName,
	Operation,
	UpdatedDate
	)
	values (
			@PersonID,
			@PersonName,
			'record insert',
			GETDATE()
			)
	end

--II.

	create Trigger TR_Person2_Update
	on Person_Info
	for update
	as
	begin
	Declare		
		@PersonID		int,
		@PersonName		Varchar(50)
		
	select	@PersonID = PersonID from inserted
	select	@PersonName = PersonName from inserted

	insert into PersonLog
	values (
			@PersonID,
			@PersonName,
			'record insert',
			GETDATE()
			)
	end