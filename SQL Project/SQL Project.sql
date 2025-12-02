create database employee;
use employee;

create table Departments(
   DepartmentID INT PRIMARY KEY,
   DepartmentName VARCHAR (50) DEFAULT NULL);

create table employees(
 EmployeeID INT PRIMARY KEY,
 FirstName VARCHAR (40) DEFAULT NULL,
 LastName VARCHAR (40) DEFAULT NULL,
 DepartmentID  INT  NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES  departments(DepartmentID),
 HireDate DATE NOT NULL);
 
create table Projects(
  ProjectID INT PRIMARY KEY,
  ProjectName VARCHAR (50) DEFAULT NULL,
  DepartmentID INT  NOT NULL,
  FOREIGN KEY (DepartmentID) REFERENCES  departments(DepartmentID),
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL);
  
create table EmployeeProjects (
  EmployeeID INT  NOT NULL,
 FOREIGN KEY (EmployeeID) REFERENCES  employees(EmployeeID),
  ProjectID INT  NOT NULL,
  FOREIGN KEY (ProjectID) REFERENCES  Projects(ProjectID));
  
INSERT INTO departments(DepartmentID,DepartmentName) VALUES 
(1,'Administration'),
(2,'IT'),
(3,'Finance'),
(4,'HR'),
(5,'Non-IT');

INSERT INTO employees(EmployeeID,FirstName,LastName,DepartmentID,HireDate) VALUES 
(101,'darshan','jp',1,'2020-01-01'),
(102,'aatish','naik',1,'2020-11-05'),
(103,'tejas','k',1,'2021-08-11'),
(104,'tejas','gowda',1,'2022-05-08'),
(105,'jay','prasad',1,'2021-01-01'),

(106,'darshan','BS',2,'2020-07-01'),
(107,'sandesh','naik',2,'2023-12-05'),
(108,'tejas','c',2,'2021-03-21'),
(109,'jayanth','BN',2,'2023-05-08'),
(110,'chandan','TP',2,'2020-01-01'),

(111,'dhanush','L',3,'2023-06-01'),
(112,'yashwanth','S',3,'2022-12-05'),
(113,'jeevan','S',3,'2020-09-11'),
(114,'yashwanth','reddy',3,'2024-05-08'),
(115,'govind','prasad',3,'2022-08-01'),

(116,'harish','S',4,'2021-05-07'),
(117,'sandesh','gowda',4,'2022-10-05'),
(118,'tejas','patel',4,'2022-07-21'),
(119,'jayanth','K',4,'2020-09-08'),
(120,'chandan','gowda',4,'2022-11-07'),

(121,'shashank','NM',5,'2023-08-01'),
(122,'likith','Rao',5,'2020-4-05'),
(123,'abdul','naieem',5,'2024-05-11'),
(124,'shashidhar','reddy',5,'2024-02-03'),
(125,'vishwas','HM',5,'2024-06-08');

insert into projects (ProjectID,ProjectName,DepartmentID,StartDate,EndDate)
values (701, 'Office Automation System',1, '2024-01-15', '2024-06-30'),
  (702, 'Network Security Upgrade',2, '2024-02-01', '2024-08-20'),
  (703, 'Budget Forecasting Model',3, '2024-03-10', '2024-09-05'),
  (704, 'Employee Training Portal',4, '2024-04-05', '2024-10-10'),
  (705, 'Facility Maintenance Tracker',5, '2024-05-12', '2024-12-15'); 

insert into employeeprojects (EmployeeID,ProjectID)
values (121,701),
(122,701),
(120,702),
(117,702),
(101,703),
(103,703),
(121,704),
(109,704),
(125,705),
(102,705);

alter table employees
add salary decimal(10,2);

UPDATE employees SET Salary = 47000 WHERE EmployeeID = 101;
UPDATE employees SET Salary = 77000 WHERE EmployeeID = 102;
UPDATE employees SET Salary = 90000 WHERE EmployeeID = 103;
UPDATE employees SET Salary = 32000 WHERE EmployeeID = 104;
UPDATE employees SET Salary = 98000 WHERE EmployeeID = 105;

UPDATE employees SET Salary = 20000 WHERE EmployeeID = 106;
UPDATE employees SET Salary = 25000 WHERE EmployeeID = 107;
UPDATE employees SET Salary = 82000 WHERE EmployeeID = 108;
UPDATE employees SET Salary = 61000 WHERE EmployeeID = 109;
UPDATE employees SET Salary = 41000 WHERE EmployeeID = 110;

UPDATE employees SET Salary = 5000 WHERE EmployeeID = 111;
UPDATE employees SET Salary = 63000 WHERE EmployeeID = 112;
UPDATE employees SET Salary = 97000 WHERE EmployeeID = 113;
UPDATE employees SET Salary = 12000 WHERE EmployeeID = 114;
UPDATE employees SET Salary = 78000 WHERE EmployeeID = 115;

