-- STRING FUNCTION --------------------------------

SELECT LENGTH('skyfall');

select first_name , length(first_name)
from employee_demographics
Order by 2;            -- the 2 in ORDER BY 2 refers to the second column in your SELECT list.


SELECT UPPER('SKY');     -- upper case
SELECT LOWER('sky');        -- lower case


-- TRIM CASE ----------------
SELECT TRIM('            TRY      ');  

SELECT LTRIM('            TRY      ') AS LABEL;               -- LEFT TRIM

SELECT RTRIM('            TRY      ')   AS 'RIGHT TRIM';     -- RIGHT TRIM





--  SUB-STRING FUNCTION ---------------------------


SELECT first_name,  
LEFT(first_name,4),                    -- gives 4 string char from  LEFT
RIGHT(first_name,4)                    -- gives 4 string char from RIGHT
FROM employee_demographics;


select first_name,
SUBSTRING(first_name,3,2)                -- slicing text _____ SUBSTRING(string, start_position, length) ___________--
from employee_demographics;


-- USED AS LIKE IF WE WANT BIRTH MONTH ONLY THEN 

select birth_date,
SUBSTRING(birth_date,6,2) as "BIRTH MONTH"         
From employee_demographics;



-- REPLACE ---------------------------------

SELECT first_name, 
REPLACE(first_name, 'A','z')             -- ALL 'A' wll be replaced ( make sure not a)
FROM employee_demographics;
 


-- LOCATE ( GIVE THE LOCATION (INDEX) OF STRING )

SELECT LOCATE('s','Lesile');

SELECT first_name ,
 LOCATE ('AN', first_name)
FROM employee_demographics;



Select first_name,last_name,
CONCAT(first_name,last_name) AS 'FULL NAME'
FROM employee_demographics;
