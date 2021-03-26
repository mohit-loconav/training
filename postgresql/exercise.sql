
-- Display the last name and job title of all employees who do not have a manager
select last_name, job_title from (
select last_name, job_id from employees where manager_id is NULL) t1
inner join
(select job_id, job_title from jobs) t2
on t1.job_id=t2.job_id;

-- Display the names and salaries of all employees in reverse salary order
select first_name || ' ' || last_name as fullname, salary from employees order by salary desc;

-- Display the maximum,minium and average salary commission earned


-- Display the department number,total salary payout and total commission payout for each department
select sum(salary) as total, employees.department_id, department_name
from employees inner join departments 
on departments.department_id=employees.department_id 
group by employees.department_id, department_name 
order by total;

-- Select the maximum salary of each department along with the department india
select max(salary) as max_salary, departments.department_id, department_name
from employees inner join
(select department_id, department_name from departments inner join (select location_id from locations where country_id='IN') locations on locations.location_id=departments.location_id) departments on employees.department_id=departments.department_id
group by departments.department_id, department_name;

-- Display the comission, if not null, display 10% of salary, if null display a default value 1

-- Create a query that displays the name , job, department name, salary, grade for all the employees.
select first_name || ' ' || last_name as name, job_title, department_name, salary, case 
when salary>=50000 then 'A'
when salary>=30000 then 'B'
when salary<30000 then 'C'
end grade
from employees 
inner join jobs on jobs.job_id=employees.job_id 
inner join departments on departments.department_id=employees.department_id;

--     Derive grade based on salary(>=50000=A,>=30000=B,<30000=C)
select first_name || ' ' || last_name as name case 
when salary>=50000 then 'A'
when salary>=30000 then 'B'
when salary<30000 then 'C'
end grade
from employees;

-- Display the average of sum of the salaries and group the result with the deparment id. Order the result with the department id.


-- Display the names and department name of all employees working in the same city as Trenna
select full_name || ' ' || last_name as fullname, 

-- Display employee name if it's a palindrome
select first_name, reverse(first_name) from employees;

-- display the employee last name and departmnet name of all employess who have an 'a' in their name
select last_name, department_name
from (select last_name, department_id from employees where first_name || last_name like '%a%') employees inner join departments on employees.department_id=departments.department_id

-- Create a unique list of all jobs that are in department 4. Include the location of the departmnet in the output
with department_4_jobs as (
select distinct job_id, locations.* from (select department_id, location_id, department_name from departments where department_id=4) department_4
inner join (select job_id, department_id from employees) employees on employees.department_id=department_4.department_id
inner join locations on locations.location_id=department_4.location_id
)
select department_4_jobs.*, jobs.job_title from jobs 
inner join
department_4_jobs on department_4_jobs.job_id=jobs.job_id;

-- FInd the subcategories that have at least two different prices less than $15

-- Find sales prices of product 718 that are less than the list price recommnded for that product

-- Display product number,description and sales of each prodcut in the year 2001

-- DIsplay the last name and salary of every employee who reports to FILLMORE.
select last_name, salary from employees where manager_id=(select manager_id from employees where first_name='FILLMORE');

-- Display the department number,last name and job ID for every employee in the OPERATIONS department
select last_name, department_id, job_id from employees where department_id=(select department_id from departments where name='Sales');

-- Display the Managers with top three salaries along with their salaries and department information
select * from employees 
where employee_id in (select distinct manager_id from employees where manager_id is not null)
order by salary desc
limit 3;

-- Fetch the previous Qaurter's second week's first day's date

-- Calculate experience of the employee till date in Years and months(Example 1 year and 3 months)
select full_name || ' ' || last_name as name, age(current_date, hire_date) from employees;

