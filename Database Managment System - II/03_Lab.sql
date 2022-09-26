Create Table Person1
(
	PersonID		int				Primary Key Identity (101, 1),
	PersonName		varchar(100)	Not Null,
	DepartmentID	int				Foreign Key References Department1(DepartmentID),
	Salary			decimal(8, 2)	Not Null,
	JoiningDate		datetime		Not Null,
	City			varchar(100)	Not Null
)

Create Table Department1
(
	DepartmentId	int				Primary Key Identity (1, 1),
	DepartmentName	varchar(100)	Not Null	Unique,
	DepartmentCode	varchar(50)		Not Null	Unique,
	Location		varchar(50)		Not Null
)


Insert into Department1 Values ('Admin', 'Adm', 'A-Block')
Insert into Department1 Values ('Computer', 'CE', 'C-Block')
Insert into Department1 Values ('Civil', 'CI', 'G-Block')
Insert into Department1 Values ('Electrical', 'EE', 'E-Block')
Insert into Department1 Values ('Mechanical', 'ME', 'B-Block')


Insert into Person1 Values ('Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot')
Insert into Person1 Values ('Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad')
Insert into Person1 Values ('Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda')
Insert into Person1 Values ('Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot')
Insert into Person1 Values ('Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar')
Insert into Person1 Values ('Priya Menpara', Null, 9000, '2000-10-18', 'Ahmedabad')
Insert into Person1 Values ('Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot')
Insert into Person1 Values ('Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot')
Insert into Person1 Values ('Mehul Bhundiya', 4, 13500, '2005-09-01', 'Baroda')
Insert into Person1 Values ('Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar')


--1. Find all persons with their department name & code.
Select Person1.PersonName, Department1.DepartmentName,Department1.DepartmentCode
from Person1
Inner join Department1
on Person1.DepartmentID = Department1.DepartmentID

--2. Give department wise maximum & minimum salary with department name.
Select Distinct Department1.DepartmentName, MAX(Salary) AS Max_Salaty, MIN(Salary) AS Min_Salary
from Person1
Inner join Department1
on Person1.DepartmentID = Department1.DepartmentID
Group by Department1.DepartmentName

--3. Find all departments whose total salary is exceeding 100000.
Select Department1.DepartmentName, Sum(Salary) AS Sum_Salary
From Person1
Inner join Department1
on Person1.DepartmentID = Department1.DepartmentID
Group by Department1.DepartmentName 
Having Sum(Salary) > 100000

--4. Retrieve person name, salary & department name who belongs to Jamnagar city.
Select Person1.PersonName, Person1.Salary, Department1.DepartmentName
From Person1
Inner join Department1
on Person1.DepartmentID = Department1.DepartmentID
Where Person1.City = 'Jamnagar'

--5. Find all persons who does not belongs to any department.
Select * From Person1
Where DepartmentId is null

--6. Find department wise person counts.
Select Distinct Department1.DepartmentName, COUNT(*) AS Total_Person
From Person1
Inner join Department1
on Person1.DepartmentID = Department1.DepartmentID
Group by Department1.DepartmentName

--7. Find average salary of person who belongs to Ahmedabad city.
Select City, Avg(Salary) AS Avg_Salary From Person1
Where City = 'Ahmedabad'
Group by City

--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly.
--(In single column)
Select Person1.PersonName +' earns '+ Convert(Varchar(25), Person1.Salary) +' from department '+ Department1.DepartmentName +' monthly'
From Person1
Inner Join Department1
On Person1.DepartmentID = Department1.DepartmentID

--9. List all departments who have no persons.
Select Department1.DepartmentName
From Person1
Inner Join Department1
on Person1.DepartmentID = Department1.DepartmentId
Where Person1.DepartmentId is Null

--10. Find city & department wise total, average & maximum salaries.
Select Person1.City, Department1.DepartmentName, SUM(Salary) AS SUM_Salary, AVG(Salary) AS AVG_Salary, MAX(Salary) AS Max_Salary
From Person1
Inner Join Department1
On Person1.DepartmentID = Department1.DepartmentID
Group by Person1.City, Department1.DepartmentName

--11. Display Unique city names.
Select Distinct City from Person1

--12. List out department names in which more than two persons.
Select Department1.DepartmentName, Count(*)  
From Person1
Inner Join Department1
On Person1.DepartmentID = Department1.DepartmentID
Group by Department1.DepartmentName
Having Count(*) > 2


--13. Combine person name’s first three characters with city name’s last three characters in single column.
Select Left(PersonName, 3) + Right(City, 3) as Combine_Name From Person1
	 

--14. Give 10% increment in Computer department employee’s salary.
Update Person1 Set Salary = (Salary + Salary * 0.1)

--15. Display all the person name’s who’s joining dates difference with current date is more than 365 days.
Select PersonName, dateDiff(day, JoiningDate, getDate()) as Days
From Person1
Where dateDiff(day, JoiningDate, getDate()) > 365 