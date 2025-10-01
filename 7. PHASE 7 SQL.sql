-- WINDOW FUNCTION ------------------------

select gender, AVG(salary) as avg_salary 
from employee_demographics as dem
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id
GROUP BY gender;                                    




-- same as above but it grp the gender but above only 2  gender shown here all shown but at same sort with agg_fun
select gender, AVG(salary) OVER(partition by gender)
from employee_demographics as dem
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
    
-- here you see special use of  WINDOW FUNCTION -------------------------------------------

select dem.first_name,dem.last_name,gender, AVG(salary) OVER(partition by gender)             -- here we added 2 more coln ( multiple rows too ) but it showed ( not 2 rows only liek gropup by )
from employee_demographics as dem
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id;


-- special power added with order by ------------------------------------------------------- 
select dem.first_name,dem.last_name,
gender, salary,
SUM(salary) OVER(partition by gender
					order by dem.employee_id) AS Rolling_total             -- here oder by help to find as rolling sum ( cumulative sum)        
from employee_demographics as dem
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
    
    
 -- ROW_NUMBER -------------------------------------------------   
select dem.first_name,dem.last_name,gender, 
ROW_NUMBER() OVER()											-- give unique number to each row 
FROM employee_demographics as dem         
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id;
    

select dem.first_name,dem.last_name,
gender, salary, 
ROW_NUMBER() OVER(partition by gender 
					order by salary DESC)		     -- it will give row number but groped by gender and it will order that gender as based on salary  									
FROM employee_demographics as dem         
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
    


-- RANK --------------------------------------------------

select dem.first_name,dem.last_name,
gender, salary, 

ROW_NUMBER() OVER(partition by gender 
					order by salary DESC),
                    
RANK()  OVER(partition by gender 
					order by salary DESC)              -- Give rank as per ORDER BY but if same 2 ( ties with each other ) then give same rank 
	    			
FROM employee_demographics as dem         
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
    

-- DENSE_rank


select dem.first_name,dem.last_name,
gender, salary, 

ROW_NUMBER() OVER(partition by gender 
					order by salary DESC),
                    
RANK()  OVER(partition by gender 
					order by salary DESC),   
                    
DENSE_RANK() OVER(partition by gender 
					order by salary DESC)           -- same as rank but as it used to skip like ( 5,5,7 ( give as position )) but it give as ranking ( 5,5,6)
	    			
FROM employee_demographics as dem         
JOIN employee_salary as sal
	on dem.employee_id = sal.employee_id;