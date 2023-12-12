/*
������ SQL���� ����
    �������� : WEHRE���̳� HAVING������ ���ǽĿ� ���Ǵ� ���� �����ϴ� SQL��
    �ζ��κ� : FROM������ ������ ���̺�(������ ���̺��� ���� ���� �Ѵ�.)�� �����ϴ� SQL��
    ��Į�� �������� : SELECT������ ���Ǵ� ����������. ���� ���� �ϳ��� ��ȯ�Ѵ�.
    ��ȣ���� �������� : ������ SLQ������ ���������� �÷��� �����ϴ� ����������.
    
��������(SUB QUERY)
    SELECT�� ���ο� ���ǵ� SELECT���� ����������� �Ѵ�.
    ���������� WHERE���� ���ǽĿ��� ���Ǵ� ���� �����Ѵ�.
    * �� ��쿡 ���ǽĿ��� ���Ǵ� ���� SQL�� �����ؾ߸� ȹ�氡���� ���� ��찡 ����.
    
    ����
        SELECT �÷�, �÷�
        FROM ���̺��
        WHERE �÷��� ������ (SELECT �÷�
                           FROM ���̺��
                           [WEHRE ���ǽ�])                           
    Ư¡
        �ѹ��� ����ȴ�.
        ���� �������� ���� ����ȴ�.
        ���� ������ �������� ���� ������ ���ǽĿ��� ���ȴ�.
    ���ǻ���
        ���������� �ݵ�� ��ȣ�ȿ� �ۼ��Ѵ�.
        ���������� ���ǽĿ� �����ʿ� ��ġ���Ѽ� �������� ������.
        ���������� �������� ���������� ���������� �����ؼ� ������ �����ڸ� ����Ѵ�.
*/

-- ��ü ������ ��ձ޿����� �޿��� ���� �޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ��ձ޿�;    -- ��ձ޿��� �����ϴ� ���������� �ʿ��ϴ�.

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEES);
                
-- B����� �ְ�޿����� �޿��� ���Թ޴� ������ ���̵�, �̸�, �޿��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > B������ְ�޿�;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (SELECT MAX_SALARY
                FROM SALARY_GRADES
                WHERE GRADE = 'B');     -- �������� �ϳ� ȹ��Ǵ� ������ ��������
                
-- 60���μ��� ������ ���� �ؿ� �Ի��� �������� ���̵�, �̸�, �Ի��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') IN (SELECT DISTINCT TO_CHAR(HIRE_DATE, 'YYYY')
                                    FROM EMPLOYEES
                                    WHERE DEPARTMENT_ID = 60);