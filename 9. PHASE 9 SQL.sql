--  STORED Procedures ------------------------------------------------

select *
FROM employee_salary
where salary >= 50000;


-- here we create super simple 

CREATE procedure large_salary()
select *
FROM employee_salary
where salary >= 50000;


call large_salary();


-- PROCEDURE ( here we use DELIMETER chnage )

DELIMITER $$
create procedure large_salary2()
BEGIN
	select *
	FROM employee_salary
	where salary >= 50000;

	select *
	FROM employee_salary
	where salary >= 10000;

END $$
DELIMITER ;          -- changeed delimeter to default

call large_salary2();



-- parameter in PROCEDURE



DELIMITER $$

CREATE PROCEDURE large_salary6(emp_id INT)        -- can pass arg what every name 
BEGIN
    SELECT salary
    FROM employee_salary
    WHERE employee_id = emp_id;   -- use the parameter just make sure which coln, it should see
END $$

DELIMITER ;

-- Call it
CALL large_salary6(1);






-- ________________________________ TRIGGERS and EVENTS ___________________________________________________________________________---


DELIMITER $$

CREATE TRIGGER employee_INSERT                                   --  trigger 
	AFTER INSERT ON employee_salary                    -- insert event ( trigger activate if after any data inster in dmployee_salary
    FOR EACH ROW 
BEGIN 
	INSERT INTO  employee_demographics (employee_id , first_name , last_name )
    VALUES ( NEW.employee_id , NEW.first_name , NEW.last_name );                    -- inster so we inster neww ( in update and delete mailny old and after)
END $$

DELIMITER ;

INSERT INTO employee_salary ( employee_id , first_name, last_name , occupation , salary , dept_id)
values (12 , 'hero_ ho_mah' ,'me me' , 'teaching' , 30000,NULL);



select * from employee_salary;






--  EVENT _______________________________________________________________

select *
FROM employee_demographics
where age>60;

-- like create a event that check every month or day and if any employee over the specific age then delete them from table and they are retired

DELIMITER $$
CREATE EVENT delete_retires           -- create event 
On schedule every 30 second			-- timer   ( do every month or do every year ) 
DO 
BEGIN 
	DELETE 						-- statement
    FROM employee_demographics
    where age > 60;

END $$
DELIMITER ;


-- ---------------
select *
FROM employee_demographics;


-- ----------------------------------------------------------------------
SHOW variables like 'event%';