/*-------------------COUNT---------------------*/

SELECT 
    COUNT(salary)
FROM
    salaries;
    
SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;   
    
SELECT 
    COUNT(*)
FROM
    salaries;/* Gives all the null and non null elements count.*/
    
SELECT 
    COUNT(distinct dept_no)
FROM
    dept_emp;
    
/*-------------------SUM---------------------*/

SELECT 
    SUM(salary)/*Cannot use * as it will give syntax error adding all elemts of diff datatypes is impossible.*/
FROM
    salaries;
    
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
/*---------------------------------- MAX & MIN ----------------------------------*/
SELECT 
    MAX(salary)
FROM
    salaries;
SELECT 
    MIN(salary)
FROM
    salaries; 
    
SELECT 
    MAX(emp_no)
FROM
    salaries;
SELECT 
    MIN(emp_no)
FROM
    salaries;
    
/*---------------------AVERAGE (AVG)------------------------*/

SELECT 
    AVG(salary)
FROM
    salaries;
    
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
/*--------------------------ROUND---------------------*/

SELECT 
    ROUND(AVG(salary),2) /*Rounds to the nearest integer and ,2 will round off to the 2 decimal places*/
FROM
    salaries;
    
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
/*--------------------- IFNULL() and COALESCE() ------------------------*/

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

rollback;


SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name is not provided') AS 'dept_name'
FROM
    departments_dup;
    
/* IF 2 arguments are given to coalesce it will work as a if_null function */

alter table departments_dup
add column dept_manager varchar(10) ;

alter table departments_dup
modify column dept_name varchar(40);

insert into departments_dup values('d010',null,null);
insert into departments_dup values('d011',null,null);


SELECT 
    *
FROM
    departments_dup
ORDER BY
	dept_no;

rollback;

SELECT 
    dept_no,dept_name,
    COALESCE(dept_manager,
            dept_name,
            'Not Applicable') AS 'Dept_Manager'
FROM
    departments_dup;

SELECT 
    dept_no,
    COALESCE(dept_name, 'Department Not Specified') AS 'dept_name',
    dept_manager
FROM
    departments_dup;

/* Coalesce will replace the null value in the parathesis with the next not null value in the paranthesis and will continue,
till all the null values are filled with the non null values of the first argument*/

SELECT 
    dept_no AS 'DEPT_NO',
    dept_name AS 'DEPT_NAME ',
    IFNULL(dept_name, 'Department Not Specified') AS 'DEPT_NAME IFNULLED',
    dept_manager AS 'DEPT_MANAGER',
    COALESCE(dept_manager, dept_name, 'N/A') AS 'DEPT_MANAGER COAL'
FROM
    departments_dup
ORDER BY
	dept_no;
    
   /*COALESCE and IFNULL will only display willnit change the root values from the tables.*/ 
   
   SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS 'dept_info'
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
	COALESCE(dept_no, dept_name) AS 'dept_info'
FROM
    departments_dup
ORDER BY dept_no ASC;