-- 급여가 12000을 넘는 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 12000
ORDER BY SALARY ASC;

-- 급여가 5000이상 12000이하인 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000    -- between을 활용해도 됨
AND SALARY <= 12000
ORDER BY SALARY ASC;

-- 2007년에 입사한 직원의 아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >= '2007-01-01' AND HIRE_DATE < '2008-01-01'
ORDER BY HIRE_DATE ASC;
-- 다른 방식
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2007';

-- 20번 혹은 50번 부서에 소속된 직원의 이름과 부서번호를 조회하고, 이름을 알파벳순으로 정렬해서 조회하기
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(20, 50)
ORDER BY FIRST_NAME ASC;

-- 급여가 5000이상 12000이하고, 20번 혹은 50번 부서에 소속된 사원의 이름과 급여, 부서번호를 조회하기
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 12000
AND DEPARTMENT_ID IN(20, 50);

-- 관리자가 없는 직원의 이름과 직종, 급여를 조회하기
SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- 직종이 'SA_MAN'이거나 'ST_MAN'인 직원중에서 급여를 8000이상 받는 직원의 아이디, 이름, 직종, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 8000
AND JOB_ID LIKE 'SA_MAN'
OR JOB_ID LIKE 'ST_MAN';
-- 다른 방식
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID IN('SA_MAN', 'ST_MAN')
AND SALARY >= 8000;

-- 모든 직원의 이름, 직종아이디, 급여, 소속부서명을 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE e.department_id = D.DEPARTMENT_ID(+);

-- 모든 직원의 이름, 직종아이디, 직종제목, 급여, 최소급여, 최대급여를 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, J.MIN_SALARY, J.MAX_SALARY
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;

-- 모든 직원의 이름, 직종아이디, 직종제목, 급여, 최소급여와 본인 급여의 차이를 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, J.MIN_SALARY, (E.SALARY - J.MIN_SALARY) AS SALARY_GAP
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID;

-- 커미션을 받는 모든 직원의 아이디, 직원이름, 부서이름, 소속부서의 소재지(도시명)을 조회하기
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.COMMISSION_PCT IS NOT NULL
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID(+);

-- 이름이 A나 a로 시작하는 모든 직원의 이름과 직종아이디, 직종제목, 급여, 소속부서명을 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE E.JOB_ID = J.JOB_ID(+)
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND (E.FIRST_NAME LIKE 'A%'
OR E.FIRST_NAME LIKE 'a%');
-- 다른 방식
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE (E.FIRST_NAME LIKE 'a%' OR E.FIRST_NAME LIKE 'A%')
AND E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;
-- 다른 방식
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE SUBSTR(E.FIRST_NAME, 1, 1) IN ('A', 'a')
AND E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 30, 60, 90번 부서에 소속되어 있는 직원들 중에서 100에게 보고하는 직원들의 이름, 직종아이디, 급여, 급여등급을 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, SALARY, G.GRADE
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.DEPARTMENT_ID IN(30, 60, 90)
AND E.MANAGER_ID = 100
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY;

-- 80번 부서에 소속된 직원들의 이름, 직종아이디, 직종제목, 급여, 최소급여, 최대급여, 급여등급, 소속부서명을 조회하기
SELECT E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE, E.SALARY, J.MIN_SALARY, J.MAX_SALARY, G.GRADE, D.DEPARTMENT_NAME 
FROM EMPLOYEES E, JOBS J, SALARY_GRADES G, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = 80
AND E.JOB_ID = J.JOB_ID
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY;

-- 'ST_CLERK'로 근무하다가 다른 직종으로 변경한 직원의 아이디, 이름, 이전 부서명, 현재 직종아이디, 현재 근무부서명을 조회하기
SELECT E.EMPLOYEE_ID, 
       E.FIRST_NAME,
       D1.DEPARTMENT_NAME 이전부서명,
       E.JOB_ID,
       D2.DEPARTMENT_NAME 현재부서명
FROM EMPLOYEES E,       -- 직원정보(현재직종, 현재소속부서아이디)
     JOB_HISTORY H,     -- 직종변경이력정보(예전직종, 이전소속부서아이디)
     DEPARTMENTS D1,    -- 예전소속부서정보
     DEPARTMENTS D2     -- 현재소속부서정보
WHERE H.JOB_ID = 'ST_CLERK'
AND H.EMPLOYEE_ID = E.EMPLOYEE_ID
AND H.DEPARTMENT_ID = D1.DEPARTMENT_ID
AND E.DEPARTMENT_ID = D2.DEPARTMENT_ID;

-- 'IT' 부서에서 근무하는 직원의 아이디, 이름을 조회하기
SELECT E.EMPLOYEE_ID, E.FIRST_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE D.DEPARTMENT_NAME = 'IT'
AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 직원들이 근무 중인 도시명을 중복없이 조회하기
SELECT DISTINCT CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID;

-- 급여로 급여등급을 산정했을 때 'A' 등급에 해당되는 직원들의 아이디, 이름, 급여, 직종아이디를 조회하기
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, E.JOB_ID
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY
AND G.GRADE = 'A';

-- 200번 직원이 관리하는 부서에서 근무하는 직원의 아이디, 이름, 직종을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE D.MANAGER_ID = 200
AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 모든 직원의 아이디, 이름, 급여, 커미션이 고려한 급여, 급여등급, 직종아이디, 직종제목, 소속부서아이디, 소속부서명, 근무지 도시명을 조회하기 
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME,
       E.SALARY + E.SALARY*NVL(COMMISSION_PCT, 0) TOTAL_SALARY,
       G.GRADE,
       E.JOB_ID,
       J.JOB_TITLE,
       E.DEPARTMENT_ID,
       D.DEPARTMENT_NAME,
       L.CITY
FROM EMPLOYEES E, SALARY_GRADES G, DEPARTMENTS D, LOCATIONS L, JOBS J
WHERE E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY
AND E.JOB_ID = J.JOB_ID     -- JOB_ID는 NULL값이 없기 때문에 (+)를 붙여주지 않아도 된다.
AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID(+);