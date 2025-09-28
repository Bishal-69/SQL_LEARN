
-- INNER JOIN ------------------------
SELECT *
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
  ON dem.employee_id = sal.employee_id;
  
  
  
SELECT dem.employee_id , age , occupation
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
  ON dem.employee_id = sal.employee_id;
  
  
  
-- OUTER JOIN ------------------------------

-- LEFT JOIN -------------
SELECT *
FROM employee_demographics as dem
LEFT JOIN employee_salary as sal
  ON dem.employee_id = sal.employee_id;
  
  
-- RIGHT JOIN -------------
SELECT *
FROM employee_demographics as dem
RIGHT JOIN employee_salary as sal
  ON dem.employee_id = sal.employee_id;
  
  
-- SELF JOIN --------------------------------------------------

SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
  on emp1.employee_id +1 =emp2.employee_id;
  
  
SELECT emp1.employee_id as emp_santa,                                 -- ASSIGNING members as per there id , 1st name and lastname with in employee_salarary table
		emp1.first_name as first_name_santa,
        emp1.last_name as last_name_santa,
        
        emp2.employee_id as emp_name,
		emp2.first_name as first_name_emp,
        emp2.last_name as last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
  on emp1.employee_id +1 =emp2.employee_id;
  
  
  
  
  
  
  
-- JOINING multiple TABLES TOGETHER ----------------  

-- Here demo has common of id with sal but not with pd . SIMILARLY pd is common with sal ( dept_id ) but not with demo 
-- using some techinique we can join all 3 tables 

SELECT * 
FROM employee_demographics as demo 
INNER JOIN employee_salary as sal
	ON demo.employee_id = sal.employee_id
    
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id;


  

  
  
  
  
  
  
  
  
  