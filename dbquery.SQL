--===========================================================================================================
                                                 --LOGICAL OPERATOR 
select * from employees where job_id='AD_PRES' or job_id='ST_CLERK' and salary > 36000;
select  last_name,salary from employees where salary between 1000 and 13000 and last_name like '_____';
select * from employees where job_id='ST_CLERK' and department_id in (10,20,30,50);
select * from employees where job_id is not null and commission_pct is null and 
(first_name like 'A%' or first_name like 'S%') and salary like '2%' and 
 hire_date BETWEEN '01-01-2011' and '31-12-2011'; 
 
--===========================================================================================================
                                                   --FUNCTION 
--===========================================================================================================                                                  
--1>SINGLE ROW FUCTION
   --A>CHARACTER FUNCTION
      --i>CASE MANUPULATION FUNCTION


      --ii>CHARACTER MANUPULATION FUNCTION
      
                                        --length(value)
select length('Banglore is beautiful') from dual;
select first_name, length(first_name) from employees;
select * from employees where length(salary)<=4;
select first_name,last_name from employees where length(last_name)<6;

                                        --substr(string,position,length)
select substr('tendulkar',2) from dual;
select substr('tendulkar',-1) from dual;
select substr('tendulkar',4,2) from dual;
select substr('tendulkar',-1,-4) from dual;--null
select substr('tendulkar',-1) from dual;
select * from employees where substr(last_name,3,1)in ('r','R');
select * from employees where substr(last_name,1,1)in ('U','O','I','E','A');
                                          
                                       --instr()
 --*instr(string,charater)
 select instr('sachin','a') from dual;
 select instr('sachin','ch') from dual;
 select instr('malayalam','a',1,4) from dual;
 select instr('malayalam','a',-2,4) from dual;
 select instr('malayalam','a',4,4) from dual;
 
 --*instr(string,charater,position,occurance) with length()
 select instr(last_name,'dul') from employees where last_name='Tendulkar';
 
 --*substr() with length(),upper() and lower()
 SELECT upper(substr(first_name,1,length(first_name)/2))||
 lower(substr(first_name,length(first_name)/2+1)) from employees;
 
 --*instr(string,charater,position,occurance) with substr(),concat(),length() and alias
 select substr(last_name,instr(last_name,'dul'),length('dul')) from employees where last_name='Tendulkar';
 select SUBSTR((concat(first_name||' ',last_name)),1,instr(concat(first_name||' ',last_name),' ',1,1)-1)
 as "full name" from employees;
 select substr(concat(first_name||' ',last_name),(instr(concat(first_name||' ',last_name),' '))+1)
 from employees;
 
                                        --REPLACE()
select replace('Banglore','B','M') from dual;
select REPLACE('JACK and JUE','J','BL') from dual;
select replace('Captain Vivek','Vivek')from dual;
select replace('MISSISIPPI','IS',15)FROM DUAL;
    
--B>GENERAL FUNCTION
                                        --NVL()
select commission_pct, NVL(commission_pct,0)from employees;

                                        --NVL2()
select commission_pct, NVL(commission_pct,0),NVL2(commission_pct,5,0)from employees;
SELECT EMPLOYEE_ID,FIRST_NAME,NVL(SALARY+COMMISSION_pct,0) AS "SALARY" from employees;
                                                  
--C>NUMBER FUNCTION
                                        --ROUND()
SELECT ROUND(45.326,2)FROM EMPLOYEES;
SELECT ROUND(1234.356,1)FROM EMPLOYEES;
SELECT ROUND(2678.345,-3)FROM EMPLOYEES;
SELECT ROUND(2678.345,-4)FROM EMPLOYEES;

                                        --TRUNC()
SELECT TRUNC(45.326,2)FROM EMPLOYEES;
SELECT TRUNC(1234.356,1)FROM EMPLOYEES;
SELECT TRUNC(2678.345,-3)FROM EMPLOYEES;
SELECT TRUNC(2678.345,-4)FROM EMPLOYEES;

                                        --CEIL()
SELECT CEIL(45.326)FROM EMPLOYEES;
SELECT CEIL(1234.356)FROM EMPLOYEES;

                                        --FLOOR()                                          
SELECT FLOOR(45.326)FROM EMPLOYEES;
SELECT FLOOR(1234.356)FROM EMPLOYEES;

                                        --MOD()
SELECT * FROM EMPLOYEES WHERE MOD(EMPLOYEE_ID,2)=0;
SELECT * FROM EMPLOYEES WHERE MOD(EMPLOYEE_ID,2)!=0;

                                        --SQRT()                               
