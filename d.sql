use s3;
select * from employees where hire_date > 2000-01-01;

select * from locations where city ="Toronto";

select * from jobs where min_salary > 5000;

select * from countries where region_id =2;

select * from employees where salary < 10000;

select * from dependents where relationship ="Spouse";

select * from locations where postal_code like "M%" ;

select * from departments where location_id = 1700;

select * from jobs where max_salary = 10000;

select * from employees where first_name like "Steven%";

select * from regions where region_name <> "Asia";

select * from employees where hire_date between "1990-01-01" and "2000-12-31";

select * from jobs where min_salary between "3000" and "8000";

select * from locations where state_province is null ;

select * from employees where email like "%@Certisured.com";

select * from jobs where job_title like "%Manager";

select * from departments where department_name like "S%";

select * from countries where length(country_name) > 10;

select * from employees where salary > 5000 and salary <15000;

select * from locations where city like "%San%";

select * from dependents where first_name like "A%";

select * from jobs where "min_salary" > "max_salary";

select * from employees where manager_id is null;

select * from regions where region_name like "%Africa";

select * from employees where length(last_name) < 6;

select * from countries where country_id like "C%";

select * from jobs where job_title <> "Clerk";

select * from employees where salary = 10000;

select * from dependents where relationship != "Child";

select * from departments where location_id = 1400;