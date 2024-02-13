/*
��ü ����

���δ���� �Ǵ� ���̺��� ���� ���̺��� �� �߻��ϴ� �����̴�.
���� ���̺��� �����ϱ� ������, ���� ������ ����� ��Ī�� ���ϰ�, �� ���ҿ� �°� ���������� �����ؾ� �Ѵ�.
���� ���̺��� �����ϱ� ������ ��ȸ�ϴ� �÷����� ������ ��쿡 ������ ��Ī�� ���̴� ���� ����.
*/

-- �������̺��� �������̵�, �����̸�, �ش� ������ �����̵�, ����̸��� ��ȸ�ϱ�
--              E(����)     E(����)  E(����)-MANAGER_ID
--                                  E(���)-EMPLOYEE_ID   E(���)
SELECT EMP.EMPLOYEE_ID AS EMP_ID,
       EMP.FIRST_NAME AS EMP_NAME,
       MGR.EMPLOYEE_ID AS MGR_ID,
       MGR.FIRST_NAME AS MGR_NAME
FROM EMPLOYEES EMP, EMPLOYEES MGR
WHERE EMP.MANAGER_ID = MGR.EMPLOYEE_ID;


-- �������̵�, �����̸�, ������ �ҼӺμ���, ����� ���̵�, ����� �̸�, ����� �ҼӺμ���
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
FROM EMPLOYEES EMP,             -- ����
     DEPARTMENTS EMP_D,         -- ���� �ҼӺμ�
     EMPLOYEES MGR,             -- ������
     DEPARTMENTS MGR_D          -- ������ �ҼӺμ�
WHERE EMP.DEPARTMENT_ID = EMP_D.DEPARTMENT_ID(+)   -- ������ ������ �ҼӺμ� ����
AND EMP.MANAGER_ID = MGR.EMPLOYEE_ID(+)            -- ������ �Ŵ��� ����
AND MGR.DEPARTMENT_ID = MGR_D.DEPARTMENT_ID(+);    -- �Ŵ����� �Ŵ����� �ҼӺμ� ����
