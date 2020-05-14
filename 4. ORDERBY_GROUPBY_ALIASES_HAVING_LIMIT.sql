/*-----------------------------------ORDER BY-------------------------------------*/

SELECT 
    *
FROM
    employees
ORDER BY first_name;

SELECT 
    *
FROM
    employees
ORDER BY first_name ASC;


SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;


SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

/*--------------------------------------GROUP BY-------------------------------------------*/

/* GROUP BY -- It is the most important clause that is to be known in an sql. It will group the common results in column,
and sorts them, in a ascending order. 
The order should be in following order
	
    select columns,column,...
	from table_name
	where conditions
    group by column name,column name,...
    order by column name column name,... desc/asc. */
    
SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name ASC;

/*-----------------------------ALAISES------------------------------------*/

SELECT 
    first_name AS 'FIRST_NAME',
    COUNT(first_name) AS 'NAME_COUNT'
FROM
    employees
GROUP BY first_name
ORDER BY first_name ASC;

SELECT 
    salary, COUNT(emp_no) AS 'EMPS_WITH_SAME_SALARY'
FROM
    salaries
WHERE 
	salary>80000
GROUP BY salary
ORDER BY salary;

/*-------------------------------HAVING------------------------------*/
/*USED WITH GROUP BY --- Between group by and order by  -- Having can be used for the sub sets of the aggrevated groups
It has the same functionality of where clause but it is better used with group by clause to conditionize the group by data

Having can use functons in its conditions but where cannot use the funtions in its conditions*/

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';

SELECT 
    *
FROM
    employees
HAVING hire_date >= '2000-01-01';

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
WHERE
    COUNT(first_name) > 250
GROUP BY first_name
ORDER BY first_name;/*ERROR USE OF WHERE WITH FUNCTION*/

SELECT 
    first_name as 'FIRST_NAME', COUNT(first_name) as 'FIRST_NAME COUNT'
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;


SELECT 
    emp_no AS 'Employee Number',
    AVG(salary) AS 'Employee_average_salary'
FROM
    salaries
WHERE salary > 120000
GROUP BY emp_no
;

SELECT 
    emp_no AS 'Employee Number',
    AVG(salary) AS 'Employee_average_salary'
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

SELECT 
    first_name AS 'First Name',
    COUNT(first_name) AS 'Name Counts'
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

SELECT 
    emp_no AS 'Employee Number'
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no ASC;


/*--------------------------------------LIMIT-------------------------------*/
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    first_name AS 'First Name',
    COUNT(first_name) AS 'Name Counts'
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY COUNT(first_name) DESC
LIMIT 100;

SELECT 
    *
FROM
    dept_emp
LIMIT 100;