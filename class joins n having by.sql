select column names,aggregate function(column_name) frm tablename group by column names;
use s3;
select dep_id,first_name,last_name,sum(salary) from employees group by dep_id,first_name,last_name;

select department_id,count(employee_id) as emp
from employees
group by department_id;

select department_id,count(employee_id) as emp
from employees
group by department_id
having emp>5;

select d.department_id,count(e.employee_id) as emp
from employees
group by department_id
having emp>5;

select region_id,count(country_id) from countries 
group by region_id;