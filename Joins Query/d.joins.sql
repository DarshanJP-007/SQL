use s3;

select e.first_name, e.last_name, d.department_name
from employees e
join departments d on e.department_id=d.department_id;

select e.first_name,e.last_name,e.employee_id,d.department_name,l.*
from employees e
join departments d on e.department_id=e.department_id
join locations l on d.location_id=l.location_id;

select d.department_id,d.department_name,l.*
from departments d 
left join locations l on d.location_id=l.location_id;

select c.country_name,c.country_id,l.*
from locations l
join countries c on c.country_id=l.country_id;

select e.first_name,e.last_name,j.job_title
from employees e
join jobs j on e.job_id=j.job_id;

select e.first_name,m.first_name as manager_name ,m.manager_id
from employees e
right join employees m on e.employee_id=m.manager_id;

select d.first_name as dependent_name, e.first_name as employee_name
from dependents d
join employees e on d.employee_id = e.employee_id;

select e.first_name,e.last_name,d.department_name,l.city
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id;

select d.department_name,region_name
from departments d
join locations l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id
join regions r on c.region_id=r.region_id;

select e.first_name,e.last_name,j.job_title
from employees e
join jobs j on e.job_id=j.job_id;

select l.city,r.region_name
from locations l
join countries c on l.country_id=c.country_id
join regions r on c.region_id=r.region_id;

select e.first_name,e.last_name,d.first_name as dependent
from employees e
join dependents d on e.employee_id=d.employee_id;

select d.department_name,c.country_name
from departments d
join locations l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id;

select e.first_name,e.last_name,l.postal_code
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id;

select e.first_name,e.last_name,l.city
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id;

select e.first_name as employee,m.first_name as manager
from employees e
join employees m on e.manager_id=m.employee_id;

select d.department_name as Department,l.city as Country
from departments d
join locations l on d.location_id=l.location_id;

select e.first_name as Employee_name,c.country_name as Country
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id;

select e.first_name as employee,d.first_name as dependent,c.country_name as country
from dependents d
join employees e on e.employee_id=d.employee_id
join departments dep on e.department_id=dep.department_id
join locations l on dep.location_id=l.location_id
join countries c on l.country_id=c.country_id;

select e.first_name,j.job_title,d.department_name
from employees e
join departments d on e.department_id=d.department_id
join jobs j on e.job_id=j.job_id;

select d.department_name,e.first_name,e.last_name
from employees e
join departments d on e.department_id=d.department_id;

select e.first_name,d.department_name,l.city
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id;

select d.department_name,c.country_name
from departments d
join locations l on d.location_id=l.location_id
join countries c on l.country_id=c.country_id;

select d.first_name,j.job_title
from dependents d
join employees e on d.employee_id=e.employee_id
join jobs j on e.job_id=j.job_id;

select e.first_name as employee,d.department_name as department,l.city
from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id;

SELECT d.department_name, j.job_title
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN jobs j ON e.job_id = j.job_id;


SELECT l.city, d.department_name, c.country_name
FROM locations l
JOIN departments d ON l.location_id = d.location_id
JOIN countries c ON l.country_id = c.country_id;


SELECT dp.first_name, j.job_title
FROM dependents dp
JOIN employees e ON dp.employee_id = e.employee_id
JOIN jobs j ON e.job_id = j.job_id;


SELECT e.first_name, e.last_name, d.department_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;


SELECT j.job_title, e.first_name, e.last_name, m.first_name AS manager
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
LEFT JOIN employees m ON e.manager_id = m.employee_id;


SELECT d.department_name, l.*, e.first_name, e.last_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN employees e ON d.department_id = e.department_id;


SELECT j.job_title, l.city
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;


SELECT e.first_name, e.last_name, l.postal_code
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;


SELECT e.first_name, d.first_name AS dependent_name, l.city
FROM employees e
JOIN dependents d ON e.employee_id = d.employee_id
JOIN departments dep ON e.department_id = dep.department_id
JOIN locations l ON dep.location_id = l.location_id;


SELECT d.department_name, j.job_title
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN jobs j ON e.job_id = j.job_id;


SELECT l.city, d.department_name, c.country_name
FROM locations l
JOIN departments d ON l.location_id = d.location_id
JOIN countries c ON l.country_id = c.country_id;


SELECT dp.first_name, j.job_title
FROM dependents dp
JOIN employees e ON dp.employee_id = e.employee_id
JOIN jobs j ON e.job_id = j.job_id;


SELECT e.first_name, d.department_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;


SELECT j.job_title, e.first_name, e.last_name, m.first_name AS manager
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
LEFT JOIN employees m ON e.manager_id = m.employee_id;


SELECT d.department_name, l.city, e.first_name, e.last_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN employees e ON d.department_id = e.department_id;


SELECT e.first_name, dp.first_name AS dependent_name, c.country_name
FROM employees e
JOIN dependents dp ON e.employee_id = dp.employee_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;


SELECT e.first_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;


SELECT d.department_name, c.country_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;


SELECT e.first_name, j.job_title, l.city
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;


SELECT l.city, l.postal_code, d.department_name
FROM locations l
JOIN departments d ON l.location_id = d.location_id;


SELECT e.first_name, d.department_name, m.first_name AS manager
FROM employees e
JOIN departments d ON e.department_id = d.department_id
LEFT JOIN employees m ON e.manager_id = m.employee_id;


SELECT dp.first_name, j.job_title, l.city
FROM dependents dp
JOIN employees e ON dp.employee_id = e.employee_id
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;


SELECT e.first_name, d.department_name, l.postal_code
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;


SELECT d.department_name, l.city, e.first_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN employees e ON d.department_id = e.department_id;


SELECT e.first_name, dp.first_name AS dependent_name, c.country_name
FROM employees e
JOIN dependents dp ON e.employee_id = dp.employee_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;