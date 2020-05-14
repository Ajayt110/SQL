SELECT 
    first_name, last_name
FROM
    employees;

SELECT 
    dept_no
FROM
    departments;

SELECT 
    *
FROM
    departments;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
AND 
gender='M';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND  gender='F';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' or  first_name = 'Elvis';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' OR  first_name = 'Aruna';

SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'Kellie'
        OR first_name = 'Aruna')
        AND gender = 'F';

SELECT 
    *
FROM
    employees
WHERE
    first_name ='Nathan' OR first_name ='Cathie' OR first_name ='Mark';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Nathan','Cathie','Mark');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie','Mark','Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name  IN ('Denis' ,'Elvis');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John','Mark','Jacob');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar__');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mark%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
    
 SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');  

/* * % _ are calles as wild card characters- can be used instead of anything thats similar in it's place (Substitute) 
& * can be used to count all rows*/

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;
    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'doo6';

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;

/* '< >' and != acts as not equal symbol */

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01'
        AND hire_date < '2001-01-01';

SELECT 
    *
FROM
    employees
WHERE
    emp_no in (SELECT 
            emp_no
        FROM
            salaries
        WHERE
            salary > 150000);

SELECT DISTINCT
    GENDER
FROM
    employees;


SELECT DISTINCT
    hire_date
FROM
    employees;