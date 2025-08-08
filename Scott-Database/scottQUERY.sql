CREATE TABLE EMP

(EMPNO NUMERIC(4) NOT NULL,
ENAME VARCHAR(10), 
JOB VARCHAR(9),
MGR NUMERIC(4), 
HIREDATE DATE, 
SAL NUMERIC(7, 2), 
COMM NUMERIC(7, 2), 
DEPTNO NUMERIC(2));


INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902, CONVERT(date, '17-DEC-1980'),800, NULL, 20);

INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698, CONVERT(date, '20-FEB-1981'), 1600, 300, 30);

INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698, CONVERT(date,'22-FEB-1981'), 1250,500, 30);

INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, CONVERT (date, '2-APR-1981'), 2975, NULL, 20); 

INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN',7698, CONVERT(date, '28-SEP-1981'), 1250, 1400, 30);

INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839, CONVERT (date, '1-MAY-1981'), 2850, NULL, 30); 

INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839, CONVERT (date,'9-JUN-1981'), 2450, NULL, 10);

INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7566, CONVERT (date,'09-DEC-1982'), 3000, NULL, 20);

INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, CONVERT(date, '17-NOV-1981'), 5000, NULL, 10);

INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698, CONVERT(date, '8-SEP-1981'), 1500, 0, 30);

INSERT INTO EMP VALUES (7876, 'ADAMS', 'CLERK',7788, CONVERT(date, '12-JAN-1983'), 1100, NULL, 20);

INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698, CONVERT(date, '3-DEC-1981'), 950, NULL, 30);

INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566, CONVERT(date, '3-DEC-1981'), 3000, NULL, 20);

INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782, CONVERT (date, '23-JAN-1982'), 1300, NULL, 10);



CREATE TABLE DEPT 
	(DEPTNO NUMERIC(2), 
	DNAME VARCHAR(14), 
	LOC VARCHAR(13));

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');

INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');

INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');

INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');



Select * 
from INFORMATION_SCHEMA.TABLES;  --To see all the table names

EXEC sp_help 'dbo.EMP';  --to see all attrubutes of a table







/* LAb 06  */

/*------PART 1----- */
select ENAME, SAL, SAL*2 as 'Double Salary'
from emp
/*------PART 2----- */
select ENAME, JOB, SAL
from emp
where COMM = 0 or COMM is NULL 
/*------PART 3----- */
select distinct JOB
from emp
/*------PART 4----- */
select EMPNO, ENAME, JOB, SAL
from emp
where SAL>1500 and JOB LIKE '%MAN%'
/*------PART 5----- */
select ENAME, JOB
from emp
where JOB not IN('MANAGER','ANALYST','SALESMAN')
/*------PART 6----- */
select *
from emp
order by SAL

---------------------------------------------------------------------------------------------------


/* Notes: the round function is used to round off numbers. Its parameters are
(number, no of digits to round of, x); here x is like a mode switch, if 0,
 it rounds of, if anything else, it will truncate */



/* ---- LAB07    */
/*-----Q1------*/

select DEPT.DEPTNO as DNumber, dept.DNAME ,min(SAL) as MinimumSalary, max(SAL) as MaximumSalary
from emp
inner join DEPT
on Dept.DEPTNO=emp.DEPTNO
group by DEPT.DEPTNO, DEPT.DNAME

	

/*-----Q2------*/
select EMPNO, ENAME
from emp
where DEPTNO>20 and DEPTNO IN(
	select DEPTNO
	from DEPT
	where DNAME LIKE '%a%')
/*-----Q3-----*/
select EMP.ENAME, SAL
from emp 
where SAL < (
	select SAL/2
	from emp
	where JOB IN ('PRESIDENT')
)
order by SAL
/*-----Q4-----*/
select EMPNO , ENAME
from emp
where EMPNO NOT IN(
	select MGR
	from emp
	where MGR IS NOT NULL
)
/*-----Q5-----*/
SELECT CONCAT(ENAME,' is ' ,JOB) AS INTRO 
from emp


------------------------------------------------------------------------------------

--Lab08 q3 practice

select TOP(1) d.DEPTNO, d.DNAME, d.LOC
from DEPT d
inner join EMP e
ON e.DEPTNO=d.DEPTNO
WHERE SAL = (
select min(maxSAL) as FoundIT
from (
		select TOP(3) e.SAL as maxSAL
		from emp e
		order by SAL desc
		)
	as findingIT
	)

--q4
select TOP(1)avgSAL, DEPTNO, DNAME, LOC
from (
		select AVG(e.SAL)as avgSAL, d.DEPTNO, d.DNAME, d.LOC
		from emp e
		inner join DEPT d
		ON e.DEPTNO=d.DEPTNO
		group by d.DEPTNO, d.DNAME, d.LOC 
		)
	as findingIT
	order by avgSAL 



/*----LAB08-----*/


/*----Q1-----*/

select emp.EMPNO as EMP_NUMBER, emp.ENAME as FULL_NAME, emp.SAL as Salary, dept.DNAME as DEPT_NAME, dept.LOC as DEPT_ADDRESS
from emp
left outer join DEPT
ON EMP.DEPTNO = DEPT.DEPTNO

/*----Q2-----*/

