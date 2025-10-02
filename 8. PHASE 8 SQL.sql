-- -----------------------------------CTEs ---------------------------------------------------------------------------------------------------------------------------

WITH CTE_EXAMPLE AS(                       -- giving TEMPORARY name to subquery 
select gender ,                 -- our sub query
		AVG(age) AS AVG_AGE,       
		MIN(age) AS MIN_AGE,
        max(age) AS MAX_AGE , 
        count(gender) AS COUNT             
FROM employee_demographics
GROUP BY gender
)
SELECT gender, AVG(MIN_AGE)       
FROM CTE_EXAMPLE                           -- using CTE ( our subquery )
group by gender; 


-- ___________________________________________________________________


WITH CTE_EXAMPLE(gender , AVG_AGE ,MIN_AGE, MAX_AGE ,COUNT) AS(                       -- we passing coln name as parameter here
select gender ,               
		AVG(age),                 			-- above we used alis (AS) for clon name but here we passed it as parameter
		MIN(age), 
        max(age), 
        count(gender)            
FROM employee_demographics
GROUP BY gender
)
SELECT gender, AVG(MIN_AGE)       
FROM CTE_EXAMPLE                           -- using CTE ( our subquery )
group by gender; 





-- ----------------------------------same but we didnot use CTE ----------------------------------------------------------------

select gender, AVG (MIN_AGE)           
FROM
	(select gender ,
		AVG(age) AS AVG_AGE,
		MIN(age) AS MIN_AGE,
        max(age) AS MAX_AGE , 
        count(gender) AS COUNT             
FROM employee_demographics
GROUP BY gender
) AS AGG_TABLE
group by gender; 

 
 
 -- -------------------- MULTIPLE CTEs ----------------------------------
 
 WITH 
 
	CTE_NAME_1 AS(
    select employee_id, gender, birth_date
    FROM employee_demographics
    WHERE birth_date > '1985-01-01'
    ),
    
    CTE_NAME_2 AS(
    select employee_id,salary
    FROM employee_salary
    WHERE salary > 50000)
    
SELECT *
FROM CTE_NAME_1
JOIN CTE_NAME_2
		On CTE_NAME_1.employee_id = CTE_NAME_2.employee_id;
        
        
        
        
-- ________________________________________________________ TEMPORARAY TABLE ____________________________________________________________________________________________________


CREATE temporary table temp_name(                 -- temp table 
first_name varchar(50),
last_name varchar(50)
);

select *
from temp_name;


-- creating based on exixstng tbale ( trick ) --------

CREATE TEMPORARY TABLE salar_over_50k(
		select *
        from employee_salary
        where salary >= 50000);
        
select *
FROM salar_over_50k;