use employees;
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;
    
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

commit;/*ACTS as an save point of the data. And stored previously saved data. When commited is executed. */

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';

rollback;/* Will roll back to the data saved at the previous commit savepoint. 
Can move to only one previous commit command no matter how many times executed.*/

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_name = 'Business Analysis';
