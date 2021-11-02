USE HR;
-- 1.) Write a query in SQL to display the first name, last name, department number, and department name for each employee.
SELECT e.first_name , e.last_name , e.department_id ,d.department_name
FROM employees e JOIN departments d on e.department_id=d.department_id;

-- 2.) Write a query in SQL to display the first and last name, department, city, and state province for each employee
SELECT e.first_name , e.last_name , d.department_name ,l.city , l.state_province
from departments d JOIN employees e ON d.department_id=e.department_id
				   JOIN locations l ON d.location_id = l.location_id;
                   
-- 3.) Write a query in SQL to display the first name, last name, salary, and job grade for all employees.
SELECT e.first_name ,e.last_name , e.salary ,j.*
FROM employees e JOIN jobs j ON e.job_id=j.job_id;

-- 4.) Write a query in SQL to display the first name, last name, department number and department name, for all employees for departments 8 or 4.
SELECT e.first_name , e.last_name , e.department_id ,d.department_name
FROM employees e JOIN departments d on e.department_id=d.department_id
WHERE e.department_id IN (8,4);

-- 5.) Write a query in SQL to display those employees who contain a letter x to their first name and also display their last name, department, city, and state province.
SELECT e.first_name , e.last_name , d.department_name ,l.city , l.state_province
from departments d JOIN employees e ON d.department_id=e.department_id
				   JOIN locations l ON d.location_id = l.location_id
WHERE e.first_name LIKE '%x%';

-- 6.) Write a query in SQL to display all departments including those where does not have any employee. 
SELECT e.first_name , e.last_name , e.department_id ,d.department_name
FROM employees e RIGHT OUTER JOIN departments d on e.department_id=d.department_id;

-- 7.) Write a query in SQL to display the first and last name and salary for those employees who earn less than the employee earn whose number is 146.
SELECT * from employees e1
INNER JOIN employees e2 on e1.salary < e2.salary
WHERE e2.employee_id = 146;

-- 8.) Write a query in SQL to display the first name of all employees including the first name of their manager. 
SELECT e1.first_name , e2.first_name AS manager_name
from employees e1 INNER JOIN employees e2 on e2.employee_id = e1.manager_id;

-- 9.) Write a query in SQL to display the department name, city, and state province for each department. 
SELECT  d.department_name ,l.city , l.state_province
from departments d JOIN locations l ON d.location_id = l.location_id;

-- 10.) Write a query in SQL to display the first name, last name, department number and name, for all employees who have or have not any department. 
SELECT e.first_name , e.last_name , e.department_id ,d.department_name
FROM employees e LEFT OUTER JOIN departments d on e.department_id=d.department_id;
 
-- 11.) Write a query in SQL to display the first name of all employees and the first name of their manager including those who does not working under any manager.
SELECT e1.first_name , e2.first_name AS manager_name
from employees e1 LEFT OUTER JOIN employees e2 on e2.employee_id = e1.manager_id;

-- 12.) Write a query in SQL to display the first name, last name, and department number for those employees who works in the same department as the employee who holds the last name as Taylor.
SELECT e.first_name , e.last_name , e.department_id ,d.department_name
FROM employees e JOIN departments d on e.department_id=d.department_id
WHERE d.department_id = (SELECT department_id FROM employees WHERE last_name = 'Taylor');

-- 13.) Write a query in SQL to display the job title, department name, full name (first and last name ) of employee, and starting date for all the jobs which started on or after 1st January, 1993 and ending with on or before 31 August, 1997.
SELECT j.job_title, d.department_name ,e.hire_date, concat(e.first_name ," " , e.last_name)
FROM employees e JOIN departments d on e.department_id=d.department_id
				JOIN jobs j ON e.job_id = j.job_id
WHERE e.hire_date BETWEEN '1993-01-01' AND '1997-08-31';

-- 14.) Write a query in SQL to display job title, full name (first and last name ) of employee, and the difference between maximum salary for the job and salary of the employee.
SELECT j.job_title, concat(e.first_name ," " , e.last_name) , (j.max_salary - e.salary) as diffSalary
FROM employees e JOIN jobs j ON e.job_id = j.job_id;

-- 15.) Write a query in SQL to display the name of the department, average salary and number of employees working in that department 
SELECT d.department_id, d.department_name ,AVG(e.salary) , COUNT(e.first_name)
FROM employees e JOIN departments d on e.department_id=d.department_id
GROUP BY d.department_id 
ORDER BY d.department_id ASC;