select DEPT.DNAME, COUNT(emp.EMPNO) as Employee_Count
from Dept
full outer join emp
ON DEPT.DEPTNO = emp.DEPTNO

group by DNAME


/*------Q3-------*/

select dept.DEPTNO, dept.DNAME, dept.LOC
from DEPT
inner join EMP
ON DEPT.DEPTNO = EMP.DEPTNO
where sal IN(
	select Min(Salary) as Salary_3rdHighest
	from (
		select distinct TOP(3) SAL as Salary
		from emp
		order by SAL desc
	)
	as Salary3 
	)


/*----Q4-----*/

select TOP(1) Salary_lowestAVG, DEPTNO,DNAME, LOC
FROM (
		select AVG(SAL) as Salary_lowestAVG, dept.DEPTNO, dept.DNAME, dept.LOC
		from emp
		inner join DEPT
		ON emp.DEPTNO = dept.DEPTNO
		group by DEPT.DEPTNO, DNAME, LOC
		
		) as AvgSalLow

		order by Salary_lowestAVG


---------------------------------------------------------------------


------LAB 09

--Q2 practice
--tell max SAL of each dept

select d.DEPTNO, e.SAL
from DEPT d 
inner join EMP e
ON d.DEPTNO = e.DEPTNO
group by d.DEPTNO
order by e.sal desc



/*----Q1-----*/

select DEPT.DNAME, COUNT( EMP.EMPNO ) as Employee_Count
from DEPT
inner join EMP
ON DEPT.DEPTNO = EMP.DEPTNO
where EMP.SAL > 2000
group by DEPT.DNAME


/*----Q2-----*/

select dept.DEPTNO, dept.DNAME, dept.LOC, EMP.SAL
from DEPT
inner join EMP
ON DEPT.DEPTNO = EMP.DEPTNO
where sal IN(
	select MAX(Salary) as salaryMAAAAX
	from (
		select TOP(1) SAL as Salary
		from emp
		order by SAL desc
	)	as SalaryMAXX 
)


/*------Q3------*/

select TOP(1) AVG(emp.sal) as Salary_Average
from DEPT
inner join EMP
ON DEPT.DEPTNO = EMP.DEPTNO
group by DEPT.DEPTNO
order by Salary_Average 



-----------------------------------------------------------------



CREATE TABLE Userr

(	id int NOT NULL,
	name VARCHAR(25) NOT NULL, 
	username VARCHAR(30) NOT NULL,
	DOB DATE

	primary key(id)
);


INSERT INTO Userr VALUES (1001, 'SMITH', 'smithMan', CONVERT(date, '17-DEC-1980'));



CREATE TABLE Post

(	id int NOT NULL,
	description VARCHAR(25) NOT NULL, 
	DOB DATE,
	UserrID int NOT NULL,
	foreign key (UserrID) references Userr(id)
);




----------------------------------------------------------------------------------------------------------------------------------


------LAB 10


--fnuxtion prac

alter function findThis (@DepName VARCHAR(15))
returns int
AS BEGIN
	
	return (
		select SUM(emp.SAL)
		from emp
		inner join DEPT
		On DEPT.DEPTNO=EMP.DEPTNO
		where DEPT.DNAME=@DepName
		
	);

END

select dbo.findThis('SALES') as SUUUm


/*----Q1-----*/

alter PROCEDURE MinAvgSalaryDept
AS
BEGIN

select TOP(1) dept.DNAME, AVG(emp.sal) as Salary_Average
from DEPT
inner join EMP
ON DEPT.DEPTNO = EMP.DEPTNO
group by DEPT.DNAME
order by Salary_Average 

END



EXEC MinAvgSalaryDept




/*----Q2-----*/

alter PROCEDURE EmpWithSalaryLowerThan @Salary integer, @DeptName VARCHAR(14)
AS
BEGIN

select dept.DEPTNO, DEPT.DNAME, emp.ENAME, emp.SAL
from DEPT
inner join emp
ON dept.DEPTNO=emp.DEPTNO
where emp.Sal < @Salary AND DEPT.DNAME= @DeptName

order by dept.DEPTNO

END


EXEC EmpWithSalaryLowerThan @Salary= 2000, @DeptName= 'ACCOUNTING'



/*------Q3------*/
create trigger CreateMessage
on database
for
	CREATE_TABLE
as

BEGIN

print'Table Has been Created Successfully!'

END



/*------Q4------*/
drop table Logs

CREATE TABLE Logs
(
	Activity varchar(40),
	DOB DATE

	primary key(Activity)
);


INSERT INTO EMP VALUES (5000, 'MAHAD', 'MANAGER', NULL, CONVERT(date, '17-DEC-2024'),3000, NULL, 20);

create trigger LogMaintain 
on emp
after insert 
as
BEGIN

print'Called in Log'

INSERT INTO Logs VALUES ( 'New Value added!', getdate());
 
select * from logs

END




/*------Q5------*/
create function SumInThisDept (@DeptName VARCHAR(14))
returns integer
AS
BEGIN

return ( select SUM(emp.SAL)
from DEPT
inner join emp
ON dept.DEPTNO=emp.DEPTNO
where DEPT.DNAME= @DeptName )

END


select dbo.SumInThisDept('Sales') as SalarySum




-----------------------------------------------------------------
