/*
내포된 SQL문의 구분
    서브쿼리 : WEHRE절이나 HAVING절에서 조건식에 사용되는 값을 제공하는 SQL문
    인라인뷰 : FROM절에서 가상의 테이블(가상의 테이블을 보통 뷰라고 한다.)을 제공하는 SQL문
    스칼라 서브쿼리 : SELECT절에서 사용되는 서브쿼리다. 보통 값은 하나만 반환한다.
    상호연관 서브쿼리 : 내포된 SLQ문에서 메인쿼리의 컬럼을 참조하는 서브쿼리다.
    
서브쿼리(SUB QUERY)
    SELECT문 내부에 정의된 SELECT문을 서브쿼리라고 한다.
    서브쿼리는 WHERE절의 조건식에서 사용되는 값을 제공한다.
    * 이 경우에 조건식에서 사용되는 값이 SQL을 실행해야만 획득가능한 값인 경우가 많다.
    
    형식
        SELECT 컬럼, 컬럼
        FROM 테이블명
        WHERE 컬럼명 연산자 (SELECT 컬럼
                           FROM 테이블명
                           [WEHRE 조건식])                           
    특징
        한번만 실행된다.
        메인 쿼리보다 먼저 실행된다.
        서브 쿼리의 실행결과가 메인 쿼리의 조건식에서 사용된다.
    주의사항
        서브쿼리는 반드시 괄호안에 작성한다.
        서브쿼리는 조건식에 오른쪽에 위치시켜서 가독성을 높힌다.
        서브쿼리의 실행결과가 단일행인지 다중행인지 조사해서 적절한 연산자를 사용한다.
*/

-- 전체 직원의 평균급여보다 급여를 많이 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > 평균급여;    -- 평균급여를 제공하는 서브쿼리가 필요하다.

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEES);
                
-- B등급의 최고급여보다 급여를 적게받는 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > B등급의최고급여;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT MAX_SALARY
                FROM SALARY_GRADES
                WHERE GRADE = 'B');     -- 실행결과가 하나 획득되는 단일행 서브쿼리
                
-- 60번부서의 직원과 같은 해에 입사한 직원들의 아이디, 이름, 입사일 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') IN (SELECT DISTINCT TO_CHAR(HIRE_DATE, 'YYYY')
                                    FROM EMPLOYEES
                                    WHERE DEPARTMENT_ID = 60);
                                    
/*
서브쿼리의 구분
    - 단일행 서브쿼리
        서브쿼리 실행결과로 한 행이 획득된다.(1행1열 데이터를 반환하는 서브쿼리)
        연산자
            =, !=, >, >=, <, <=, IN, NOT IN
            
    - 다중행 서브쿼리
        서브쿼리 실행결과로 여러 행이 획득된다.(N행 1열 데이터를 반환하는 서브쿼리)
        연산자
            IN, NOT IN, > ANY, > ALL, >= ANY, >= ALL
                        < ANY, < ALL, <= ANY, <= ALL
    
    - 다중열 서브쿼리
        서브쿼리 실행결과로 여러 개의 컬럼값이 획득된다.(N행N열 데이터를 반환하는 서브쿼리)
        연산자
            IN, NOT IN
*/

-- 단일행 서브쿼리
-- 101번 사원에게 보고 받는 상사와 같은 상사에게 보고하는 직원의 아이디, 이름을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE MANAGER_ID = (SELECT MANAGER_ID
                    FROM EMPLOYEES
                    WHERE EMPLOYEE_ID = 101);

-- 101번 사원보다 급여를 많이 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY
                FROM EMPLOYEES
                WHERE EMPLOYEE_ID = 101);
               
-- 다중행 서브쿼리                
-- 'Steven'과 같은 해에 입사한 직원의 아이디, 이름, 입사일을 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') IN (SELECT TO_CHAR(HIRE_DATE, 'YYYY')
                                     FROM EMPLOYEES
                                     WHERE FIRST_NAME = 'Steven');
                                    
-- 60번 부서에 소속된 직원들의 급여보다 급여를 많이 받는 직원들의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ANY (SELECT SALARY
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 60);
                
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT MIN(SALARY)
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 60);
                
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ALL (SELECT SALARY
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 60);
                
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT MAX(SALARY)
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 60);
                
-- 다중열 서브쿼리
-- 각 부서별 최저 급여를 받는 직원의 아이디, 이름, 급여를 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MIN(SALARY)
                                  FROM EMPLOYEES
                                  WHERE DEPARTMENT_ID IS NOT NULL
                                  GROUP BY DEPARTMENT_ID);

/*
상호연관 서브쿼리
    서브쿼리에서 메인쿼리의 컬럼을 참조하면 상호연관 서브쿼리가 된다.  
    형식
        SELECT OUTER.COLUMN, OUTER.COLUMN
        FROM TABLE OUTER
        WHERE OUTER COLUMN 연산자 (SELECT INNER.COLUMN
                                  FROM TABLE INNER
                                  WHERE INNER.COLUMN = OUTER.COLUMN)
    일반서브쿼리와 상호연관서브쿼리의 다른 점
        서브쿼리는 메인쿼리보다 먼저 실행된다.
        서브쿼리는 딱 한번 실행된다.
        
        상호연관 서브쿼리는 메인쿼리문에서 처리되는 각 행에 대해서 한번씩 실행된다.
*/
-- 직원들 중에서 자신이 소속된 부서의 평균급여보다 급여를 많이 받는 사원의 아이디, 이름, 급여를 조회하기
SELECT O.EMPLOYEE_ID, O.FIRST_NAME, O.SALARY
FROM EMPLOYEES O
WHERE O.SALARY > (SELECT AVG(I.SALARY)
                  FROM EMPLOYEES I
                  WHERE I.DEPARTMENT_ID = O.DEPARTMENT_ID);

-- 부서아이디, 부서이름, 해당 부서에 소속된 직원수를 조회하기
SELECT O.DEPARTMENT_ID, O.DEPARTMENT_NAME,
       (SELECT COUNT(*)
        FROM EMPLOYEES I
        WHERE I.DEPARTMENT_ID = O.DEPARTMENT_ID) CNT
FROM DEPARTMENTS O;

-- 직원아이디, 직원이름, 상사의 아이디, 상사의 이름을 조회하기
-- 상호연관 서브쿼리를 사용할 수 있지만, 107번 실행되는 것이라 비효율적이다.
SELECT X.EMPLOYEE_ID                        EMP_ID,
       X.FIRST_NAME                         EMP_NAME,
       X.MANAGER_ID                         MGR_ID,
       (SELECT Y.FIRST_NAME
        FROM EMPLOYEES Y
        WHERE Y.EMPLOYEE_ID = X.MANAGER_ID) MGR_NAME
FROM EMPLOYEES X;
