-- Query 1
SELECT employee_id, first_name, last_name, department_id, salary, RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dept_rank FROM employees;

-- Query 2
SELECT employee_id, first_name, last_name, SUM(salary) AS total_salary FROM employees GROUP BY employee_id;

-- Query 3
SELECT employee_id, first_name, last_name, department_id, salary, hire_date, SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS cumulative_salary FROM employees;

-- Query 4
SELECT * FROM (SELECT *, RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk FROM employees) AS ranked WHERE rnk = 1;

-- Query 5
SELECT employee_id, first_name, last_name, department_id, salary, AVG(salary) OVER (PARTITION BY department_id) AS dept_avg, salary - AVG(salary) OVER (PARTITION BY department_id) AS diff_from_avg FROM employees;

-- Query 6
SELECT department_id, COUNT(*) AS employee_count FROM employees GROUP BY department_id;

-- Query 7
SELECT * FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY hire_date) AS rnk FROM employees) AS ranked WHERE rnk = 1;

-- Query 8
SELECT employee_id, department_id, salary, MAX(salary) OVER (PARTITION BY department_id) - salary AS diff_from_max FROM employees;

-- Query 9
SELECT employee_id, department_id, salary, RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank_in_dept FROM employees;

-- Query 10
SELECT * FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk FROM employees) AS ranked WHERE rnk <= 3;

-- Query 11
SELECT employee_id, department_id, hire_date, salary, SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS running_total FROM employees;

-- Query 12
SELECT employee_id, hire_date, COUNT(*) OVER (ORDER BY hire_date) AS cumulative_hires FROM employees;

-- Query 13
SELECT *, MAX(salary) OVER () AS highest_company_salary FROM employees;

-- Query 14
SELECT department_id, MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM employees GROUP BY department_id;

-- Query 15
SELECT * FROM (SELECT *, AVG(salary) OVER (PARTITION BY department_id) AS dept_avg FROM employees) AS e WHERE salary > dept_avg;

-- Query 16
SELECT employee_id, department_id, salary, salary / SUM(salary) OVER (PARTITION BY department_id) * 100 AS salary_percent FROM employees;

-- Query 17
SELECT department_id, AVG(salary) AS avg_salary FROM employees GROUP BY department_id ORDER BY avg_salary DESC LIMIT 1;

-- Query 18
SELECT e.*, dept_totals.total_salary, RANK() OVER (ORDER BY dept_totals.total_salary DESC) AS dept_salary_rank FROM employees e JOIN (SELECT department_id, SUM(salary) AS total_salary FROM employees GROUP BY department_id) AS dept_totals ON e.department_id = dept_totals.department_id;

-- Query 19
SELECT * FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY hire_date) AS rnk FROM employees) AS ranked WHERE rnk = 1;

-- Query 20
SELECT employee_id, department_id, salary, AVG(salary) OVER (PARTITION BY department_id) AS avg_salary, salary - AVG(salary) OVER (PARTITION BY department_id) AS salary_diff FROM employees;

-- Query 21
SELECT * FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY hire_date) AS rnk FROM employees) AS ranked WHERE rnk = 1;

-- Query 22
SELECT * FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk FROM employees) AS ranked WHERE rnk = 2;

-- Query 23
SELECT department_id, hire_date, salary, AVG(salary) OVER (PARTITION BY department_id ORDER BY hire_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS avg_salary_to_date FROM employees;

-- Query 24
SELECT employee_id, department_id, salary, MAX(salary) OVER (PARTITION BY department_id) - MIN(salary) OVER (PARTITION BY department_id) AS salary_range FROM employees;

-- Query 25
SELECT employee_id, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_by_salary FROM employees;

-- Query 26
SELECT * FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk_high, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary ASC) AS rnk_low FROM employees) AS ranked WHERE rnk_high = 1 OR rnk_low = 1;

-- Query 27
SELECT employee_id, department_id, hire_date, salary, AVG(salary) OVER (PARTITION BY department_id ORDER BY hire_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_avg_salary FROM employees;

-- Query 28
SELECT department_id, COUNT(*) AS employee_count FROM employees GROUP BY department_id ORDER BY employee_count DESC LIMIT 1;

-- Query 29
SELECT * FROM (SELECT *, PERCENT_RANK() OVER (PARTITION BY department_id ORDER BY salary) AS percentile FROM employees) AS ranked WHERE percentile > 0.5;

-- Query 30
SELECT department_id, hire_date, SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS cumulative_dept_salary FROM employees;

-- Query 31
SELECT employee_id, department_id, hire_date, RANK() OVER (PARTITION BY department_id ORDER BY hire_date) AS tenure_rank FROM employees;

-- Query 32
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM employees;

-- Query 33
SELECT employee_id, department_id, salary, AVG(salary) OVER (PARTITION BY department_id) AS dept_avg, salary - AVG(salary) OVER (PARTITION BY department_id) AS diff FROM employees;

-- Query 34
SELECT employee_id, department_id, hire_date, RANK() OVER (PARTITION BY department_id ORDER BY hire_date) AS hire_rank FROM employees;

-- Query 35
SELECT employee_id, salary, salary / SUM(salary) OVER () * 100 AS percent_of_company_salary FROM employees;

-- Query 36
SELECT employee_id, department_id, hire_date, salary, RANK() OVER (PARTITION BY department_id ORDER BY hire_date, salary DESC) AS composite_rank FROM employees;

-- Query 37
SELECT employee_id, department_id, hire_date, salary FROM employees ORDER BY employee_id, hire_date;

-- Query 38
SELECT * FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk FROM employees) AS ranked WHERE rnk > 1;

-- Query 39
SELECT * FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk FROM employees) AS ranked WHERE rnk <= 2;

-- Query 40
SELECT employee_id, department_id, hire_date, COUNT(*) OVER (PARTITION BY department_id ORDER BY hire_date) AS cumulative_hire_count FROM employees;

