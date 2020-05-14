use employees;


drop procedure if exists new_pro;
delimiter $$
create procedure select_employees()
Begin
select * from employees
limit 1000;
end$$
delimiter ;

call employees.select_employees();

call select_employees; ## since we are already using employees DB.alter

drop procedure if exists average_salary;

delimiter $$
create procedure average_salary()
begin
select round(avg(salary),2) from salaries;
end$$
delimiter ;

call average_salary;

call employees.average_salary();