UPDATE employees SET Salary = 23000 WHERE EmployeeID = 116;
UPDATE employees SET Salary = 16000 WHERE EmployeeID = 117;
UPDATE employees SET Salary = 59000 WHERE EmployeeID = 118;
UPDATE employees SET Salary = 51000 WHERE EmployeeID = 119;
UPDATE employees SET Salary = 67000 WHERE EmployeeID = 120;

UPDATE employees SET Salary = 19000 WHERE EmployeeID = 121;
UPDATE employees SET Salary = 90000 WHERE EmployeeID = 122;
UPDATE employees SET Salary = 32000 WHERE EmployeeID = 123;
UPDATE employees SET Salary = 79000 WHERE EmployeeID = 124;
UPDATE employees SET Salary = 81000 WHERE EmployeeID = 125;

UPDATE Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
SET e.Salary = e.Salary * 1.08
WHERE d.DepartmentName = 'HR';

select avg(salary) as avg_salary
from employees;

select e.EmployeeID,e.FirstName,p.ProjectName
from employees e
join employeeprojects ep on e.EmployeeID=ep.EmployeeID
join projects p on ep.ProjectID=p.ProjectID;

select ProjectID,ProjectName,
datediff(EndDate,StartDate) as Duration
from projects
order by duration desc
limit 1;

select d.DepartmentID,d.DepartmentName ,count(e.EmployeeID) as employeescount
from departments d
join employees e on e.DepartmentID=d.DepartmentID
group by d.DepartmentID,d.DepartmentName;

select.EmployeeID, e.FirstName, COUNT(ep.ProjectID) AS ProjectCount
from Employees e
join EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
group by e.EmployeeID, e.FirstName
having COUNT(ep.ProjectID) > 1;

select d.DepartmentID, d.DepartmentName,SUM(e.Salary) as TotalSalary
from Departments d
join Employees e on d.DepartmentID = e.DepartmentID
group by d.DepartmentID, d.DepartmentName
order by TotalSalary desc
limit 1;

select e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName, e.Salary,
dense_rank() over (partition by e.DepartmentID order by e.Salary desc) as SalaryRank
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID;

update Projects
set EndDate = '2022-12-31'
where ProjectID = (
select ProjectID from (
select ProjectID,
datediff(EndDate, StartDate) as DurationDays
from Projects
order by DurationDays asc 
limit 1) as t );
    
SELECT d.DepartmentID, d.DepartmentName,
SUM(e.Salary) AS TotalSalaryExpense
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;    


--  Identify employees who have not been assigned to any project.
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;


--  Determine the department with the highest average project duration
select d.DepartmentID, d.DepartmentName,
avg(DATEDIFF(p.EndDate, p.StartDate)) as AvgProjectDuration
from Departments d
join Projects p on d.DepartmentID = p.DepartmentID
group by d.DepartmentID, d.DepartmentName
order by AvgProjectDuration desc
limit 1;


--  Classify employees into salary ranges (Low, Medium, High).
select e.EmployeeID, e.FirstName, e.LastName, e.Salary,
case
when e.Salary < 60000 then 'Low'
when e.Salary between 60000 and 80000 then 'Medium'
else 'High'
end as SalaryRange
from Employees e;


--  Find the employee with the highest salary.
select EmployeeID, FirstName, LastName, Salary
from Employees
order by Salary desc
limit 1;



-- Calculate the minimum salary and maximum salary of each department.
select d.DepartmentID, d.DepartmentName,min(e.Salary) as MinSalary,max(e.Salary) as MaxSalary
from Departments d
join Employees e on d.DepartmentID = e.DepartmentID
group by d.DepartmentID, d.DepartmentName;


--  TASK-2


--  Retrieve all columns from the Employees table.
select * from Employees;


--  Retrieve employees along with their department names.
select e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID;


-- Retrieve employees hired after '2020-01-01'.
select * from Employees
where HireDate > '2020-01-01';


--  Calculate the average salary of employees.
select avg(Salary) as AvgSalary
from Employees;


--  Count the number of employees in each department.
select d.DepartmentID, d.DepartmentName, count(e.EmployeeID) as EmployeeCount
from Departments d
join Employees e on d.DepartmentID = e.DepartmentID
group by d.DepartmentID, d.DepartmentName;


-- Retrieve employees sorted by hire date in descending order.
select * from Employees
order by HireDate desc;


--  Retrieve employees in the Finance or HR department.
select e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName='HR';


--  Retrieve employees whose last name starts with 'S'.
select * from Employees
where LastName like 'S%';


--  Retrieve employees working on ProjectA(Employee Training Portal).
select e.EmployeeID, e.FirstName, e.LastName
from Employees e
join EmployeeProjects ep on e.EmployeeID = ep.EmployeeID
join Projects p on ep.ProjectID = p.ProjectID
where p.ProjectName = 'Employee Training Portal';


