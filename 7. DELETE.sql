use employees;

COMMIT;

SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
    
DELETE FROM employees 
WHERE
    emp_no = 999903;
    
    rollback;
    
DELETE FROM departments_dup;

SELECT 
    *
FROM
    departments_dup;
    
DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments;
    
/*-----------------------DROP vs DELETE vs TRUNCATE-----------------------

DROP -- Will delete all the data indexes and constraints when used drop--- we cannot roll back after drop statement.
ONLY A DATA RECOVERY SOFTWARE CAN HELP RETRIEVING THE DATA.

TRUNCATE -- Will delete all the records from table similar to DELETE without a WHERE CLAUSE.Structure will remain intact. 
Auto Increment will reset to default. TRUNCATE is faster than DELETE in SQL programatic approach.

DELETE -- It will delete all the record row by row if used without a WHERE condition. It will not reset auto increment values.


*/