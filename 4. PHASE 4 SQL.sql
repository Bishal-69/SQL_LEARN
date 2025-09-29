-- UNIONS -----------

SELECT *
from employee_demographics 
union 
SELECT *
from employee_salary ;


SELECT age,gender
from employee_demographics as demo
union 
SELECT first_name, last_name
from employee_salary as sal