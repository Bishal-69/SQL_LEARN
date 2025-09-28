select * from parks_and_recreation.employee_demographics ;

select first_name,
last_name,
age,
(age + 10)*10  
From parks_and_recreation.employee_demographics ;

select distinct first_name, gender
From parks_and_recreation.employee_demographics ;


select * 
from employee_salary 
where salary>=70000;


select * 
from employee_demographics
where gender != "Female";


-- AND OR NOT -- Logical Operators

select * 
from employee_demographics
where birth_date >'1985-01-01'
AND gender != "Female";


-- LIKE statement

select *
From employee_demographics
where first_name Like "a___%";

select * 
from employee_demographics
where birth_date Like '1984%';


------------------------------ GROUP BY and ORDER BY --------------------------------------------------------------

select gender ,max(age)
From employee_demographics
group by gender;


select  occupation , salary
From employee_salary
group by occupation , salary;


-- Order BY ---

select * 
From employee_demographics
order by first_name desc;


select * 
From employee_demographics
order by gender Desc, age DESC;




-- HAving -------------------
select occupation , AVG(salary)
from employee_salary
where occupation LIKE '%manager%'
group by occupation 
Having AVG(salary) >75000;


-- LIMIT -------------------------------------------------------

Select *
From employee_salary
limit 3,1;


