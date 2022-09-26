Create Table PersonLog2(
	PLogID			int				Primary Key,
	PersonName		Varchar(250)	Not Null,
	Operation		Varchar(50)		Not Null,
	UpdatedDate		Datetime		NOt Null
)

--1. Print message like - Error Occur that is: Divide by zero error encountered.

Begin Try 
	Select 10/0
End Try
Begin Catch
	Select 'Error Occur that is : ' + ERROR_MESSAGE() As Error
End Catch

--2. Print error message in insert statement using Error_Message () function: Conversion failed when 
--converting datetime from character string

Begin Try 
	Declare @Date date = '2003-06-31'
	Select Convert(Varchar(101), @Date)
End Try
Begin Catch
	Select ERROR_MESSAGE() As Error
End Catch

--3. Create procedure which prints the error message that “The PLogID is already taken. Try another 
--one”.
-- PR_PersonLog2_Error 102,"kishan"
Create Procedure PR_PersonLog2_Error
	@personLogID int,
	@name Varchar(50)
As
Begin
	Begin Try 
		Insert Into PersonLog2 values(@personLogID, @Name, 'Insert', GETDATE())
	End Try
	Begin Catch
		Print 'The PersonLogId is already taken. Try anthor one'
	End Catch
End

--4. Create procedure that print the sum of two numbers: take both number as integer & handle 
--exception with all error functions if any one enters string value in numbers otherwise print result.
Create Procedure PR_PersonLog_Sum
	@a	int,
	@b	int,
	@sum int output
As
Begin
	Begin Try
		Set @sum = @a + @b;
	End try
	Begin catch
		Select ERROR_LINE() As [Error Line],
			ERROR_NUMBER() As [Error Number],
			ERROR_STATE() As [Error State],
			ERROR_SEVERITY() AS [Error Severity],
			ERROR_PROCEDURE() As [Error Procedure],
			ERROR_MESSAGE() As [Error Message]
 	End catch
End

Declare @ans int 
Exec PR_PersonLog_Sum "Rahul",5,@ans output
Print @ans


--5. Throw custom exception using stored procedure which accepts PLogID as input & that throws 
--Error like no plogid is available in database.
-- PR_PersonLog2_IDNOtFound 251
select * from PersonLog2
Create Procedure PR_PersonLog2_IDNotFound
	@PersonLogID int
As
Begin
	If Exists (Select * From PersonLog2 Where PLogId = @PersonLogID)
				Print 'PersonLogId Is Found'
	Else
		Throw 50051,'No PersonLogId is Available in table',1
End

--6. Create cursor with name per_cursor which takes PLogID & PersonName as variable and produce 
--combine output with PLogID & Person Name.


--7. Use Table Student (Id, Rno, EnrollmentNo, Name, Branch, University) - Create cursor that updates 
--enrollment column as combination of branch & Roll No. like SOE22CE0001 and so on. (22 is 
--admission year)