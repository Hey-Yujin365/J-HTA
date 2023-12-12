/*
������ �Լ�
    ��ȸ�� ����� ���ձ׷쿡 ����Ǿ� �׷�� �ϳ��� ����� �����ϴ� �Լ���.
    
    * ���ձ׷� : ���̺� ��ü
                �׷�ȭ�� ���̺��� ��(GROUP BY�� ����ϸ� ���̺��� ���� �׷�ȭ�� �� �ִ�.)
                
    COUNT(*)
        ��ȸ�� ��� ���� ������ ��ȯ�Ѵ�.
    COUNT(�÷���)
        ��ȸ�� �࿡�� ������ �÷��� ���� NULL�� �ƴ� ���� ������ ��ȯ�Ѵ�.
    SUM(�÷���)
        ��ȸ�� �࿡�� ������ �÷� ���� �հ踦 ��ȯ�Ѵ�.(NULL�� �����Ѵ�.)
    AVG(�÷���)
        ��ȸ�� �࿡�� ������ �÷� ���� ����� ��ȯ�Ѵ�.(NULL�� �����Ѵ�.)
    MIN(�÷���)
        ��ȸ�� �࿡�� ������ �÷��� �ּڰ��� ��ȯ�Ѵ�.(NULL�� �����Ѵ�.)
    MAX(�÷���)
        ��ȸ�� �࿡�� ������ �÷��� �ִ񰪸� ��ȯ�Ѵ�.(NULL�� �����Ѵ�.)
    
    ������ �Լ� �ۼ��� ���ǻ���
        - ������ �Լ��� WEHRE���� ����� �� ����.
          SELECT *
          FROM EMPLOYEES
          WHERE COUNT(*) > 10   -- ������.
        - ������ �Լ��� �Ϲ� �÷����� SELECT���� ���� ���� �� ����.
          SELECT DEPARTMENT_ID, COUNT(*)
          FROM EMPLOYEES;   -- ������.
          ��, GROUP BY ���� ����� �÷����� SELECT���� ���� �� �ִ�.
          GROUP BY DEPARTMENT_ID �� �߰����ָ� �����ϴ�.
        - ������ �Լ��� ��ø�� �ѹ��� ���ȴ�.
          �׷� �Լ��� 2�� �ϸ�, ����� �� �ุ ���´�.
          �׷��� ������ ��ø�� �ѹ��� ���ȴ�.
        
*/

-- ���ձ׷��� ���̺� ��ü��.
SELECT COUNT(*)
FROM EMPLOYEES;

-- ���ձ׷��� ��������. ���� ���̺��� �μ����̵� ���� �ͳ��� �׷�ȭ ���״�.
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- ��ø�� �� ���� ���ȴ�.
SELECT MAX(COUNT(*))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- Ŀ�̼��� �޴� ������ ���� ��ȸ�ϱ�
SELECT COUNT(*)
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;

-- 60�� �μ��� ��� �޿��� ��ȸ�ϱ�
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

-- 80�� �μ��� �Ҽӵ� ������ �޿� ���հ�, ��ձ޿�, �ּұ޿�, �ִ�޿��� ��ȸ�ϱ�
SELECT SUM(SALARY), TRUNC(AVG(SALARY)), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

-- �������� �����ϰ� �ִ� �������̵� �ߺ��� ������ ���� ������ ��ȸ�ϱ�
SELECT COUNT(DISTINCT JOB_ID)
FROM EMPLOYEES;

/*
�׷�ȭ�ϱ�
    GROUP BY ���� ����ؼ� ���̺��� ���� ������ �÷��� ���� ���� ���� ������ �ೢ�� �׷�ȭ�� �� �ִ�.
    
    SELECT �÷���1, �÷���2, �׷��Լ�(), �׷��Լ�()
    FROM ���̺��
    [WHERE ���ǽ�]
    [GROUP BY �÷���1, �÷���2, ...]
    [ORDER BY �÷���]
    * GROUP BY������ ���̺��� ���� �׷�ȭ�� �� ������ �Ǵ� �÷��� �����Ѵ�.
    * GROUP BY������ �÷��� �ϳ��̻� ������ �� �ִ�.
    * SELECT���� �÷����� GROUP BY������ ����� �÷���� ������ �÷��� �����ϴ�.
    * GROUP BY���� ����ϸ� ���̺��� ���� �׷�ȭ�ϰ�, �׷�ȭ�� �� �׷쿡 ������ �Լ��� �����ؼ� �����Ű��
      �������� ��ȯ���� �� �ִ�.
      * �μ��� �ְ�޿�, �����޿�, ��ձ޿�, �޿������� ��ȸ�� �� �ִ�.
      * ������ �ְ�޿�, �����޿�, ��ձ޿�, �޿�����, ���� ���� ���� ��ȸ�� �� �ִ�.
      * �Ի�⵵�� �ְ�޿�, �����޿�, ��ձ޿�, �޿�����, ���� ������ ��ȸ�� �� �ִ�.
      * �޿���޺� �ְ�޿�, �����޿�, ��ձ޿�, �޿�����, ���� ������ ��ȸ�� �� �ִ�.
*/

-- ������ ������� ��ȸ�ϱ�
SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- �μ��� ������� ��ȸ�ϱ�
SELECT D.DEPARTMENT_NAME, COUNT(*)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;

-- �ٹ����� ������� ��ȸ�ϱ�
SELECT L.CITY, COUNT(*)
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID
GROUP BY L.CITY;

-- �Ի�⵵�� ������� ��ȸ�ϱ�
SELECT TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY 1;

-- �μ���, �Ի�⵵�� ������� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY 1 ASC, 2 ASC;

/*
�׷��Լ� �������� ���͸��ϱ�
    HAVING���� �̿��ϸ� �׷��Լ� �������� ���͸��� �� �ִ�.

    SELECT �÷���, �׷��Լ�()
    FROM ���̺��
    [WHERE ���ǽ�]
    [GROUP BY �÷���]
    [HAVING ���ǽ�]
    [ORDER BY �÷���]
    * HAVING���� GROUP BY���� �Բ� ���ȴ�.
    * WHERE���� ���ǽĿ��� �׷��Լ��� ����� �� ������, HAVING���� ���ǽĿ��� �׷��Լ��� ����� �� �ִ�.
*/
-- �μ��� �������� ��ȸ���� �� �������� 10�� �̻��� �μ��� ���̵�� �������� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 20;

-- 2005�� ������ �Ի��� �������� �μ����� �������� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE < '2005/01/01'
GROUP BY DEPARTMENT_ID;

-- 2005�� ������ �Ի��� �������� �μ����� �������� ��ȸ���� �� �������� 5�� �̻��� �μ����̵�� �������� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
WHERE HIRE_DATE < '2005/01/01'
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 5;

