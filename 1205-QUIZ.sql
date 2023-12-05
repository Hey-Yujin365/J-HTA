-- �������� �����ϴ� ���� ���̵� �ߺ����� ���� ��ȸ�ϱ�
SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

-- �ٸ� �����鿡�� ���� �޴� �Ŵ������� ���̵� �ߺ����� ���� ��ȸ�ϱ�
SELECT DISTINCT manager_id
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;

-- ������ ������ ������ ���̵�, �̸�, ������ ��ȸ�ϱ�
SELECT employee_id, first_name, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- Ŀ�̼��� �޴� ������ �߿��� �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �޿�, Ŀ�̼��� ��ȸ�ϱ�
SELECT employee_id, first_name, salary, commission_pct
FROM EMPLOYEES
WHERE commission_pct IS NOT NULL
AND salary >= 10000;

-- 2004�⵵�� ������ ����� ������ ���̵�, �ش� ������ ���� ������, ������, �������̵� ��ȸ�ϱ�
SELECT employee_id, start_date, end_date, job_id
FROM JOB_HISTORY
WHERE start_date BETWEEN '2004/01/01' AND '2004/12/31';

SELECT employee_id, start_date, end_date, job_id
FROM JOB_HISTORY
WHERE start_date >= '2004/01/01' AND start_date < '2005/01/01';

-- �ѹ��̶� ������ ����� ���� �ִ� �������� ���� ���̵� �ߺ����� ��ȸ�ϱ�
SELECT DISTINCT employee_id
FROM JOB_HISTORY;

-- ���� �߿��� 100�� ��翡�� �����ϰ�, Ŀ�̼��� ������, �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, salary
FROM  EMPLOYEES
WHERE MANAGER_ID = 100
AND commission_pct IS NOT NULL
AND SALARY >= 10000;

-- ���� �߿��� 2006�� ��ݱ⿡ �Ի��� ������ ���̵�, �̸�, �Ի����� ��ȸ�ϰ�, �Ի��� ������ �������� �����ϱ�
SELECT employee_id, first_name, hire_date
FROM EMPLOYEES
WHERE hire_date BETWEEN '2006/01/01' AND '2006/06/30'
ORDER BY hire_date ASC;

SELECT employee_id, first_name, hire_date
FROM EMPLOYEES
WHERE hire_date >= '2006/01/01' AND hire_date < '2006/07/01'
ORDER BY hire_date ASC;

-- ���� �߿��� �ҼӺμ��� 50, 60, 80�� �μ� ���� �ϳ��� ���ϰ�, 100�� �������� �����ϴ� ������ ���̵�, �̸�, �������̵�, �μ����̵� ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, department_id
FROM EMPLOYEES
WHERE department_id IN(50, 60, 80)
AND manager_id = 100;

-- ���� �߿��� �������̵�  'CLERK'�� ������, �޿��� 2000�� �̻� �޴� ������ ���̵�, �̸�, �޿�, �������̵� ��ȸ�ϱ�
SELECT employee_id, first_name, salary, job_id
FROM EMPLOYEES
WHERE job_id LIKE '%CLERK'
AND salary >= 2000;

-- �μ� ������ �������� �Ϻ��� ��ġ�ϰ� �ִ� �������� ���̵�, �ּ�, �����ȣ, ���ø��� ��ȸ�ϱ�
SELECT location_id, street_address, postal_code, city 
FROM LOCATIONS
WHERE country_id = 'JP';

-- �μ� ������ �������� �����ȣ�� ������ �������� ���̵�, �ּ�, ���ø��� ��ȸ�ϱ�
SELECT location_id, street_address, city
FROM LOCATIONS
WHERE postal_code IS NULL;

-- ���� �߿��� �̸��� 'S'�� �����ϴ� ������ ���̵�, �̸��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME
FROM employees
WHERE first_name LIKE 'S%';

-- 50�� �μ��� �Ҽӵ� �������� �������̵�, �̸�, �޿��� ��ȸ�ϰ� �޿������� �������� �����ϱ�
SELECT employee_id, first_name, salary
FROM EMPLOYEES
WHERE department_id = 50
ORDER BY SALARY ASC;