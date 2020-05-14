alter table departments_dup
drop column dept_manager;


select * from departments_dup;

alter table departments_dup 
modify column dept_no char(4);

insert into departments_dup values ('Public Relations');

delete from departments_dup where dept_no='d002';

select * from departments_dup order by dept_no;


create table dept_manager_dup
(
emp_no int NOT NULL,
dept_no char(4) NULL,
from_date date NOT NULL,
to_date date NULL
);

INSERT INTO dept_manager_dup
select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 