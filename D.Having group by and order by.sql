use s3;

#group by clause

select department_id,sum(salary)
from employees
group by department_id;

select job_id,avg(salary)
from employees
group by job_id;

SELECT l.city, COUNT(e.employee_id) AS employee_count
FROM employees e
JOIN locations l ON e.location_id = l.location_id
group by l.city;

select department_id,max(salary)
from employees
group by department_id;

select employee_id, count(dependent_id) as num_of_dependents
from dependents
group by employee_id;

SELECT l.city, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
group by l.city;

select j.job_title,count(e.employee_id) as num_of_employee
from employees e 
join jobs j on e.job_id=j.job_id
group by j.job_title;

select c.country_name,count(e.employee_id) as num_of_emp
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id
group by c.country_name;

select hire_date,count(employee_id) as num_of_emp
from employees
group by hire_date;

select j.job_title,min(e.salary) as minimum_salary
from employees e
join jobs j on e.job_id=j.job_id
group by j.job_title;

select r.region_name,avg(e.salary) as average_salary
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id
join regions r on c.region_id=r.region_id
group by r.region_name;

select j.job_title,sum(salary) as salary_expenditure
from employees e
join jobs j on e.job_id=j.job_id
group by j.job_title;

select d.department_name,sum(e.salary) as average_salary
from employees e
join departments d on e.department_id=d.department_id
group by d.department_name
having count(employee_id)>5;

select dep.department_name,count(d.dependent_id) as num_of_dependents
from dependents d
join employees e on d.employee_id=e.employee_id
join departments dep on e.department_id=dep.department_id
group by dep.department_name;

select j.job_title,sum(e.salary) as salary_expenditure
from employees e
join jobs j on e.job_id=j.job_id
group by j.job_title
having avg(e.salary)>"$10,000";


#group by with having clause


select d.department_name,sum(e.salary) as expenditure
from employees e
join departments d on e.department_id=d.department_id
group by d.department_name
having expenditure >"50,000";

select j.job_title,avg(salary) as average_salary
from employees e
join jobs j on e.job_id=j.job_id
group by j.job_title
having average_salary > "15000";

select l.city,count(employee_id) as num_of_emp
from employees e
join departments as d on e.department_id=d.department_id
join locations as l on d.location_id=l.location_id
group by l.city
having num_of_emp > "10";

select r.region_name,max(e.salary) as max_salary
from employees e
join departments d on e.department_id=d.department_id
join locations as l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id
join regions r on c.region_id=r.region_id
group by r.region_name
having max_salary > "10000";

select d.department_name,avg(e.salary) as avg_salary
from employees e
join departments d on e.department_id=d.department_id
group by d.department_name
having avg_salary < "5000";

select l.city,sum(e.salary) as expenditure_salary
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
group by l.city
having expenditure_salary > 30000;

select l.city,count(e.employee_id) as employees
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
group by l.city
having employees > 10;

select j.job_title,min(e.salary) as min_salary
from employees e
join jobs j on e.job_id=j.job_id
group by j.job_title
having min_salary > 12000;

SELECT job_title, min_salary
FROM jobs
WHERE min_salary > 12000;

select l.city,count(e.employee_id) as employee_count
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
group by l.city
having employee_count < 5;

select r.region_name,avg(e.salary) as average_salary,count(e.employee_id) as num_of_emp
from employees e
join departments d on e.department_id=d.department_id
join locations as l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id
join regions r on c.region_id=r.region_id
group by r.region_name
having average_salary > 5000 and num_of_emp > 30;

select dep.department_name,count(d.dependent_id) as dependents
from dependents d
join employees e on d.employee_id = e.employee_id
join departments dep on e.department_id = dep.department_id
group by dep.department_id
having dependents > 3;

SELECT j.job_title, SUM(e.salary) AS total_salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title
HAVING total_salary > 30000;

SELECT l.city, AVG(e.salary) AS avg_salary, COUNT(e.employee_id) AS emp_count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.location_id
HAVING avg_salary > 5000 AND emp_count > 5;

SELECT c.country_name, COUNT(e.employee_id) AS employee
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
GROUP BY c.country_name
HAVING employee > 50;

SELECT r.region_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id
GROUP BY r.region_name
HAVING total_salary > 200000;


# group by, having clause with the order by, limit clause

select first_name,last_name,salary
from employees 
where salary > "10000"
order by salary desc;

select first_name,salary from employees
order by salary desc
limit 5 ;

select employee_id,first_name,last_name,hire_date from employees
where hire_date > "2000-01-01"
order by hire_date 
limit 10;

select d.department_name,sum(e.salary) as expenditure
from employees e
join departments d on e.department_id=d.department_id
group by d.department_name
having expenditure < "40000"
order by expenditure asc;

select job_title,max_salary 
from jobs
having max_salary > "20000"
order by job_title asc;

select l.city,count(e.employee_id) as num_of_emp
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
group by l.city
having num_of_emp < 8
order by l.city asc;

SELECT j.job_title, AVG(e.salary) AS avg_salary
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
GROUP BY j.job_title
ORDER BY avg_salary DESC
LIMIT 3;

select *
from employee;

select d.department_name,count(e.employee_id) as num_of_emp
from employees e
join departments d on e.department_id=d.department_id
group by d.department_name
order by num_of_emp desc
limit 10;

select employee_id,first_name,salary
from employees
where salary between "10000" and "15000"
order by employee_id asc;

select c.country_name,count(e.employee_id) as num_of_emp
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id
group by c.country_name
order by num_of_emp desc
limit 5;

select job_title, min_salary
from jobs
where min_salary > 15000
order by min_salary asc;

SELECT l.city, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY l.city
HAVING total_salary BETWEEN 20000 AND 50000
ORDER BY total_salary DESC;

SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id
HAVING avg_salary BETWEEN 6000 AND 8000
ORDER BY avg_salary DESC
LIMIT 5;

select e.last_name,count(d.dependent_id) as num_of_dependents
from dependents d
join employees e on d.employee_id=e.employee_id
group by e.last_name
having num_of_dependents="1"
order by e.last_name asc;

SELECT e.first_name, e.last_namedependents
FROM employees e
JOIN dependents d ON e.employee_id = d.employee_id
GROUP BY e.employee_id
HAVING COUNT(d.dependent_id) = 1 
ORDER BY e.last_name ASC;