--  Retrieve employees and their project details.
select e.EmployeeID, e.FirstName, e.LastName, p.ProjectID, p.ProjectName, p.StartDate, p.EndDate
from Employees e
join EmployeeProjects ep on e.EmployeeID = ep.EmployeeID
join Projects p on ep.ProjectID = p.ProjectID;


--  Retrieve all departments and their employees (including those with no employees).
select d.DepartmentID, d.DepartmentName, e.EmployeeID, e.FirstName, e.LastName
from Departments d
left join Employees e on d.DepartmentID = e.DepartmentID
order by d.DepartmentID;


--  Retrieve departments with average salary greater than 70000.
select d.DepartmentID, d.DepartmentName, avg(e.Salary) as AvgSalary
from Departments d
join Employees e on d.DepartmentID = e.DepartmentID
group by d.DepartmentID, d.DepartmentName
having avg(e.Salary) > 70000;


--  Increase the salary of all employees in the IT department by 10%.
update Employees e
join Departments d on e.DepartmentID = d.DepartmentID
set e.Salary = e.Salary * 1.10
where d.DepartmentName = 'IT';


--  Remove employees hired before '2019-01-01'.
delete from Employees
where HireDate < '2019-01-01'
and EmployeeID > 0;


--  Find the employee with the highest salary.
select EmployeeID, FirstName, LastName, Salary
from Employees
order by Salary desc
limit 1;


--  Classify employees into salary ranges.
select e.EmployeeID, e.FirstName, e.LastName, e.Salary,
case
when e.Salary < 60000 then 'Low'
when e.Salary between 60000 and 80000 then 'Medium'
else 'High'
end as SalaryRange
from Employees e;


--  Retrieve employees and their projects in the IT department.
select e.EmployeeID, e.FirstName, e.LastName, p.ProjectName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
join EmployeeProjects ep on e.EmployeeID = ep.EmployeeID
join Projects p on ep.ProjectID = p.ProjectID
where d.DepartmentName = 'IT';


--  Find the department with the highest average salary.
select d.DepartmentID, d.DepartmentName, avg(e.Salary) as AvgSalary
from Departments d
join Employees e on d.DepartmentID = e.DepartmentID
group by d.DepartmentID, d.DepartmentName
order by AvgSalary desc
limit 1;


--  Rank employees by salary within each department.
select e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName, e.Salary,
dense_rank () over (partition by e.DepartmentID order by e.Salary desc) as SalaryRank
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID;


--  Find the average project duration for each department.
select d.DepartmentID, d.DepartmentName,
avg(DATEDIFF(p.EndDate, p.StartDate)) as AvgProjectDuration
from Departments d
join Projects p on d.DepartmentID = p.DepartmentID
group by d.DepartmentID, d.DepartmentName;


--  Retrieve the earliest hire date among all employees.
select min(HireDate) as EarliestHireDate
from Employees;


--  List the projects that have employees assigned to them.
select distinct p.ProjectID, p.ProjectName
from Projects p
join EmployeeProjects ep on p.ProjectID = ep.ProjectID;


--  Find the employees who have the same last name and are in the same department.
select e1.EmployeeID, e1.FirstName, e1.LastName, e1.DepartmentID
from Employees e1
join Employees e2 on e1.LastName = e2.LastName
and e1.DepartmentID = e2.DepartmentID
and e1.EmployeeID <> e2.EmployeeID
order by e1.LastName, e1.DepartmentID;


--  Calculate the total salary expense for the company.
select sum(Salary) as TotalSalaryExpense
from Employees;


--  Identify the employees with a salary above the average salary.
select * from Employees
where Salary > (select avg(Salary) from Employees);


--  List the projects that are active and have employees assigned to them.
	-- (Assuming "active" means current date between StartDate and EndDate)
select distinct p.ProjectID, p.ProjectName
from Projects p
join EmployeeProjects ep on p.ProjectID = ep.ProjectID
where CURDATE() between p.StartDate and p.EndDate;


--  Retrieve the employees who have not been assigned to any project.
select e.EmployeeID, e.FirstName, e.LastName
from Employees e
left join EmployeeProjects ep on e.EmployeeID = ep.EmployeeID
where ep.ProjectID is null;


--  Find the department with the highest total project duration.
select d.DepartmentID, d.DepartmentName,
sum(datediff(p.EndDate, p.StartDate)) as TotalProjectDurationDays
from Departments d
join Projects p on d.DepartmentID = p.DepartmentID
group by d.DepartmentID, d.DepartmentName
order by TotalProjectDurationDays desc
limit 1;


--  Update the end date of ProjectA to '2022-11-30'.
update Projects
set EndDate = '2022-11-30'
where ProjectName = 'Financial Analytics Dashboard'
and ProjectID =3;


--  Determine the employee with the lowest salary in the IT department.
select e.EmployeeID, e.FirstName, e.LastName, e.Salary
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'IT'
order by e.Salary asc
limit 1;