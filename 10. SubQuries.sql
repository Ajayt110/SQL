SELECT 
    e.emp_no, e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm)
            order by e.emp_no;
  
  
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
/*
Exists and No Exists 

Exists is similar to in when used in sub quries.Returns boolean value. Row by row checking.
It tests the row values for existance and In searches among values
Exists is fater with larger data set and in is fater with smaller data set. 

*/

/*

Use of sub queries -- On certain conditions bad fro performance
-- helps better structuring of outer query, thus each inner query can be thought of an isolation.
Sub quries more intuitive than joins and unions- Enhanced readability.

*/
use employees;

SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND t.title = 'Assistant Engineer')
ORDER BY e.emp_no;


drop table if exists emp_manager;
create table emp_manager
(
	emp_no int not null,
    dept_no char(4) null,
    manager_no int not null
);


SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS 'Employee_ID',
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = '110022') AS 'Manager_ID'
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION ALL SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS 'Employee_ID',
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = '110039') AS 'Manager_ID'
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        de.emp_no > '10020'
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;
    
    
    /*----------------------------------Assignment SOlution --------------------------2 */
    
    insert into emp_manager Select
    S.* from(
    SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS 'Employee_ID',
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = '110022') AS 'Manager_ID'
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION 
SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS 'Employee_ID',
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = '110039') AS 'Manager_ID'
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no>'10020'
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B
    UNION
        SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no AS 'Employee_ID',
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = '110039') AS 'Manager_ID'
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = '110022'
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C
    UNION 
		SELECT 
    D.*
FROM
    (SELECT 
        e.emp_no AS 'Employee_ID',
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = '110022') AS 'Manager_ID'
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = '110039'
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D
    ) as S;
    
      SELECT 
    D.*
FROM
    (SELECT 
        e.emp_no AS 'Employee_ID',
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = '110022') AS 'Manager_ID'
    FROM
        employees e
    JOIN dept_emp de ON de.emp_no = e.emp_no
    WHERE
        de.emp_no = '110039'
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D;
    
     SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no AS 'Employee_ID',
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = '110039') AS 'Manager_ID'
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        de.emp_no = '110022'
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C;
    
    
drop table emp_manager;
    select * from emp_manager;
    
    /*------------------------------------ SELF JOIN -------------------------------------*/
   
   SELECT 
    *
FROM
    emp_manager
ORDER BY emp_manager.emp_no;

SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
SELECT 
    e2.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;

SELECT
	e1.emp_no,e2.manager_no
    from emp_manager e1
    join emp_manager e2 on e1.emp_no = e2.manager_no;
    
    
SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 on e1.emp_no = e2.manager_no
    group by e1.manager_no;