create table Student_info
(
StdId int,
Name Varchar(100),
EnrollmentNo Varchar(12),
Division VArchar(50),
Sem int,
BirthDate Datetime,
Email Varchar(100),
ContactNo Varchar(50),
);

Insert into Student_info values(101,'Naimish Patel','090200107051','BCX-3',3,'1992-12-06','naimishp49@gmail.com','8866205253')
Insert into Student_info values(102,'Firoz A. S.','090200107090','BCY-3',3,'1994-05-03','firoz.me@gmail.com','8885999922')
Insert into Student_info values(103,'Krunal Vays','090200107101','BCZ-5',5,'1984-03-01','krunalvyas@gmail.com','9990888877')
Insert into Student_info values(104,'vijay patel','090200107102','BCX-5',5,'1985-02-15','vijay.patel123@gmail.com','8787878787')
Insert into Student_info values(105,'Vimal Trivrdi','090200107103','BCY-3',3,'1988-01-20','maulik123@gmail.com','8789564512')

select * from Student_info

--1. Display Name of Student who belongs to either Semester 3 or 5. (Use IN & OR)
select name from Student_info 
where sem In ('3','5')

select name from Student_info 
where sem=3 or sem='5'

--2. Find Student Name & Enrollment No in which Student Id between 103 to 105.
select name,enrollmentNo From Student_info
Where stdId>103 and stdId<105

--3. Find Student Name & Enrollment No with their Email Who belongs to 5th Semester.
select name,enrollmentNo,Email From Student_info
Where sem=5

--4. Display All the Details of first three students.
select Top 3 * From Student_info

--5. Display Name & Enrollment no of first 30% Students who’s contact number ends with 7.
select top 30 percent name,enrollmentNo from Student_info
where contactNO like '%7'

--6. Display Unique Semesters.
select distinct sem from Student_info

--7. Retrieve All the Students who have no Enrollment.
select name from Student_info
where EnrollmentNo is null

--8. Find All Students whose Name does not start with ‘V’.
select name from Student_info
where name not like 'v%'

--9. Find All Students in which Email Contains ‘3@G’ & Only Six Characters.
select name from Student_info
where email like '%3@G%' and email like '______'

--10. Find Out All the Students whose First Name Starts with F And third character must be R.
select name from Student_info
where email like 'f_r%'

--11. Find All the Student Details whose Contact No contains 877.
Select name from Student_info
where ContactNo like '%877%'

--12. Display Student Name in Which Student belongs to Semester 3 & Contact Number Does Not Contains 8 & 9.
Select name from Student_info
where sem=3 and ContactNo not like '%[8, 9]%'

--13. Find Students who born after date 01-01-1990.
select name from Student_info
where BirthDate > '1990-01-01'

--14. Update Division to BCX-5 & Semester 5 whose Student Id Is 102.
update Student_info set Division = 'BCX-5', Sem = 5
Where StdId = 102

--15. Change the Student’s Name to Firoz Sherasiya in which Email is Firoz.Me@Gmail.Com & Contact No is 8885999922.
update Student_info set name = 'Firoz Sherasiya'
Where Email = 'firoz.me@gmail.com' and ContactNo = '8885999922'

--16. Add one more Column City Varchar (50) in Student Table.
Alter table Student_info add City Varchar(50) 

--17. Remove All BCX-3 Division Students.
Delete From Student_info
Where Division = 'BCX-3'

--18. Change Column Name Email to EmailAddress.
sp_rename 'Student_info.Student_info.EmailAddress','EmailAddress', 'Column'

--19. Write an SQL query to clone a new table Student_New from Student table with all data.
select * into Student_New From Student_info

--20. Remove All the Data from Student Table Using Truncate.
truncate table student_info