SELECT ROUND(SQRT(5),2)FROM DUAL;
SELECT ROUND(SQRT(25),2)FROM DUAL;

                                        --SQRT()                               
SELECT POWER(5,2)FROM DUAL;
SELECT POWER(25,2)FROM DUAL;
                                                  
--D>DATE FUNCTION               
                                                  --MONTH_BETWEEN()
SELECT MONTHS_BETWEEN('14-11-2018','14-02-2018')AS "MONTH" FROM DUAL;
SELECT MONTHS_BETWEEN('14-02-2018','14-11-2018')AS "MONTH" FROM DUAL;
                                                  
                                                  --ADD_MONTH
SELECT ADD_MONTHS('O14-02-2019',9)FROM DUAL;
                                                  
                                                  --NEXT_DAY()
SELECT NEXT_DAY('31-AUG-2019',2) FROM DUAL;
SELECT NEXT_DAY('31-AUG-2019','FRI') FROM DUAL;
SELECT NEXT_DAY('31-AUG-2019','FRIDAY') FROM DUAL;
SELECT NEXT_DAY('31-AUG-2019','FRIEND') FROM DUAL;
                                                  
                                                   --LAST_DAY()
SELECT LAST_DAY('31-AUG-2019') FROM DUAL;
SELECT LAST_DAY('25-AUG-2019') FROM DUAL;                                                                              

                                                   --EXTRACT()
SELECT HIRE_DATE,EXTRACT(DAY FROM HIRE_DATE)AS DAY,
EXTRACT(MONTH FROM HIRE_DATE)AS MONTH,
EXTRACT(YEAR FROM HIRE_DATE)AS YEAR FROM EMPLOYEES; 
SELECT * FROM EMPLOYEES WHERE EXTRACT(DAY FROM HIRE_DATE)=10;       
SELECT * FROM EMPLOYEES WHERE EXTRACT(MONTH FROM HIRE_DATE)=08;

------------------------------------------------------------------------------------------------------------
                                           
--2>MULTI ROW/AGGREGATE/GROUP FUCTION
                                        --COUNT()
SELECT COUNT(*) FROM EMPLOYEES;
SELECT COUNT(FIRST_NAME) FROM EMPLOYEES;
SELECT COUNT(*)/2 FROM EMPLOYEES;

                                        --SUM()
SELECT SUM(SALARY) FROM EMPLOYEES;
SELECT COUNT(*),SUM(SALARY) FROM EMPLOYEES WHERE department_id=20;
SELECT COUNT(FIRST_NAME),SUM(SALARY) FROM EMPLOYEES WHERE FIRST_NAME LIKE'%ll%';

                                        --AVG()
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES;
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES;

                                        --MIN()
SELECT MIN(SALARY) FROM EMPLOYEES;
SELECT MIN(HIRE_DATE)FROM employees;

                                        --MAX()
SELECT MAX(SALARY) FROM EMPLOYEES;
SELECT MAX(HIRE_DATE)FROM employees;
SELECT COUNT(*),SUM(SALARY),MAX(SALARY),MIN(SALARY),AVG(SALARY)FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL;


                                        --GROUP BY <--Clause
SELECT COUNT(*),department_id, SUM(salary) FROM EMPLOYEES GROUP BY department_id;
SELECT department_id, SUM(salary) FROM EMPLOYEES WHERE DEPARTMENT_ID=20 GROUP BY department_id;
SELECT department_id, MAX(salary) FROM EMPLOYEES WHERE DEPARTMENT_ID > 20 GROUP BY department_id;
SELECT COUNT(*) FROM EMPLOYEES WHERE JOB_ID='ST_CLERK' GROUP BY department_id;
SELECT department_id,MAX(SALARY),MIN(SALARY) FROM EMPLOYEES GROUP BY department_id;

                                        --HAVING  <--Clause
SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE JOB_ID='ST_CLERK' GROUP BY DEPARTMENT_ID 
HAVING COUNT(DEPARTMENT_ID)>2;
SELECT MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID HAVING COUNT(*)<15;

                                        --ORDER BY  <--Clause
