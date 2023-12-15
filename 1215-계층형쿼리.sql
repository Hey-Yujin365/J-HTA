/*
������ ����
    ���̺� ������ �����Ͱ� �����ϴ� ��� �� �����͸� ��ȸ�ϱ� ���ؼ� ����ϴ� ������.
    * ������ �����Ͷ� ������ ���̺� ���������� ������ ���� ������ ���Ե� �����ʹ�.
    * ����) �������̺� ����� ������
           ���������̺��� ���������� ��������
           �޴����̺��� �����޴� �����޴�
           ī�װ����̺��� ����ī�װ��� ����ī�װ�
           
    ����
        SELECT �÷���, �÷���, ...
        FROM ���̺��
        [WHERE ���ǽ�]
        START WITH 
        CONNECT BY PRIOR ���ǽ�;
        
        * START WITH : ���� �˻��� ���������� �����Ѵ�.
        * CONNECT BY : �θ���� �ڽ��� ���� ���谡 �ִ� �÷��� �����Ѵ�.
            CONNECT BY PRIOR �θ�Ű(�⺻Ű) = �ڽ�Ű(�ܷ�Ű)
                ������������ �θ� -> �ڽ� �������� �������� ������ �˻�
            CONNECT BY PRIOR �ڽ�Ű(�ܷ�Ű) = �θ�Ű(�⺻Ű)
                ������������ �ڽ� -> �θ� �������� �ö󰡴� ������ �˻�
*/

-- ������ �˻�
-- 101�� ������ ���� ������ �˻��ϱ�
SELECT LEVEL,
       LPAD(' ', 4*(LEVEL-1), ' ') || EMPLOYEE_ID,
       FIRST_NAME,
       MANAGER_ID
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 101    -- 101�� ������ ���������̴�.
CONNECT BY PRIOR EMPLOYEE_ID = MANAGER_ID;

-- ������ �˻�
SELECT LEVEL,
       LPAD(' ', 4*(LEVEL-1), ' ') || EMPLOYEE_ID,
       FIRST_NAME,
       MANAGER_ID
FROM EMPLOYEES
START WITH EMPLOYEE_ID = 206    -- 206�� ������ ���������̴�.
CONNECT BY PRIOR MANAGER_ID = EMPLOYEE_ID;

select to_char(hire_date, 'mm'), count(*)
  from employees 
  where to_char(hire_date, 'yyyy') = '2004'
  group by to_char(hire_date, 'mm')
  order by 1;
  
select lpad(level, 2, '0') month
from dual 
connect by level <= 12;

-- ���� �ΰ��� ������
SELECT B.MONTH, A.CNT
from(select to_char(hire_date, 'mm') M, count(*) CNT
    from employees 
    where to_char(hire_date, 'yyyy') = '2004'
    group by to_char(hire_date, 'mm')
    order by 1) A, (
    select lpad(level, 2, '0') month
    from dual 
    connect by level <= 12) B
WHERE B.MONTH = A.M(+)
ORDER BY 1;