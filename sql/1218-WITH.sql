/*
WITH ��
    WITH���� ����ϸ� ���������� �̸��� �����Ͽ� ������ �� �ִ� �ӽ����̺��� ������ �� �ִ�.
    
    WITH �ӽ����̺��� AS
    (��������),
    �ӽ����̺��� AS
    (��������)
    �������� 
    * ������������ �ӽ����̺������� ���������� �������� �̿��� �� �ִ�.
    * ���� �� ���� ����� �� �ִ�.
    
    SELECT *
    FROM (��������);
    
WITH���� INLINE VIEW
    WITH������ ���ǵ� ���������� �������� ���������� �ӽ����̺��� �����ؼ� �����Ѵ�.
    ���� ������������ ���� �� ����Ǵ� ��� �����ϴ�.
    
    INLINE VIEW�� ���������� �ӽ����̺��� �����ؼ� �������� �ʰ�, ���� �������� �ٷ� ����ϴ� ����̴�.
    ������������ ����� ������ ���������� �ٽ� ����Ǳ� ������ �ѹ��� ���Ǵ� ��� �����ϴ�.
*/

-- �μ��� ��ձ޿��� ������� �� ��ձ޿����� ���� ū �μ��� ���̵�� ��ձ޿��� ��ȸ�ϱ�
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) = (SELECT MAX(AVG(SALARY))
                      FROM EMPLOYEES
                      GROUP BY DEPARTMENT_ID);
                      
WITH DEPT_AVG_SALARY AS
(SELECT DEPARTMENT_ID, AVG(SALARY) AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID)
SELECT *
FROM DEPT_AVG_SALARY
WHERE AVG_SALARY = (SELECT MAX(AVG_SALARY)
                    FROM DEPT_AVG_SALARY);
                    
-- ���������� ������ �������� �������� ���� �� ����ϴ� ���
-- �ش� ���������� �������� WITH���� �̿��ؼ� �ӽ����̺��� �����ϰ� ����ϸ�
-- ���������� �� �� ���� �����ؼ� �� ����� �ӽ����̺��� �����ϰ�, ���� �������� �ݺ������� ����� �� �ִ�.