SELECT FIRST_NAME FROM EMPLOYEES ORDER BY FIRST_NAME;
SELECT FIRST_NAME FROM EMPLOYEES ORDER BY FIRST_NAME DESC;
SELECT LAST_NAME,FIRST_NAME FROM EMPLOYEES ORDER BY LAST_NAME,FIRST_NAME DESC;
SELECT LAST_NAME,FIRST_NAME FROM EMPLOYEES ORDER BY FIRST_NAME DESC,LAST_NAME ASC;
SELECT DEPARTMENT_ID,MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID>10 GROUP BY department_id 
HAVING MAX(SALARY)>20000 ORDER BY department_id;
                                                  
--============================================================================================================
                                               --*JOINS
--============================================================================================================                                                 
                                        --CARTESIAN/CROSS JOINS
SELECT * FROM TAB1 , TAB2; 
SELECT * FROM TAB1 CROSS JOIN TAB2;
SELECT * FROM TAB1 , TAB2,TAB3; 
SELECT * FROM TAB1 CROSS JOIN TAB2 CROSS JOIN TAB3; 
select * from employees,departments;
select * from employees CROSS JOIN departments;
SELECT * FROM TAB1 , TAB2 WHERE A=1;  
SELECT * FROM TAB1 CROSS JOIN TAB2 WHERE A=1;  
select * from employees,departments WHERE FIRST_NAME='Sachin';
select * from employees CROSS JOIN departments WHERE FIRST_NAME='Sachin';
select * from employees,departments WHERE LOCATION_ID=2500;
select * from employees CROSS JOIN departments WHERE LOCATION_ID=2500;
SELECT * FROM TAB1 , TAB2 WHERE B=2;--AMBIGUITY  
SELECT * FROM TAB1 CROSS JOIN TAB2 WHERE B=2;--AMBIGUITY  
select * from employees,departments WHERE department_id=90;--AMBIGUITY
select * from employees CROSS JOIN departments WHERE department_id=90;--AMBIGUITY

                                        --TABLE ALIAS
SELECT * FROM TAB1 T1 , TAB2 T2 WHERE T1.B=2;  
SELECT * FROM TAB1 T1 CROSS JOIN TAB2 T2 WHERE T1.B=2;  
SELECT * FROM TAB1 T1 , TAB2 T2,TAB3 WHERE T1.B=2;  
SELECT * FROM TAB1 T1 CROSS JOIN TAB2 T2 CROSS JOIN TAB3 WHERE T1.B=2; 
select * from employees e,departments d WHERE E.department_id=90;
select * from employees e CROSS JOIN departments d WHERE E.department_id=90;
select * from employees e,departments d WHERE D.department_id=90;
select * from employees E CROSS JOIN departments d WHERE D.department_id=90;
select * from employees e,departments d WHERE E.department_id=90 AND d.department_id=90;
select * from employees e CROSS JOIN departments d WHERE E.department_id=90 AND d.department_id=90;

                                        --EQUI/INNER JOIN
SELECT * FROM TAB1 E , TAB2 D WHERE E.B=D.B;
SELECT * FROM TAB1 E INNER JOIN TAB2 D ON E.B=D.B;
SELECT * FROM TAB1 E,TAB2 D,TAB3 T WHERE E.B=D.B AND D.C=T.C;
SELECT * FROM TAB1 E INNER JOIN TAB2 D ON E.B=D.B INNER JOIN TAB3 T ON D.C=T.C;
SELECT * FROM EMPLOYEES E,DEPARTMENTS D WHERE e.department_id=d.department_id ;
SELECT * FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON e.department_id=d.department_id ;
SELECT e.employee_id,d.department_name FROM EMPLOYEES E,DEPARTMENTS D 
                                                  WHERE e.department_id=d.department_id AND d.department_name='Administration';
SELECT e.employee_id,d.department_name FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON e.department_id=d.department_id 
                                                  WHERE d.department_name='Administration';

                                        --LEFT OUTER JOIN 
SELECT * FROM TAB1 E LEFT OUTER JOIN TAB2 D ON E.B=D.B;
SELECT * FROM EMPLOYEES E LEFT OUTER JOIN departments D ON e.department_id=d.department_id;

                                        --RIGHT OUTER JOIN 
SELECT * FROM TAB1 E RIGHT OUTER JOIN TAB2 D ON E.B=D.B;
SELECT * FROM EMPLOYEES E RIGHT OUTER JOIN departments D ON e.department_id=d.department_id;

                                        --FULL OUTER JOIN 
SELECT * FROM TAB1 E FULL OUTER JOIN TAB2 DON E.B=D.B;
SELECT * FROM EMPLOYEES E FULL OUTER JOIN departments D ON e.department_id=d.department_id;
                                                  


                                                  





