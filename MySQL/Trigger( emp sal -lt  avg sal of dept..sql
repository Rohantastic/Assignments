-- 1. Create a trigger to raise error if employee salary is less then avg salary of corresponding department.

use scottschema;

drop trigger emp_sal_trig;

DELIMITER #
CREATE TRIGGER emp_sal_trig
BEFORE INSERT ON emp
FOR EACH ROW
BEGIN
     
     --  DECLARE v_deptno INTEGER;
     declare V_avg_sal integer;
     select avg(sal) from emp where deptno = New.deptno into v_avg_sal;
     
     /* IF NEW.deptno IS NULL THEN
         SELECT max(deptno)+10 INTO v_deptno FROM emp;
         SET NEW.DEPTNO = v_deptno;
	  END IF; */
      
      IF NEW.sal  <= v_avg_sal THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary is less than average salary of dept';
	 END IF;
	END#

INSERT INTO emp(empno,sal,deptno) values(1108,100,20);
select * from emp;


/* 2. Add an additional column called to emp table called as last_updated_by and last_updated_date.
   Upon each update issued on emp table, these columns must be updated by database user and current date (use function current_user() and SYSDATE())
 */  
 ALTER TABLE EMP ADD  LAST_UPDATED_BY VARCHAR(50) ;
  ALTER TABLE EMP ADD  LAST_UPDATED_DATE DATE ;

 drop trigger EMP_aft_change;
 DELIMITER #
 CREATE TRIGGER EMP_aft_change
 BEFORE INSERT
 ON emp
 FOR EACH ROW
 
 BEGIN
      SET new.last_updated_by = current_user();  
      SET new.last_updated_date = sysdate();

  END #
 
 INSERT INTO EMP(empno,ename) values (7799, 'bukk');
 select current_user ();
 select * from emp;
 
-- 3.  Upon delete of department records from dept table. The corresponding employees records must be deleted as well. Implement this requirement with trigger

/*4. Create a table with following design

      Table NAme : scott_schema_audit
	   Columns : table_name, operation_name, db_user, change_date

   Populate this table each time the user perform any DML command on emp,dept or salgrade table. Sample data will look like
                 table_name, operation_name, db_user, change_date
				 emp          update         root@localhost   2020-09-14
				 dept         delete         root@localhost   2020-09-15
				 ....
	*/			 
    
    use scottschema;
     create table SCOTT_SCHEMA_AUDIT (table_name varchar(20), operation_name varchar(20), db_user varchar(50), change_date date);
     
     DELIMITER #
     CREATE TRIGGER trig_scott_audiT
     BEFORE INSERT on SCOTT_SCHEMA_AUDIT
     FOR EACH ROW
     BEGIN
      
      
      
      
      END#