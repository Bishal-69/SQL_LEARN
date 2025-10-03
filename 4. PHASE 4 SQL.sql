-- UNIONS -----------


SELECT *
from employee_demographics 
union distinct                                  -- DEFAULT UNION 
SELECT *
from employee_salary ;


SELECT age,gender
from employee_demographics as demo
union 
SELECT first_name, last_name
from employee_salary as sal;


SELECT age,gender
from employee_demographics as demo
union all                                           -- SHOWS WITHOUT DISTINCT 
SELECT first_name, last_name
from employee_salary as sal;


SELECT first_name, last_name ,'OLD' as Label              -- no need to code As label
from employee_demographics
WHERE age>50;


-- If the company wants employees who are pretty old or highly paid

SELECT first_name, last_name ,'OLD' as Label              -- no need to code As label
from employee_demographics
WHERE age>50

UNION

SELECT first_name, last_name ,'Highly Paid Employee' as Label              -- no need to code As label
from employee_salary
WHERE Salary>70000
;


-- DIFF label if Man or lady using UNION and label 

SELECT first_name, last_name ,'OLD MAN' as Label              -- no need to code As label
from employee_demographics
WHERE age>40 AND gender= 'Male'

UNION

SELECT first_name, last_name ,'OLD Lady' as Label              -- no need to code As label
from employee_demographics
WHERE age>40 AND gender= 'FeMale'


UNION

SELECT first_name, last_name ,'Highly Paid Employee' as Label              -- no need to code As label
from employee_salary
WHERE Salary>70000

order by first_name,last_name       
;