-- CASE Statement  --------------------------------

SELECT 
    first_name,
    last_name,
    age,
    CASE  
        WHEN age <= 30 THEN 'Young'
        ELSE 'Not Young'
    END AS `describe`
FROM employee_demographics;



SELECT 
    first_name,
    last_name,
    age,
    CASE  
        WHEN age <= 30 THEN 'Young'
        When age Between 40 and 50 then "OLD"                  -- can use MULTIPLE statement
        ELSE 'Not Young'
    END AS `describe`
FROM employee_demographics;



-- LEARN SUB QUERY NOW ---------------------------------------


select gender , AVG(age), MIN(age) , max(age) , count(gender)
FROM employee_demographics
GROUP BY gender;


select gender, AVG (`max(age)`)        -- `.....` the table name  cuz we cant use agg fun inside agg fun ( need table name)
FROM
(select gender , AVG(age), MIN(age) , max(age) , count(gender)              -- here we will run the max(age) -- aggregrate fun  which will create the tabel name max(age) so we used that above 
FROM employee_demographics
GROUP BY gender
) AS AGG_TABLE                           -- here we used alias cuz we run a table query which make table but to run query inside query we need table name 
group by gender; 



-- simply we do above one --------------------------------------

select gender, AVG (MIN_AGE)           -- here we dont need to use ` ` cuz we mentioned the table name below and MIN_AGE is table name not agg fun 
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

