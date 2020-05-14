insert into titles 
values
(
999903,' Senior Engineer','1997-10-01','2099-01-01'
);

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;

select * from dept_emp;


insert into dept_emp 
values(999903,'d005','1997-10-01','9999-01-01');

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

SELECT 
    *
FROM
    departments_dup;
    
insert into departments values('d010','Business Analysis');

insert into departments_dup select * from departments;