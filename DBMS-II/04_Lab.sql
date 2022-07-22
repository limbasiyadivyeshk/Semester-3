--• Stored Procedures
--1. All tables Insert, Update & Delete

-- PR_Person_Insert 108,'Kishan', 'Moliya',150000, '2003-06-30', 3, 14 
Create procedure PR_Person_Insert
	@WorkerID	int,
	@Fname		varchar(50),
	@Lname		varchar(50),
	@salary		decimal(8, 2),
	@joindate	datetime,
	@dpartID	int,
	@designID	int
As 
Begin
	Insert into Person(
			WorkerID,
			FirstName,	
			LastName,	
			Salary,		
			JoiningDate,	
			DepartmentID,
			DesignationID
		)
	Values(
		@WorkerID,
		@Fname,		
		@Lname,		
		@salary,		
		@joindate,	
		@dpartID,	
		@designID	
	)
End

select * from Person
	
---------------------------

-- PR_Depart_Insret 5,'Computer'
Create Procedure PR_Depart_Insret
	@DepartmentId   int,
	@DepartmentName Varchar(50)
As
Begin
	Insert Into Department(
		DepartmentId,
		DepartmentName
	)
	Values(
	@DepartmentId,
	@DepartmentName
	)
End

Select * From Department
---------------------------

-- PR_Designation_Insert 16,'Assistant'
Create Procedure PR_Designation_Insert
	@DesignationID	  int,
	@DesignatioinName Varchar(50)
AS
Begin

	Insert Into Designation(
		DesignationID,	 
		DesignationName
	)
	Values(
	@DesignationID,	 
	@DesignatioinName
	)
End

Select * From Designation

==========================================

-- PR_Person_Update 105, 'Kishan', 'Moliya', 185400, '2003-07-30', 2, 14
Create Procedure PR_Person_Update
	@workerID   int,
	@Fname		varchar(100),
	@Lname		varchar(100),
	@salary		decimal(8, 2),
	@joindate	datetime,
	@dpartID	int,
	@designID	int
As 
Begin
		Update Person
		Set
			FirstName		=	@Fname,	
			LastName		=	@Lname,	
			Salary			=	@salary,
			JoiningDate		=	@joindate,
			DepartmentID	=	@dpartID,
			DesignationID	=	@designID			
								
		Where
			WorkerID	=	@workerID
End

Select * From Person

------------------------------

-- PR_Department_Update 4,'Me'
Create procedure PR_Department_Update
	@DepartmentID	int,
	@DepartmentName		varchar(50)
As 
Begin
		 Update Department
		 Set
				DepartmentName = @DepartmentName
		Where
			DepartmentId = @DepartmentID
End

select * from Department

------------------------------

-- PR_Designation_Update 13,'Laymen'
Create Procedure PR_Designation_Update
	@DesignationID	 int,	 
	@DesignationName Varchar(50)
As
Begin
	Update Designation
	Set
		DesignationName = @DesignationName
	Where
		DesignationID = @DesignationID
End

Select * From Designation

=========================================

-- PR_Person_Delete 108
Create Procedure PR_Person_Delete
	@WorkerID int
As
Begin
	Delete From Person
	Where WorkerID = @WorkerID
End

-----------------------------------------

-- PR_Department_Delete 5
Create Procedure PR_Department_Delete
	@DepartmentID int
As
Begin
	Delete From Department
	Where DepartmentID = @DepartmentID
End
--------------------------------------------

-- PR_Designation_Delete 16
Create Procedure PR_Designation_Delete
	@DesignationID int
As
Begin
	Delete From Designation
	Where DesignationID = @DesignationID
End


--2. All tables SelectAll (If foreign key is available than do write join and take columns on select list)

-- PR_Person_SelectAllWith_FK
Create Procedure PR_Person_SelectAllWith_FK
As
Begin
	Select p.WorkerID, p.FirstName, p.LastName, p.JoiningDate, p.Salary,
		   d.DepartmentID, d.DepartmentName, dd.DesignationID, dd.DesignationName
	From person p
	Inner Join Department d
	On p.DepartmentID = d.DepartmentID
	Right Outer Join Designation dd
	On p.DesignationID = dd.DesignationID
End

--3. All tables SelectPK

-- PR_Person_Select_PK 107
Create Procedure PR_Person_Select_PK
	@WorkerID int
As
Begin
	Select * from Person
	Where WorkerID = @WorkerID
End
----------------------------

-- PR_Department_Select_PK 3
Create Procedure PR_Department_Select_PK
	@DepartmentID int
As
Begin
	Select * from Department
	Where DepartmentID = @DepartmentID
End
----------------------------

-- PR_Designation_SelectByPK 14
Create Procedure PR_Designation_SelectByPK
@designationID	int
as
Begin
	Select *
	From Person
	Where DesignationID = @designationID
End


--4. Create Procedure that takes Department Name & Designation Name as Input and Returns a 


--table with Worker’s First Name, Salary, Joining Date & Department Name.
--5. Create Procedure that takes FirstName as an input parameter and displays’ all the details of 
--the worker with their department & designation name.
--6. Create Procedure which displays department wise maximum, minimum & total salaries.



--• Views
--1. Create a view that display first 100 workers details.
--2. Create a view that displays designation wise maximum, minimum & total salaries.
--3. Create a view that displays Worker’s first name with their salaries & joining date, it also displays 
--duration column which is difference of joining date with respect to current date.
--4. Create a view which shows department & designation wise total number of workers.
--5. Create a view that displays worker names who don’t have either in any department or 
--designation.



--• User Defined Functions
--1. Create a table valued function which accepts DepartmentID as a parameter & returns a worker 
--table based on DepartmentID.
--2. Create a table valued function which returns a table with unique city names from worker table.
--3. Create a scalar valued function which accepts two parameters start date & end date, and 
--returns a date difference in days.
--4. Create a scalar valued function which accepts two parameters year in integer & month in 
--integer and returns total days in passed month & year.
--5. Create a scalar valued function which accepts two parameters year in inte