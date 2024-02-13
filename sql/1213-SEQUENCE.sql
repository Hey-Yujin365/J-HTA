/*
������
    �Ϸù�ȣ�� �����ϴ� ����Ŭ��ü��.
    
    �����ϱ�
        CREATE SEQUENCE ��������;
    �����ϱ�
        DROP SEQUENCE ��������;
    �����ϱ�
        ALTER SEQUENCE ��������
        
    ������ ���� ����
        CREATE SEQUENCE ��������
        * ���۰�:1, ����ġ:1, �ּڰ�:1, �ִ�:9999999999999999999999999999
        * ĳ�û�����:20
        
        CREATE SEQUENCE ��������
            START WITH    1000
            INCREAMENT BY 100
            NOCACHE;
        * ���۰�:1000, ����ġ:100, �ּڰ�:1, �ִ�:9999999999999999999999999999
        * ĳ�� ������� ����
*/

-- ���ο� ������ �����ϱ�
CREATE SEQUENCE BOOKS_SEQ;

-- �� �Ϸù�ȣ ��ȸ�ϱ�
SELECT BOOKS_SEQ.NEXTVAL
FROM DUAL;

-- INSERT�������� ������ Ȱ���ϱ�
INSERT INTO SAMPLE_BOOKS
(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE)
VALUES
(BOOKS_SEQ.NEXTVAL, '������ Ȱ���ϱ�', 'ȫ�浿', 10000);

INSERT INTO SAMPLE_BOOKS
(BOOK_NO, BOOK_TITLE, BOOK_WRITER, BOOK_PRICE, BOOK_IMAGE_NAME)
VALUES
(BOOKS_SEQ.NEXTVAL, '�̰����ڹٴ�', '�ſ��', 10000, BOOKS_SEQ.CURRVAL || '.png')