/*Aggregate_Functions are  Applied on multiples rows of a single column and outputs a single value
count() - counts all non null records
sum() - adds all non null values in a column
min() & max() - Returns min and max of column list
avg() - cals avg of all non null values in a column*/

SELECT 
    COUNT(emp_no)
FROM
    employees;
    
SELECT 
    COUNT(first_name)
FROM
    employees;
    
    
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;

SELECT 
    COUNT(*)
FROM
	dept_Manager;