/*
    ���̺��� ������ ��ȸ
    
    1. ������ ���̺��� ��� ��, ��� ���� ��ȸ�Ѵ�.
    SELECT *
    FROME ���̺��;
    
    2. ������ ���̺��� ��� ��, ������ ���� ��ȸ�ϱ�
    SELECT �÷���, �÷���, �÷���, ... �÷���
    FROM ���̺��;
    
    3. SELECT������ ��Ģ������ ������ �� �ִ�.
    SELECT �÷���*����, �÷���*�÷���, ...
    FROM ���̺��;
    * ��Ģ���꿡 ���Ǵ� �÷��� �ش� �÷��� ���� ���ڰ��̾�� �Ѵ�.
    
    4. �÷��� ��Ī(Alias) �ο��ϱ�
    SELECT �÷��� AS ��Ī, �÷��� AS ��Ī, ...
    FROM ���̺��;
    
    SELECT �÷��� ��Ī, �÷��� ��Ī, �÷��� ��Ī, ...
    FROM ���̺��;
*/

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM REGIONS;

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM COUNTRIES;

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM JOBS;

-- �μ� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM departments;

-- ���� ���̺��� ��� ��, ��� �� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEES;

-- ���� ���̺��� ���� ���̵�, �ּұ޿�, �ִ�޿� ��ȸ�ϱ�
SELECT JOB_ID, MIN_SALARY, MAX_SALARY
FROM jobs;

-- ���� ���̺��� �������̵�, �����̸�(FIRST_NAME), �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES;

-- ������ ���̺��� ������ ���̵�, �ּ�, ���ø��� ��ȸ�ϱ�
SELECT location_id, street_address, CITY
FROM LOCATIONS;

-- ���� ���̺��� �������̵�, �����̸�, �޿�, ������ ��ȸ�ϱ�
-- ������ �޿�*12�� ����Ѵ�.
SELECT employee_id, first_name, salary, salary*12
from employees;

-- ���� ���̺��� �������̵�, �����̸�, �޿�, ������ ��ȸ�ϱ�
-- ������ �޿�*12�� ����Ѵ�.
-- ������ ��Ī�� ANNUAL_SALARY��.
SELECT employee_id, first_name, salary, SALARY*12 AS ANNUAL_SALARY
FROM EMPLOYEES;

-- ���� ���̺��� �������̵�, �ְ�޿�, �����޿�, �ְ�޿��� �����޿��� ���� ��ȸ�ϱ�
SELECT job_id, max_salary, min_salary, max_salary-min_salary AS SALARY_GRP
FROM JOBS;


/*
    ������ ���͸��ϱ�
    
    1. WHERE���� ���ǽ��� �ۼ��ؼ� �ش� ���ǽ��� ������Ű�� �ุ ��ȸ�ϱ�
    SELECT �÷���, �÷���, �÷���, ...
    FROM ���̺��
    WHERE ���ǽ�;
    
    2. WHERE������ 2�� �̻��� ���ǽ����� �����͸� ���͸��� �� �ִ�.
        2�� �̻��� ���ǽ��� �ۼ��� ���� AND, OR, NOT �� �����ڸ� ����Ѵ�.
    SELECT �÷���, �÷���, �÷���, ...
    FROM ���̺��
    WHERE ���ǽ�1 AND ���ǽ�2;
    * ���ǽ�1�� ���ǽ�2�� ��� TRUE�� �����Ǵ� �ุ ��ȸ�ȴ�.
    
    SELECT �÷���, �÷���, �÷���, ...
    FROM ���̺��
    WHERE ���ǽ�1 OR ���ǽ�2;
    * ���ǽ�1�� ���ǽ�2 �߿��� �ϳ��� TRUE�� �����Ǵ� �ุ ��ȸ�ȴ�.
    
    SELECT �÷���, �÷���, �÷���, ...
    FROM ���̺��
    WHERE ���ǽ�1 AND (���ǽ�2 OR ���ǽ�3);
    * AND �����ڿ� OR �����ڸ� ���� ����� ���� OR ������� ��ȣ�� ���´�.
*/

-- ���� ���̺��� �ҼӺμ� ���̵� 60���� ������ ���̵�, �̸�, �������̵� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE department_id = 60;

-- ���� ���̺��� �޿��� 10000�޷� �̻� �޴� ������ ���̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000;

-- ���� ���̺��� �������̵� "Sa_MAN"�� ������ ���̵�, �̸�, �޿�, �ҼӺμ� ���̵� ��ȸ�ϱ�
SELECT employee_id, first_name, salary, department_id
from employees
where job_id = 'SA_MAN';

-- ���� ���̺��� �޿��� 5000 ~ 10000 ������ ���ϴ� �������̵�, �̸�, �������̵�, �޿��� ��ȸ�ϱ�
-- �޿��� 5000 �̻�, 10000���Ϸ� �޴� ������ ��ȸ�ϱ�
SELECT employee_id, first_name, job_id, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000 AND SALARY <= 10000;

-- ���� ���̺��� 10�� �μ�, 20�� �μ�, 30�� �μ����� �ٹ��ϴ� ���� ���̵�, �̸�, �μ����̵� ��ȸ�ϱ�
SELECT employee_id, first_name, department_id
FROM EMPLOYEES
WHERE department_id = 10 OR department_id = 20 OR department_id = 30;
