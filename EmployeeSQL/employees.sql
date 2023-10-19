-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "employee_id" serial primary key, 
    "employee_title" VARCHAR,   
    "date_of_birth" DATE,   
    "first_name" varchar,  
    "last_name" varchar,   
    "sex" varchar,  
    "hiring_date" DATE   
);

CREATE TABLE "salaries" (
    "employee_id" serial,
    "salaries" varchar  
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

select * from employees
select * from salaries
select 
    employees.employee_id AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
    employees.sex AS "Sex",
    salaries.salaries AS "Salary"
FROM employees
JOIN salaries  ON employees.employee_id = salaries.employee_id;


select 
employees.first_name as "First Name", 
employees.last_name as "Last Name",
employees.hiring_date as "Hire Date"
from employees
WHERE EXTRACT(YEAR FROM employees.hiring_date) = 1986;


CREATE TABLE "department_manager" (
	"department_id" varchar, 
    "employee_id" varchar    
);
select * from department_manager

CREATE TABLE "department_name" (
	"department_id" varchar, 
    "department_name" varchar    
);
select * from department_name
create view department_info as
select department_name.department_id, department_name.department_name,department_manager.employee_id
from department_name
inner join department_manager on department_name.department_id= department_manager.department_id;
select * from department_info

Create view department_employees as
select 
    employees.employee_id AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
    department_info.department_id AS "Department No",
    department_info.department_name AS "Department Name"
FROM employees
JOIN department_info  ON employees.employee_id = CAST(department_info.employee_id AS integer);
select * from department_employees

select 
employees.first_name as "First Name", 
employees.last_name as "Last Name",
employees.sex as "Sex"
from employees
WHERE employees.first_name = 'Hercules' AND employees.last_name like 'B%';


select 
department_employees."Employee Number" AS "Employee Number",
department_employees."Last Name" as "Last Name",
department_employees."First Name" as "First Name",
department_employees."Department Name" AS "Department Name"
from department_employees
where department_employees."Department Name" = 'Sales';

select 
department_employees."Employee Number" AS "Employee Number",
department_employees."Last Name" as "Last Name",
department_employees."First Name" as "First Name",
department_employees."Department Name" AS "Department Name"
from department_employees
where department_employees."Department Name" = 'Sales' or department_employees."Department Name" = 'Development';


select last_name,  count (last_name)
from employees
group by last_name
order by last_name DESC;