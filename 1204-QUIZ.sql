-- �μ����̺��� ��� �μ� ������ ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM departments;

-- �μ����̺��� ���������̵� 1700���� �μ� ���� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM departments
WHERE location_id = 1700;

-- 100 ������ �����ϴ� �μ����� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM DEPARTMENTS
WHERE manager_id = 100;

-- �μ����� 'IT'�� �μ��� ���� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID
FROM departments
WHERE department_name = 'IT';

-- ���������̵� 1700���� ������ �ּ�, �����ȣ, ���ø�, �����ڵ带 ��ȸ�ϱ�
SELECT street_address, postal_code, CITY, country_id
FROM LOCATIONS
WHERE LOCATION_ID = 1700;

-- �ּұ޿��� 2000�̻� 5000������ ������ �������̵�, ��������, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, JOB_TITLE, MIN_SALARY, max_salary
FROM JOBS
WHERE min_salary >= 2000 AND min_salary <= 5000;

-- �ִ�޿��� 20000���� �ʰ��ϴ� ������ ���̵�, ��������, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, JOB_TITLE, min_salary, max_salary
FROM JOBS
WHERE max_salary > 20000;

-- 100�������� �����ϴ� ������ ���̵�, �̸�, �μ����̵��� ��ȸ�ϱ�
SELECT employee_id, first_name, department_id
FROM EMPLOYEES
WHERE MANAGER_ID = 100;

-- 80�� �μ����� �ٹ��ϰ� �޿��� 8000�� �̻� �޴� ������ ���̵�, �̸�, �޿�, Ŀ�̼�����Ʈ ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, commission_pct
FROM EMPLOYEES
WHERE department_id = 80 AND SALARY >= 8000;

-- �������̵� SA_REP�̰�, Ŀ�̼�����Ʈ�� 0.25�̻��� ������ ���̵�, �̸�, �޿�, Ŀ�̼�����Ʈ�� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, commission_pct
FROM employees
WHERE job_id = 'SA_REP' AND commission_pct >= 0.25;


-- 80�� �μ��� �ٹ��ϰ�, �޿��� 10000�� �̻��� ������ ���̵�, �̸�, �޿�, ������ ��ȸ�ϱ�
-- ���� = (�޿� + �޿�xĿ�̼�)x12��
SELECT employee_id, first_name, salary, (SALARY + SALARY*COMMISSION_PCT)*12 AS ANNUAL_SALARY
FROM EMPLOYEES
WHERE department_id = 80 AND SALARY >= 10000;

-- 80�� �μ��� �ٹ��ϰ�, 147�� �������� �����ϴ� ��� �߿��� Ŀ�̼��� 0.1�� ������ ���̵�, �̸�, ����, �޿�, Ŀ�̼�����Ʈ�� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, salary, commission_pct
FROM EMPLOYEES
WHERE department_id = 80 AND manager_id = 147 AND commission_pct = 0.1;