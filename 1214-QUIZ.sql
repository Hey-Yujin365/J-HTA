-- ��� ������ ���̵�, �̸�, �μ���ȣ, �μ����� ��ȸ�ϱ�(�����)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+);

-- Ŀ�̼��� �޴� ������ ���̵�, �̸�, �������̵�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- Ŀ�̼��� �޴� ������ ���̵�, �̸�, �޿�, Ŀ�̼�, �޿������ ��ȸ�ϱ�(������)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY, E.COMMISSION_PCT, G.GRADE
FROM EMPLOYEES E, SALARY_GRADES G
WHERE COMMISSION_PCT IS NOT NULL
AND E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY;

-- 80�� �μ��� �Ҽӵ� �������� ��ձ޿�, �����޿�, �ְ�޿��� ��ȸ�ϱ�(�׷��Լ�)
SELECT TRUNC(AVG(SALARY)), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- 80�� �μ��� �Ҽӵ� �������� �������̵�, �̸�, ��������, �޿�, �ְ�޿��� �޿����� ���̸� ��ȸ�ϱ�(�����)
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME,
       J.JOB_TITLE,
       E.SALARY,
       J.MAX_SALARY - E.SALARY GAP
FROM EMPLOYEES E, JOBS J
WHERE DEPARTMENT_ID = 80
AND E.JOB_ID = J.JOB_ID(+);

-- �� �μ��� �ְ�޿�, �����޿�, �ְ�޿��� �����޿��� ���̸� ��ȸ�ϱ�(GROUP BY)
SELECT DEPARTMENT_ID,
       MAX(SALARY),
       MIN(SALARY),
       MAX(SALARY) - MIN(SALARY) GAP
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 'Executive' �μ��� ��� �������̵�, �̸�, �������̵� ��ȸ�ϱ�(�������� Ȥ�� ����)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.DEPARTMENT_NAME = 'Executive';

-- ��ü ������ ��ձ޿����� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�(��������)
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY)
                  FROM EMPLOYEES);

-- 'Ismael'�� ���� �ؿ� �Ի��߰�, ���� �μ��� �ٹ��ϰ� �ִ� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϱ�(��������)
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES O
WHERE TO_CHAR(O.HIRE_DATE, 'YYYY') IN (SELECT TO_CHAR(I.HIRE_DATE, 'YYYY')
                                     FROM EMPLOYEES I
                                     WHERE I.FIRST_NAME = 'Ismael' 
                                     AND I.DEPARTMENT_ID = O.DEPARTMENT_ID);

-- �μ��� �ְ�޿��� ��ȸ���� �� �ְ�޿��� 15000�� �Ѵ� �μ��� ���̵�� �ְ�޿��� ��ȸ�ϱ�(GROUP BY, HAVING)
SELECT E.DEPARTMENT_ID, MAX(E.SALARY)
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID
GROUP BY E.DEPARTMENT_ID
HAVING MAX(E.SALARY) > 15000;

-- 'Neena'���� �޿��� ���� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�(��������)
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY
                FROM EMPLOYEES
                WHERE FIRST_NAME = 'Neena');

-- �޿���޺��� �������� ��ȸ�ϱ�(������, GROUP BY)
SELECT G.GRADE, COUNT(*)
FROM EMPLOYEES E, SALARY_GRADES G
WHERE E.SALARY >= G.MIN_SALARY AND E.SALARY <= G.MAX_SALARY
GROUP BY G.GRADE;


-- �μ��� ��ձ޿��� ������� �� �μ��� ��ձ޿����� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿�, �μ����� ��ȸ�ϱ�(�ζ��κ�, ����)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.SALARY, D.DEPARTMENT_NAME
FROM (SELECT DEPARTMENT_ID, TRUNC(AVG(SALARY)) AVG_SALARY
      FROM EMPLOYEES
      GROUP BY DEPARTMENT_ID) V, EMPLOYEES E, DEPARTMENTS D
WHERE V.DEPARTMENT_ID = D.DEPARTMENT_ID
AND V.DEPARTMENT_ID = E.DEPARTMENT_ID
AND E.SALARY < V.AVG_SALARY;

-- 'Ismael' ������ �ٹ��ϴ� �μ��� ���̵�� �μ� �̸��� ��ȸ�ϱ�(��������)
SELECT E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.EMPLOYEE_ID IN (SELECT A.EMPLOYEE_ID
                        FROM EMPLOYEES A
                        WHERE FIRST_NAME = 'Ismael');

-- 'Neena'���� �����ϴ� ������ ���̵�� �̸��� ��ȸ�ϱ�(��������)
SELECT O.EMPLOYEE_ID, O.FIRST_NAME
FROM EMPLOYEES O
WHERE O.MANAGER_ID = (SELECT I.EMPLOYEE_ID
                      FROM EMPLOYEES I
                      WHERE I.FIRST_NAME = 'Neena');

-- �μ��� ��ձ޿��� ������� �� 'Ismael'�� �ٹ��ϴ� �μ��� ��ձ޿����� �޿��� ���� �޴� �μ��� ���̵�� ��ձ޿��� ��ȸ�ϱ�(GROUP BY, �ζ��κ�, ��������)

SELECT DEPARTMENT_ID, AVG(SALARY) AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) > (SELECT AVG(SALARY)
                     FROM EMPLOYEES 
                     WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                                            FROM EMPLOYEES
                                            WHERE FIRST_NAME = 'Ismael'));