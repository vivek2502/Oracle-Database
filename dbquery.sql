create table DEPARTMENTS (DEPARTMENT_ID NUMBER(4), DEPARTMENT_NAME VARCHAR2(100) NOT NULL, MANAGER_ID NUMBER(5),
LOCATION_ID NUMBER(5), CONSTRAINT DEPT_ID_PK PRIMARY KEY (DEPARTMENT_ID));
select * from employees where job_id='AD_PRES' or job_id='ST_CLERK' and salary > 36000;
select  last_name,salary from employees where salary between 1000 and 13000 and last_name like '_____';
select * from employees where job_id='ST_CLERK' and department_id in (10,20,30,50);
select * from employees where job_id is not null and commission_pct is null and 
(first_name like 'A%' or first_name like 'S%') and salary like '2%' and 
 hire_date BETWEEN '01-01-2011' and '31-12-2011';
--===========================================================================================================

                                        --FUNCTION 
--1>SINGLE ROW FUCTION
   --A>CHARACTER FUNCTION
      --i>CASE MANUPULATION FUNCTION

------------------------------------------------------------------------------------------------------------
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
                                                  --SQRT()                               
SELECT POWER(5,2)FROM DUAL;
SELECT POWER(25,2)FROM DUAL;
--SELECT SYSDATE FROM DUAL;                                        



                                                  





