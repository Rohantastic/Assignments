-- Procedure
use bank;
-- ==========
-- 1. Prepare a program which can perform following operation
-- 	- Lookout for tables which has missing constraints
-- 	- Display list of those tables

delimiter $$
drop procedure if exists tables_missing_constraints ;
create procedure tables_missing_constraints()
begin
select table_name  from information_schema.tables where table_name not in 
(select table_name from information_schema.table_constraints where table_schema='bank') and table_schema='bank';
end$$
call tables_missing_constraints();

-- 2. Prepare a program to delete the data from emp. It will receive two inputs employee number and employee name. 
-- If employee number is passed as null then delete the data based on employee name.
-- Backup the deleted data to employee_backup table.
use day1;
delimiter $$
-- select * from emp;
drop procedure if exists delete_data_from_emp $$
create procedure delete_data_from_emp(in pm_empno int, in pm_ename varchar(20))
begin
-- alter table emp
if pm_empno is NULL then
	drop table if exists employee_backup;
	create table employee_backup as select * from emp where ename=pm_ename;
	delete from emp where ename=pm_ename;
else
	drop table if exists employee_backup;
	create table employee_backup as select * from emp where empno=pm_empno;
	delete from emp where empno=pm_empno;

end if;
end $$

set sql_safe_updates=0;
call delete_data_from_emp(7369,'smith');




-- 3. Prepare a program to insert new record in employee table. it will take the input of employee data.
-- If salary is provided as null then consider the salary as highest salary earned by any employee in same department. If comm is not provided then assume it as 200$
use day1;
delimiter $$
-- select * from emp;
drop procedure if exists insert_data_into_emp $$
create procedure insert_data_into_emp(in pm_empno int, in pm_ename varchar(10), in pm_job varchar(9), in pm_mgr int,in pm_sal float,in pm_comm float, in pm_deptno int)
begin
insert into emp(EMPNO,ENAME,JOB,MGR,SAL,COMM,DEPTNO) values(pm_empno,upper(pm_ename),upper(pm_job),pm_mgr,pm_sal,pm_comm,pm_deptno);
IF pm_sal is null then
	set @salary = (select max(sal) from emp group by deptno having deptno=pm_deptno);
	update emp set sal=(@salary) where empno=pm_empno;
	-- insert into emp(sal) values(@sal) where empno=pm_empno;
end if;
if pm_comm is null then
		update emp set comm=200 where empno=pm_empno;
end if;
end $$



call insert_data_into_emp(1000,'dhoni','boss',null,null,null,10);

delete from emp where empno=1000;




-- 4. Prepare a program to receive the input as table name and column name. Add primary key constraint on provided table's column.
delimiter $$
drop procedure if exists add_pk_constraint $$
create procedure add_pk_constraint(in pm_table_name varchar(64),in pm_col_name varchar(64))
begin
 set @q=concat('alter table ', pm_table_name,' add constraint pk_con primary key (',pm_col_name,')');
 prepare stm from @q;
 execute stm;
 deallocate prepare stm;
end$$
call add_pk_constraint('employee_backup','empno');

-- 5. Prepare a program to list those employee who are earning less then avg of there deparment.
--  This program may take input as (p_salary_fix BOOLEAN). If the input is given as true then these employees salary must be set to AVG Salary + 100$.


