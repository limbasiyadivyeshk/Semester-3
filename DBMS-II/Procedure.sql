Create table Students
(
StuID int,
FirstName Varchar(25),
LastName Varchar(25),
Website Varchar(50),
City Varchar(25),
Division Varchar(20)
)

Insert into Students values(1011,'Keyur','Patel','techonthenet.com','Rajkot','II-BCX')
Insert into Students values(1022,'Hardik','Shah','digiminecraft.com','Ahmedabad','II-BCY')
Insert into Students values(1033,'Kajal','Trivedi','bigactivities.com','Borada','IV-DCX')
Insert into Students values(1044,'Bhoomi','Gajera','checkyouremanth.com','Ahmedabad','III-DCW')
Insert into Students values(1055,'hardik','Mital',Null,'Rajkot','II-BCY')
Insert into Students values(1011,'Ashok','jani',Null,'Baroda','II-BCZ')

select * from Students

--1. Display the name of students whose name starts with ‘k’.
--PR_Students_StartsWith_K
Create Procedure PR_Students_StartsWith_K
As
Begin
Select FirstName from Students Where FirstName like 'k%'
End

--2. Display the name of students whose name consists of five characters.
--Pr_Students_Max_FiveChar
Create Procedure Pr_Students_Max_FiveChar
As
Begin  
Select FirstName from Students Where FirstName like '_____'
End

--3. Retrieve the first name & last name of students whose city name ends with a & contains six characters.
Create Procedure PR_Students_CityContains_SixChar
	As 
	Begin
	Select FirstName,LastName from Students Where City like '%a' and City like '______'
	End

--4. Display all the students whose last name ends with ‘tel’.
Create Procedure PR_Student_LastName_Tel
	As
	Begin
	Select * from Students Where LastName like '%tel'
	End

--5. Display all the students whose first name starts with ‘ha’ & ends with ‘t’.
Create Procedure PR_Student_FirstName_StartsWith_Ha_T
	As
	Begin
	select * from Students Where FirstName like 'ha%t'
	End

--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.
Create Procedure PR_Student_FirstName_K_Y
	As
	Begin
	Select * from Students Where FirstName like 'k_Y%'
	End

--7. Display the name of students having no website and name consists of five characters.
Alter Procedure PR_Student_WebsiteIsNull
	As
	Begin
	Select FirstName from Students Where Website is null and FirstName like '_____'
	End

--8. Display all the students whose last name consist of ‘jer’.
Create Procedure PR_Student_LastName_Jer
	As
	Begin
	select * from Students Where lastName like '%jer%' 
	End

--9. Display all the students whose city name starts with either ‘r’ or ‘b’.
Create Procedure PR_Student_CityName_r_b
	As
	Begin
	select * from Students Where City like '[r,b]%'
	End

--10. Display all the name students having websites.
Create Procedure PR_Student_Website
	As
	Begin
	Select * from Students where Website is not Null
	End

--11. Display all the students whose name starts from alphabet A to H.
Create Procedure PR_Student_StartsWith_Alphabet
	As
	Begin
	Select * From Students Where FirstName like '[a-h]%'
	End

--12. Display all the students whose name’s second character is vowel.
Create Procedure PR_Student_Secodname_Vowel
	As
	Begin
	select * From Students Where FirstName like '_[a,e,i,o,u]%'
	End

--13. Display student’s name whose city name consist of ‘rod’.
Create Procedure PR_Student_Cityname_rod
	As
	Begin
	select FirstName from Students Where City like '%rod%'
	End

--14. Retrieve the First & Last Name of students whose website name starts with ‘bi’.
Create Procedure PR_Student_WebSite_bi
	As
	Begin
	Select FirstName,lastName from Students Where Website like 'bi%'
	End

--15. Display student’s city whose last name consists of six characters.
Create Procedure PR_Student_ListName_SixChar
	As
	Begin
	Select FirstName from Students Where Lastname like '______'
	End

--16. Display all the students whose city name consist of five characters & not starts with ‘ba’.
Create Procedure PR_Student_City_FiveChar
	As
	Begin
	Select * from Students Where City like '_____' And City not like 'ba%'
	End

--17. Show all the student’s whose division starts with ‘II’.
Create Procedure PR_Student_Division_II
	As
	Begin
	Select * from Students Where Division like 'II%'
	End
--18. Find out student’s first name whose division contains ‘bc’ anywhere in division name.
Create Procedure PR_Student_Division_Bc
	As
	Begin
	Select FirstName from Students Where Division like '%bc%'
	End

--19. Show student id and city name in which division consist of six characters and having website name.
Create Procedure PR_Student_Division_SixChar
	As
	Begin
	Select StuId,City from Students Where Division like '______' and Website is not Null
	End

--20. Display all the students whose name’s third character is consonant.
Create Procedure PR_Student_ThirdChar_Consonant
	As
	Begin
	Select * from Students Where FirstName not like '__[a,i,o,u]%'
	End
