SELECT GET_EMP_COUNT(10)
FROM DUAL;

SELECT DEPARTMENT_ID,
       DEPARTMENT_NAME,
       get_emp_count(DEPARTMENT_ID) CNT
FROM DEPARTMENTS;


SELECT DEPARTMENT_ID,
       DEPARTMENT_NAME,
       get_total_annual_salary(DEPARTMENT_ID) DEPT_TOTAL_SALARY
FROM DEPARTMENTS;