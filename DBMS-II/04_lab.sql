Create Table Designation(
	DesignationID		int				Primary Key	Identity(11, 1),
	DesignationName		varchar(100)	Not Null	Unique
)



Create Table Department(
	DepartmentID		int				Primary Key Identity(1, 1),
	DepartmentName		varchar(100)	Not Null	Unique
)



Create Table Person(
	WorkerID			int				Primary Key Identity(101, 1),
	FirstName			varchar(100)	Not Null,
	LastName			varchar(100)	Not Null,
	Salary				decimal(8, 2)	Not Null,
	JoiningDate			datetime		Not Null,
	DepartmentID		int				Foreign Key References Department(DepartmentID),
	DesignationID		int				Foreign Key	References Designation(DesignationID)
)



------------- Records ------------

Insert into Designation Values ('Jobber')
Insert into Designation Values ('Welder')
Insert into Designation Values ('Clerk')
Insert into Designation Values ('Manager')
Insert into Designation Values ('CEO')


Insert into Department Values ('Admin')
Insert into Department Values ('IT')
Insert into Department Values ('HR')
Insert into Department Values ('Account')


Insert into Person Values ('Rahul', 'Anshu', 56000, '1990-01-01', 1, 12)
Insert into Person Values ('Hardik', 'Hinsu', 18000, '1990-09-25', 2, 11)
Insert into Person Values ('Bhavin', 'Kamani', 25000, '1991-05-14', Null, 11)
Insert into Person Values ('Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13)
Insert into Person Values ('Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15)
Insert into Person Values ('Priya ', 'Mehta', 25000, '1990-10-18', 2, Null)
Insert into Person Values ('Neha', 'Trivedi', 18000, '2014-02-20', 3, 15)


-------------------------------------------------------------------------------------------------------------------------------------------------


				-->>>>>>>>>>>>>>>• Stored Procedures •<<<<<<<<<<<<<<<--


--1. All tables Insert, Update & Delete
	
	-- PR_Person_Insert 'Kishan', 'Moliya', 75000 ,'2021-10-04', 4, 14
	Create Procedure PR_Person_Insert
	@Fname		varchar(100),
	@Lname		varchar(100),
	@salary		decimal(8, 2),
	@joindate	datetime,
	@dpartID	int,
	@designID	int
	as 
	Begin
		Insert into Person(
			FirstName,	
			LastName,	
			Salary,		
			JoiningDate,	
			DepartmentID,
			DesignationID
		)

		Values(
			@Fname,	
			@Lname,	
			@salary,	
			@joindate,
			@dpartID,
			@designID
		)
	End
---------------------

	-- PR_Department_Insert 'CSE'
	Create Procedure PR_Department_Insert
	@Dpartname		varchar(100)
	as 
	Begin
		Insert into Department(
			DepartmentName
		)

		Values(
			@Dpartname
		)
	End
---------------------

	-- PR_Designation_Insert 'Other'
	Create Procedure PR_Designation_Insert
	@DesignName		varchar(100)
	as 
	Begin
		Insert into Designation(
			DesignationName
		)

		Values(
			@DesignName
		)
	End


--=======================================================================================================

	-- PR_Person_Update 108, 'Karan', 'Khunt', 85400, '2003-06-30', 2, 14
	Create Procedure PR_Person_Update
	@workerID   int,
	@Fname		varchar(100),
	@Lname		varchar(100),
	@salary		decimal(8, 2),
	@joindate	datetime,
	@dpartID	int,
	@designID	int
	as 
	Begin
			Update Person
			Set
				FirstName		=	@Fname,	
				LastName		=	@Lname,	
				Salary			=	@salary,
				JoiningDate		=	@joindate,
				DepartmentID		=	@dpartID,
				DesignationID		=	@designID			
								
			Where
				WorkerID	=	@workerID
	End
---------------------


	-- PR_Department_Update 4, 'ME'
	Create Procedure PR_Department_Update
	@DpartID		int,
	@Dpartname		varchar(100)
	as 
	Begin
		Update Department
		Set
			DepartmentName	= @Dpartname
		Where
			DepartmentID = @DpartID
	End
---------------------


	-- PR_Designation_Update 12, 'Architecture'
	Create Procedure PR_Designation_Update
	@DesignID		int,
	@DesignName		varchar(100)
	as 
	Begin
		Update Designation
		Set
			DesignationName	=	@DesignName
		Where
			DesignationID	=	@DesignID
	End


--=======================================================================================================

	-- PR_Person_Delete 108
	Create Procedure PR_Person_Delete
	@workerID	int
	as
	Begin
		Delete From Person
		Where WorkerID	=	@workerID
	End
---------------------


	-- PR_Department_Delete 5
	Create Procedure PR_Department_Delete	
	@dpartID	int
	as
	Begin
		Delete From Department
		Where DepartmentID	=	@dpartID
	End
---------------------


	-- PR_Designation_Delete 16
	Create Procedure PR_Designation_Delete	
	@designID	int
	as
	Begin
		Delete From Designation
		Where DesignationID	=	@designID
	End
---------------------






--2. All tables SelectAll (If foreign key is available than do write join and take columns on select list)

	-- PR_Person_SelectAllwithFK
	Create Procedure PR_Person_SelectAllwithFK
	as
	Begin
		Select p.WorkerID, p.FirstName, p.LastName, p.JoiningDate, p.Salary,
			   dp.DepartmentID, dp.DepartmentName, ds.DesignationID, ds.DesignationName
		From Person p
		Inner Join Department dp
		on p.DepartmentID = dp.DepartmentID
		Right Outer Join Designation ds
		on p.DesignationID = ds.DesignationID
	End




--3. All tables SelectPK

	-- PR_Person_SelectByPK 107
	Create Procedure PR_Person_SelectByPK
	@workerID	int
	as
	Begin
		Select *
		From Person
		Where WorkerID = @workerID
	End

--==========================================

	-- PR_Department_SelectByPK 1
	Create Procedure PR_Department_SelectByPK
	@departmentID	int
	as
	Begin
		Select *
		From Person
		Where DepartmentID = @departmentID
	End

--==========================================

	-- PR_Designation_SelectByPK 14
	Create Procedure PR_Designation_SelectByPK
	@designationID	int
	as
	Begin
		Select *
		From Person
		Where DesignationID = @designationID
	End




--4. Create Procedure that takes Department Name & Designation Name as Input and Returns a table with WorkerÃ¢â‚¬â„¢s First Name, Salary, Joining Date & Department Name.
	
	-- PR_Person_SelectBydpNameANDdsName 'Admin', 'Clerk'
	Create Procedure PR_Person_SelectBydpNameANDdsName
	@departmentName		varchar(100),
	@desinationName		varchar(100)
	as
	Begin
		Select p.FirstName, p.Salary, p.JoiningDate, dp.DepartmentName
		From Person p
		Inner Join Department dp
		on p.DepartmentID = dp.DepartmentID
		Inner Join Designation ds
		on p.DesignationID = ds.DesignationID
		Where dp.DepartmentName = @departmentName
		and	  ds.DesignationName = @desinationName
	End




--5. Create Procedure that takes FirstName as an input parameter and displaysÃ¢â‚¬â„¢ all the details of the worker with their department & designation name.

	-- PR_Person_SelectByFirstName 'Bhoomi'
	Create Procedure PR_Person_SelectByFirstName
	@firstName	varchar(100)
	as
	Begin
		Select p.WorkerID, p.FirstName, p.LastName, p.JoiningDate, p.Salary,
			   dp.DepartmentID, dp.DepartmentName, ds.DesignationID, ds.DesignationName
		From Person p
		Inner Join Department dp
		on p.DepartmentID = dp.DepartmentID
		Right Outer Join Designation ds
		on p.DesignationID = ds.DesignationID
		Where p.FirstName = @firstName
	End




--6. Create Procedure which displays department wise maximum, minimum & total salaries.

	-- PR_Person_DepartmentWiseSalaries
	Create Procedure PR_Person_DepartmentWiseSalaries
	as
	Begin
		Select Distinct Department.DepartmentName, Max(Salary) as Max_Sal, Min(Salary) as Min_Sal, Sum(Salary) as Total_Sal
		From Person
		Inner Join Department
		on Person.DepartmentID = Department.DepartmentID
		Group by Department.DepartmentName
	End










--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		

				-->>>>>>>>>>>>>>>• User Defined Functions •<<<<<<<<<<<<<<<--


--1. Create a table valued function which accepts DepartmentID as a parameter & returns a worker table based on DepartmentID.
	
	Create Function FN_Person_DepartmentID(@departmentID	int)
	Returns Table
	as
	
		Return(
			Select * 
			From Person
			Where DepartmentID = @departmentID
		)

	Select * From FN_Person_DepartmentID(1)

	

--2. Create a table valued function which returns a table with unique city names from worker table.

	Create Function FN_Person_uniqueCity()
	Returns Table
	as

		Return(
			Select Distinct City, WorkerID, FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID 
			From Person
		)

	Select * From FN_Person_uniqueCity()



--3. Create a scalar valued function which accepts two parameters start date & end date, and returns a date difference in days.

	Create Function FN_DateDiff_Days(
		@startDate date,
		@endDate date
	)
	Returns int
	as
	Begin
		Return DateDiff(day, @startDate, @endDate)
	End

	Select dbo.FN_DateDiff_Days('2022-07-08', '2022-08-08')



--4. Create a scalar valued function which accepts two parameters year in integer & month in integer and returns total days in passed month & year.

	Create Function FN_NumberOfTotalDays(
		@year	int,
		@month	int 
	)
	Returns int
	as
	Begin
		Declare @y	int,
				@m	int,
				@d	int

			set	@y = (@year * 365);
			set @m = (@month * 365) / 12;
			set @d = @y + @m;

			Return @d
	End

	Select dbo.FN_NumberOfTotalDays(1,6)



--5. Create a scalar valued function which accepts two parameters year in integer & month in integer and
--	 returns first date in passed month & year.

	Create Function FN_FirstDate(
		@month	int,
		@year	int 
	)	
	Returns varchar(25)
	as
	Begin
		Return (
			Select '01 - ' + Convert(varchar(10), @month) + ' - ' + Convert(varchar(10), @year)
		)
	End

	Select dbo.FN_FirstDate(9, 2025)

	--select dateadd(month, datediff(month, 0, getDate()), 0) as StartOfMonth
	--Select DATEADD(year, DATEDIFF(year, 0, GETDATE()), 0) AS StartOfYear

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


				-->>>>>>>>>>>>>>>• Views •<<<<<<<<<<<<<<<--


--1. Create a view that display first 100 workers details.

	Create View WorkerDetails
	as
	Select Top 100 *
	From Person

	Select * From WorkerDetails


--2. Create a view that displays designation wise maximum, minimum & total salaries.

	Create View Designation_Wise_Salaries
	as
	Select Distinct DesignationName, Max(Salary) as Max_Sal, Min(Salary) as Min_Sal, Sum(Salary) as Total_Sal
	From Person
	Inner Join Designation
	on Person.DesignationID = Designation.DesignationID
	Group by DesignationName

	Select * From Designation_Wise_Salaries



--3. Create a view that displays Workerâ€™s first name with their salaries & joining date, it also displays duration column which is difference of joining date with respect to current date.

	Create View WorkerInfo
	as
	Select FirstName, Salary, JoiningDate, DateDiff(year, JoiningDate, getDate()) as Duration
	From Person

	Select * From WorkerInfo



--4. Create a view which shows department & designation wise total number of workers.

	Create View NumberOfWorker
	as
	Select Department.DepartmentName, Designation.DesignationName, Count(*) as Num_of_Worker
	From Person
	Left Outer Join Department
	on Person.DepartmentID = Department.DepartmentID
	Left Outer Join Designation
	on Person.DesignationID = Designation.DesignationID
	Group by Department.DepartmentName, Designation.DesignationName

	Select * From NumberOfWorker



--5. 5. Create a view that displays worker names who don’t have either in any department or
--designation.

	Create View No_departmentORdesignation
	as
	Select FirstName, LastName
	From Person
	Where DepartmentID is Null 
	OR DesignationID is Null

	Select * From No_departmentORdesignation