-- 16.) Write a query in SQL to display the full name (first and last name ) of employees, job title and the salary differences to their own job for those employees who is working in the department ID 8. 
SELECT CONCAT(e.first_name ," " , e.last_name) AS "FULL NAME", J.job_title, (J.max_salary - J.min_salary) AS "DIFFERENCE IN SALARIES"
FROM employees E JOIN jobs J ON E.job_id =J.job_id
WHERE E.department_id = 8;

-- 17.) Write a query in SQL to display the name of the country, city, and the departments which are running there.
SELECT c.country_name , l.city , d.department_name
FROM locations l JOIN departments d ON l.location_id = d.location_id
				 JOIN countries c ON l.country_id = c.country_id;
                 
-- 18.) Write a query in SQL to display department name and the full name (first and last name) of the manager
SELECT e1.first_name ,CONCAT(e2.first_name ," " , e2.last_name) AS manager_name , d.department_name
from employees e1 JOIN employees e2 on e2.employee_id = e1.manager_id
				  JOIN departments d ON e1.department_id = d.department_id;
                  
-- 19.) Write a query in SQL to display job title and average salary of employees.
SELECT  J.job_title , avg(E.salary)
FROM employees E JOIN jobs J ON E.job_id =J.job_id
GROUP BY job_title;

-- 20.) Write a query in SQL to display the details of jobs which was done by any of the employees who is presently earning a salary on and above 12000.
SELECT CONCAT(E.FIRST_NAME," ",E.LAST_NAME) AS "EMPLOYEE NAME", J.*, E.SALARY
FROM JOBS J JOIN EMPLOYEES E ON J.JOB_ID = E.JOB_ID
WHERE E.SALARY >= 12000;

-- 21.) Write a query in SQL to display the country name, city, and number of those departments where at leaste 2 employees are working.
SELECT D.DEPARTMENT_ID, C.COUNTRY_NAME, L.CITY, COUNT(E.FIRST_NAME) AS  "NUMBER OF EMPLOYEES" 
FROM COUNTRIES C JOIN LOCATIONS L ON C.COUNTRY_ID = L.COUNTRY_ID
				JOIN DEPARTMENTS D ON D.LOCATION_ID = L.LOCATION_ID
				JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID 
HAVING COUNT(E.FIRST_NAME) >=2
ORDER BY D.DEPARTMENT_ID;

-- 22.) Write a query in SQL to display the department name, full name (first and last name) of manager, and their city.
SELECT e1.first_name ,CONCAT(e2.first_name ," " , e2.last_name) AS manager_name , d.department_name ,l.city
from employees e1 JOIN employees e2 on e2.employee_id = e1.manager_id
				  JOIN departments d ON e1.department_id = d.department_id
                  JOIN locations l ON l.location_id = d.location_id;
                  
-- 23.) Write a query in SQL to display the employee ID, job name, number of days worked in for all those jobs in department 8.
SELECT e.employee_id, j.job_title,d.department_id , e.hire_date , datediff(sysdate() , e.hire_date) AS "daysWorking"
FROM employees e JOIN departments d on e.department_id=d.department_id
				JOIN jobs j ON e.job_id = j.job_id
HAVING (d.department_id = 8);

-- 24.) Write a query in SQL to display the full name (first and last name), and salary of those employees who working in any department located in London.
SELECT concat(e.first_name ," " , e.last_name) AS full_name , l.city
FROM employees e JOIN departments d on e.department_id=d.department_id
				JOIN locations l ON l.location_id = d.location_id
HAVING (l.city = 'London');

-- 25.)  Write a query in SQL to display full name(first and last name), job title, starting and ending date of last jobs for those employees with worked without a commission percentage.

-- 26.) Write a query in SQL to display the department name and number of employees in each of the department.
SELECT d.department_id, d.department_name ,COUNT(e.first_name) as "Count of employees"
FROM employees e JOIN departments d on e.department_id=d.department_id
GROUP BY d.department_id 
ORDER BY d.department_id ASC;

-- 27.) Write a query in SQL to display the full name (firt and last name ) of employee with ID and name of the country presently where (s)he is working.
SELECT e.employee_id ,CONCAT(e.first_name ," " , e.last_name) AS full_name , c.country_name
from employees e  JOIN departments d ON e.department_id = d.department_id
                  JOIN locations l ON l.location_id = d.location_id
                  JOIN countries c ON c.country_id = l.country_id;