USE PG_DAC;
-- 1) Display all records in EMP table those were joined before SCOTT joined?
SELECT E.ENAME,E.HIREDATE 
FROM EMP E JOIN (SELECT * FROM EMP WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT') ) E1 
ON E.EMPNO = E1.EMPNO;

-- 2) Display details of department where department has 3 employees?
SELECT COUNT(E.ENAME) , D.DNAME 
FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
GROUP BY D.DEPTNO
HAVING COUNT(E.ENAME)=3;

-- 3) Display details of department with Minimum salary and maximum salary?
SELECT D.*,E.SAL 
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.SAL IN ((SELECT MAX(SAL) FROM EMP) ,(SELECT MIN(SAL) FROM EMP));

-- 4) Display all ename, sal, deptno,dname from emp, dept table where all department which has employees as well as department does not have any employees. This query should include non matching rows.
SELECT e.ename, e.sal, e.deptno, d.dname
FROM emp e RIGHT OUTER JOIN dept d ON e.deptno = d.deptno;

-- 5) Display all ename, sal, deptno from emp, dept table where all employees which has matching department as well as employee does not have any departments. This query should include non matching rows.
SELECT  e.deptno, d.dname,e.ename, e.sal
FROM emp e RIGHT OUTER JOIN dept d ON e.deptno = d.deptno;

-- 6) Display all ename, sal, dname. Result must include all employees as well as all departments. This query should include non matching rows on both the tables.

-- 7) Display all ename, empno, dname from emp, dept table without joining two tables
SELECT e.ename, e.sal, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- 8) Display all the departments where department does not have any employees
SELECT e.ename, d.deptno, d.dname
FROM emp e RIGHT OUTER JOIN dept d ON e.deptno = d.deptno
WHERE e.ename IS NULL;

-- 9) Display all the departments where department does have atleast one employee
SELECT DISTINCT d.dname, COUNT(e.ename), d.deptno
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY d.deptno
HAVING COUNT(e.ename) > 0;

-- 10) Display all employees those who are not managers?
SELECT E1.*
FROM EMP E1 
JOIN (SELECT * FROM EMP WHERE EMPNO NOT IN ( SELECT IFNULL(MGR,0) FROM EMP)) E2 
ON E1.EMPNO = E2.EMPNO;

-- 11) Display all the records for deptno which belongs to employee name JAMES?
SELECT E.* 
FROM EMP E JOIN (SELECT * FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JAMES') ) E1 
ON E.EMPNO = E1.EMPNO;

-- 12) Display all the records in emp table where salary should be less then or equal to ADAMS salary?
SELECT E.*
FROM EMP E JOIN (SELECT * FROM EMP WHERE sal <= (SELECT sal FROM EMP WHERE ENAME = 'ADAMS') ) E1 
ON E.EMPNO = E1.EMPNO;

-- 13) Display ename, sal, grade, dname, loc for each employee.
SELECT E.ENAME,E.SAL,S.*,D.DNAME,D.LOC
FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
			JOIN SALGRADE S ON SAL BETWEEN S.LOSAL AND S.HISAL;
            
-- 14) Display all employee whose location is DALLAS?
SELECT E.*
FROM EMP E JOIN (SELECT * FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS') ) E1 
ON E.EMPNO = E1.EMPNO;