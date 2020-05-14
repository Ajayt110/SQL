/* Views - A vrtual table contents are obtained from an existing table or from the base table.  
View shows the data from the table, view doesn't save or contain the table. */

CREATE OR REPLACE VIEW v_Latest_dept_date AS
    SELECT 
        emp_no,
        MAX(from_date) AS 'from_date',
        MAX(to_date) AS 'to_date'
    FROM
        dept_emp
    GROUP BY emp_no
    ORDER BY emp_no;
    
CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT 
        ROUND(AVG(s.salary), 2) AS 'AVERAGE SALARY'
    FROM
        salaries s
            JOIN
        titles t ON t.emp_no = s.emp_no
    WHERE
        t.title = 'Manager';