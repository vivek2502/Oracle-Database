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
