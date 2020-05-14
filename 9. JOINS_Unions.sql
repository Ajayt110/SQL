/*----------------------------------INNER JOIN ----------------------------------*/
/*It will help hus join the result set or the common field of the both the tables. 
Matchng records- the dept_no column of the dept_manager_dup and the department_dup will be the resultant of the inner join of both tables,
This is called as the matching values. The remaining fields are the non-matching records.*/

SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        JOIN
    dept_manager_dup m ON d.dept_no = m.dept_no
ORDER BY m.dept_no;

/*Only non null & matching values will be displayed by inner join. Inner join pr the JOIN is the same 
By default Join is taken by default as Inner Join */

SELECT 
    d.emp_no, d.first_name, d.last_name, m.dept_no, d.hire_date
FROM
    employees d 
        JOIN
    dept_manager_dup m ON d.emp_no = m.emp_no
ORDER BY m.dept_no; 

/* TO remove the duplicated rows from the output always use GROUP BY clause to most differed clause in the table.*/

/*------------------------- LEFT JOIN -----------------------------*/

delete from dept_manager_dup
where emp_no='110228';

delete from departments_dup
where dept_no='d009';

insert into dept_manager_dup
values('110228','d003','1992-03-21','9999-01-01');
insert into departments_dup
values('d009','Customer Service');

SELECT 
    dm.dept_no, dm.emp_no, dd.dept_name
FROM
    departments_dup dd /*Left Table -- Here order matters*/
        LEFT JOIN
     dept_manager_dup dm /*Right table*/ON dm.dept_no = dd.dept_no
GROUP BY emp_no
ORDER BY dept_no;

select * from dept_manager_dup;
insert into departments_dup values(NULL,'Public Relations');
select * from departments_dup order by dept_no;


SELECT 
    dm.dept_no, dm.emp_no, dd.dept_name
FROM
    dept_manager_dup dm
        LEFT JOIN
    departments_dup dd ON dm.dept_no = dd.dept_no
WHERE
    dept_name IS NULL
ORDER BY dd.dept_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY emp_no DESC , e.emp_no;

## ----------------------------New JOIN is using JOIN key word and Old JOIN is using where clause ------------------------
SELECT 
    dm.dept_no, dm.emp_no, dd.dept_name
FROM
    dept_manager_dup dm
        INNER JOIN
    departments_dup dd ON dm.dept_no = dd.dept_no
ORDER BY dm.dept_no;

SELECT 
    dm.dept_no, dm.emp_no, dd.dept_name
FROM
    dept_manager_dup dm,departments_dup dd
    where
    dm.dept_no = dd.dept_no;/*  Using where is time consuming and very old programming method.  */
    

SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e,
    dept_manager m
WHERE
    e.emp_no = m.emp_no
ORDER BY emp_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000
ORDER BY emp_no;

set @global.sql_mode:=replace(@@global.sql_mode,'ONLY_FULL_GROUP_BY','');

select @@global.sql_mode;

SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch'
ORDER BY e.emp_no;

/*--------------------CROSS JOIN----------------------
Acts as cross product of all the table values */

SELECT 
    dm.*, dp.*
FROM
    dept_manager dm
        CROSS JOIN
    departments dp
ORDER BY dm.emp_no , dp.dept_no;

SELECT 
    e.*, dp.*
FROM
    departments dp
        CROSS JOIN
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no
ORDER BY emp_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_no;

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d 
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;


SELECT 
    e.gender, ROUND(AVG(s.salary), 2) AS AVG_SALARY
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;

select
e.first_name,e.last_name, e.hire_date,m.from_date,d.dept_name
from
  departments d
join 
dept_manager m on d.dept_no = m.dept_no
join 
employees e on m.emp_no = e.emp_no 
order by e.emp_no;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    t.from_date,
    dp.dept_name
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    dept_manager d ON d.emp_no = t.emp_no
        JOIN
    departments dp ON d.dept_no = dp.dept_no;
    

SELECT 
    d.dept_name, AVG(s.salary) AS 'Average Dept Salary'
FROM
    dept_manager dm
        JOIN
    departments d ON dm.dept_no = d.dept_no
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC;

SELECT 
    e.gender, COUNT(t.emp_no) AS 'Count Managers by Gender'
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
GROUP BY (e.gender);

SELECT 
    e.gender, COUNT(dm.emp_no) AS 'Count Managers by Gender'
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY (e.gender);

use employees;
CREATE TABLE employees_dup (
    emp_no INT,
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

insert into employees_dup
select e.* from employees e
limit 20;

SELECT 
    e.*
FROM
    employees_dup e;


insert into employees_dup values(10001 ,'1953-09-02'	, 'Georgi',	'Facello' ,	'M' ,	'1986-06-26');

SELECT 
    ed.emp_no,
    ed.first_name,
    ed.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup ed
WHERE
    ed.emp_no = 10001 
UNION SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    dm.dept_no,
    dm.from_date
FROM
    dept_manager dm;
    
/*
Union and Union all shall be applied only when both the tables have same columns and in same order,
If no same columns use NULL AS before the distinct columns to give all values a null and table will be in order

Union - It will give only disinct values from the left table or first table. It gives results better.

Union all - It will display all values including duplicates as well. It has better performance.
 */
 SELECT
 *
 FROM
 (
 SELECT 
    ed.emp_no,
    ed.first_name,
    ed.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup ed
WHERE
    ed.last_name = 'Denis' 
UNION SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    dm.dept_no,
    dm.from_date
FROM
    dept_manager dm) as a
ORDER BY -a.emp_no DESC;