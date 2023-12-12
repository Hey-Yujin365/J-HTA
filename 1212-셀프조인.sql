/*
자체 조인

조인대상이 되는 테이블이 같은 테이블일 때 발생하는 조인이다.
같은 테이블끼리 조인하기 때문에, 서로 역할을 나누어서 별칭을 정하고, 그 역할에 맞게 조인조건을 정의해야 한다.
같은 테이블끼리 조인하기 때문에 조회하는 컬럼명이 동일한 경우에 적절한 별칭이 붙이는 것이 좋다.
*/

-- 직원테이블에서 직원아이디, 직원이름, 해당 직원의 상사아이디, 상사이름을 조회하기
--              E(직원)     E(직원)  E(직원)-MANAGER_ID
--                                  E(상사)-EMPLOYEE_ID   E(상사)
SELECT EMP.EMPLOYEE_ID AS EMP_ID,
       EMP.FIRST_NAME AS EMP_NAME,
       MGR.EMPLOYEE_ID AS MGR_ID,
       MGR.FIRST_NAME AS MGR_NAME
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.MANAGER_ID = MGR.EMPLOYEE_ID;


-- 직원아이디, 직원이름, 직원의 소속부서명, 상사의 아이디, 상사의 이름, 상사의 소속부서명
--  E          E                        E 
--                      EMP_D
--                                      M           M           
--                                                              MGR_D
SELECT EMP.EMPLOYEE_ID          EMP_ID,
       EMP.FIRST_NAME           EMP_NAME,
       EMP_D.DEPARTMENT_NAME    EMP_DPT_NAME,
       MGR.EMPLOYEE_ID          MGR_ID,
       MGR.FIRST_NAME           MGR_NAME,
       MGR_D.DEPARTMENT_NAME    MGR_DPT_NAME
FROM EMPLOYEES EMP,             -- 직원
     DEPARTMENTS EMP_D,         -- 직원 소속부서
     EMPLOYEES MGR,             -- 관리자
     DEPARTMENTS MGR_D          -- 관리자 소속부서
WHERE EMP.DEPARTMENT_ID = EMP_D.DEPARTMENT_ID(+)   -- 직원과 직원의 소속부서 조인
AND EMP.MANAGER_ID = MGR.EMPLOYEE_ID(+)            -- 직원과 매니저 조인
AND MGR.DEPARTMENT_ID = MGR_D.DEPARTMENT_ID(+);    -- 매니저와 매니저의 소속부서 조인
