/*
���� �Լ�

lower(�÷� Ȥ�� ǥ����) : �ҹ��ڷ� ��ȯ�� ���ڸ� ��ȯ�Ѵ�.
upper(�÷� Ȥ�� ǥ����) : �빮�ڷ� ��ȯ�� ���ڸ� ��ȯ�Ѵ�.

concat(�÷� Ȥ�� ǥ����, �÷� Ȥ�� ǥ����) : �� ���ڿ��� �����ؼ� ��ȯ�Ѵ�.

length(�÷� Ȥ�� ǥ����) : ���ڿ��� ���̸� ��ȯ�Ѵ�.

substr(�÷� Ȥ�� ǥ����, ������ġ, ����) : ���ڿ��� ������ġ���� ���̸�ŭ �߶� ��ȯ�Ѵ�.
                                       ������ġ�� 1���� �����Ѵ�.
                                       
instr(�÷� Ȥ�� ǥ����, ���ڿ�) : ������ ���ڿ��� ó������ �����ϴ� ��ġ�� ��ȯ�Ѵ�.

trim(�÷� Ȥ�� ǥ����) : ���ʿ��� �¿� ������ ���ŵ� ���ڿ��� ��ȯ�Ѵ�.

lpad(�÷� Ȥ�� ǥ����, ����, ����) : �÷� Ȥ�� ǥ������ ���̰� ������ ���̺��� ª����
                         ������ ���̸�ŭ ���ʿ� ������ ���ڰ� ä���� ���ڿ��� ��ȯ�ȴ�.
*/

-- 60�� �μ��� �Ҽӵ� �������� �̸��� �ҹ���, �빮�ڷ� ��ȸ�ϱ�
select first_name, Lower(first_name), upper(first_name)
from employees
where department_id = 60;

-- 60�� �μ��� �Ҽӵ� �������� first_name�� last_name�� �����ؼ� ��ȸ�ϱ�
select concat(first_name, last_name)
from employees
where department_id = 60;

-- 60�� �μ��� �Ҽӵ� �������� first_name�� last_name�� �����ؼ� ��ȸ�ϱ�
select first_name || ' ' ||last_name
from employees
where department_id = 60;

-- 60�� �μ��� �Ҽӵ� �������� �̸��� �̸��� ���̸� ��ȸ�ϱ�
select first_name, length(first_name)
from employees
where department_id = 60;

-- �̸��� 6���� �̻��� ��� �������� �������̵�� �̸��� ��ȸ�ϱ�
select employee_id, first_name
from employees
where length(first_name) >= 6;

-- sample_books���� �����̸��� ��ȸ�ϰ�, �����̸��� ù ��° ���ڵ� ��ȸ�ϱ�
select book_writer, substr(book_writer, 1, 1)
from sample_books;

-- ��ȭ��ȣ���� ������ ��ȸ�ϱ�
select substr('031)1234-5678', 1, instr('031)1234-5678', ')') -1)
from dual;

-- dual�� ����Ŭ���� �����ϴ� dummy ���̺��̴�.
-- dual�� 1�� 1��¥�� ���̺��̴�.
-- ���� ���̺� ��ȸ���� ������ ������ ������ �� �̿��Ѵ�.
select *
from dual;

-- ���ʿ��� �¿� ������ ���ŵ� ���ڿ��� ��ȸ�ϱ�
select trim('            hello world     ')
from dual;

-- ������ ���̸�ŭ ���ڿ��� ���ʿ� '0'�� ä���� ��ȸ�ϱ�
select lpad('100', 10, '0')
from dual;


/*
�����Լ�

round(�÷� Ȥ�� ǥ����, �ڸ���) : ������ �ڸ������� �ݿø��Ѵ�.

trunc(�÷� Ȥ�� ǥ����, �ڸ���) : ������ �ڸ������� ����� ���� ������.

mod(����1, ����2) : ������ ���� ��ȯ�Ѵ�.

abs(�÷� Ȥ�� ǥ����) : ������ ��ȯ�Ѵ�.

ceil(�÷� Ȥ�� ǥ����) : ������ ������ ũ�ų� ���� ���� �߿��� ���� ���� ������ ��ȯ�Ѵ�.
floor(�÷� Ȥ�� ǥ����) : ������ ������ �۰ų� ���� ���� �߿��� ���� ū ������ ��ȯ�Ѵ�.
*/

select round(1234.5678),
       round(1234.5678, 3),
       round(1234.5678, 2),
       round(1234.5678, 1),
       round(1234.5678, 0),
       round(1234.5678, -1),
       round(1234.5678, -2),
       round(1234.5678, -3)
from dual;

select trunc(1234.5678),
       trunc(1234.5678, 3),
       trunc(1234.5678, 2),
       trunc(1234.5678, 1),
       trunc(1234.5678, 0),
       trunc(1234.5678, -1),
       trunc(1234.5678, -2),
       trunc(1234.5678, -3)
from dual;

-- 80�� �μ��� �Ҽӵ� ������ ���̵�, �̸�, �޿�, �޿��� ���� #�� ����ϱ�
-- '#' �ϳ��� 1000�޷��� ��Ÿ����.
select employee_id, first_name, salary, lpad('#', trunc(salary/1000), '#')
from employees
where department_id = 80;

select mod(10, 4), abs(-10)
from dual;

select ceil(1), ceil(1.1), ceil(1.5), ceil(1.9), ceil(2)
from dual;

select floor(1), floor(1.1), floor(1.5), floor(1.9), floor(2)
from dual;

/*
��¥ �Լ�

sysdate : �ý����� ���� ���ڿ� �ð��� date Ÿ������ ��ȯ�Ѵ�.
        * �����Ͱ� �߰��� ��, �����Ͱ� ����� �� �ý����� ���� ��¥�� �ð������� �����ϴ� �뵵�� Ȱ��ȴ�. 
        
systimestamp : �ý����� ���� ���ڿ� �ð��� timestamp Ÿ������ ��ȯ�Ѵ�.

extract(���� from ��¥) : ��¥���� ���Ŀ� �ش��ϴ� ���� ��ȸ�Ѵ�.
                         ���� : year, month, day, hour, minute, second
                         
last_day(��¥) : ������ ��¥�� �������� �ش� ���� ������ ���ڸ� ��ȯ�Ѵ�.

next_day(��¥, ����) : ������ ��¥�� �������� ������ �ٰ��� ��¥�߿��� ������ ���Ͽ� �ش��ϴ� ��¥�� ��ȯ�Ѵ�.

���� �� ���� �Լ�
add_months(��¥, ����) : ��¥�� ������ ���ڸ�ŭ�� ���� ���� ��¥�� ��ȯ�Ѵ�.
months_between(��¥, ��¥) : �� ��¥ ������ �������� ��ȯ�Ѵ�.

�ϼ� ���� ����
��¥ + ���� = ���ڸ�ŭ ���ڰ� ����� ��¥�� ��ȯ�Ѵ�
��¥ - ���� = ���ڸ�ŭ ���� ��¥�� ��ȯ�Ѵ�.
��¥ - ��¥ = �� ��¥������ �ϼ��� ��ȯ�Ѵ�.
��¥ + 1/24 = 1�ð� ������ ��¥ �ð� ������ ��ȯ�Ѵ�.

trunc(��¥) : ������ ��¥�� ��� �ð� ������ 0�� 0�� 0�ʷ� �ٲ� ��¥�� ��ȯ�ȴ�.
round(��¥) : ������ ��¥�� �ð������� ������ ������ ���̸� �ش糯¥��
                                   ������ �������� �Ϸ� ������ ��¥�� ��ȯ�ȴ�.
                                   �ð������� 0�� 0�� 0�ʴ�.
*/

-- �ý����� ���� ���ڿ� �ð��� date, timestamp ������ ��ȸ�ϱ�
select sysdate, systimestamp
from dual;

select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;

select sysdate,                 -- ����
       add_months(sysdate, 1),  -- 1�� ��
       add_months(sysdate, 2),  -- 2�� ��
       add_months(sysdate, 3)   -- 3�� ��
from dual;

-- ������ 12�� 31���̶�� �����ϰ�, 2�� �� ��¥�� ��ȸ�ϸ� 2�� 28�� Ȥ�� 2�� 29���� ��ȯ�ȴ�.
select add_months('2023/12/31', 2)
from dual;

-- �ý����� ���� ���ڿ� �ð� �������� ��, ��, ��, ��, ��, �� ��ȸ�ϱ�
select extract(year from sysdate),
       extract(month from sysdate),
       extract(day from sysdate),
       extract(hour from systimestamp),
       extract(minute from systimestamp),
       extract(second from systimestamp)
from dual;

-- ���� ���ڰ� ���� ���� ������ ���� ��ȸ�ϱ�
select last_day(sysdate),
       last_day('2024/01/01'),
       last_day('2024/02/01')
from dual;

-- ���� ���ڸ� �������� ���� �������� ��ȸ�ϱ�
select next_day(sysdate, '������')
from dual;

-- ���� ���ڿ� ������ ��¥ ������ ���� ���� ��ȸ�ϱ�
select months_between(sysdate, '2024/6/01'),
       trunc(months_between(sysdate, '2024/6/01')) ������,
       abs(trunc(months_between(sysdate, '2024/6/01'))) as "������ ����"
from dual;

-- ���� ���ڸ� �������� 7�� ��, 3�� ��, 3�� ��, 7�� �� ��¥�� ��ȸ�ϱ�
select sysdate - 7,     -- 7�� ��
       sysdate - 3,     -- 3�� ��
       sysdate + 3,     -- 3�� ��
       sysdate + 7      -- 7�� ��
from dual;

// ������ ��¥�� �������� 7�� ���� ��¥�� ��ȸ�ϱ�
select to_date('2023/12/01'), trunc(to_date('2023/12/01')) - 7
from dual;

// ������ ��¥�� �������� 1�� ��, 1�� ���� ��¥�� ��ȸ�ϱ�
select add_months(to_date('2023/12/01'), -1),
       add_months(to_date('2023/12/01'), 1)
from dual;

// ���� �������� 7�� ���� ��¥�� ��ȸ�ϱ�
select trunc(sysdate) - 7
from dual;

// ���� �������� �Ѵ� ���� ��¥�� ��ȸ�ϱ�
select add_months(trunc(sysdate), -1)
from dual;

-- ���� �������� 7�ϵ����� �ֹ����� ��ȸ�ϱ�, ���� �����ϴ� ����
select *
from orders
where order_date >= trunc(sysdate) - 7 and order_date < trunc(sysdate + 1);

-- ���� �������� 1���������� �ֹ������� ��ȸ�ϱ�, ���� �������� �ʴ� ����
select *
from orders
where order_date >= add_months(trunc(sysdate), -1) and order_date < trunc(sysdate);

select sysdate,
       sysdate + 1/24,  -- 1�ð� ��
       sysdate + 3/24,  -- 3�ð� ��
       sysdate + 6/24  -- 6�ð� ��
from dual;


/*
��ȯ �Լ�

������ ��ȯ
    ��ȯ�Լ��� ������� �ʾƵ� �������� Ÿ���� �ڵ����� ���ϴ� ���̴�.
    '����' -> ��¥ : '����'�� ��ȿ�� ��¥ ������ ������ ��� ��¥�� ����ȴ�.
    '����' -> ���� : '����'�� ���ڷθ� �����Ǿ� ������ ���ڷ� ����ȴ�.
    
    select *
    from employees
    where hire_date >= '2005/01/01' and hire_date < '2005/07/01';
    * ���� SQL���� hire_date�� dateŸ���� �÷��̱� ������ '2005/01/01'���ڰ� dateŸ���� ������ �ڵ� ��ȯ�ȴ�.
    * '2005/01/01'�̳� '2005-01-01'�� ������ ��� �ڵ����� ��ȯ�ȴ�.
    
    select *
    from employees
    where department_id = '10';
    * ����SQL������ department_id�� numberŸ���� �÷��̱� ������ '10'���ڰ� numberŸ���� ������ �ڵ����� ��ȯ�ȴ�.

����� ��ȯ
    ��ȯ�Լ��� ����ؼ� '����' <--> ��¥, '����' <--> ���� ���� �����ͺ�ȯ�� �ϴ� ���̴�.
    
    to_date('��¥������ ���ڿ�', '����')
    ��) to_date('2023/01/01')
        * ���ڿ��� ��¥������ �ؽ�Ʈ�̱� ������ ������ �������� �ʾƵ� DATEŸ������ ��ȯ�ȴ�.
        to_date('20230101', 'YYYYMMDD')
        * ���ڿ��� �Ϲ����� ��¥ ������ �ƴ� ��쿡�� ������ �����ؾ� �Ѵ�.
        
        to_char(��¥, '����')
            ��¥�� ������ ���������� �ؽ�Ʈ�� ��ȯ�Ѵ�.
            ��¥ ��ȯ ����
                AM, PM      '����', '����'
                YYYY, YY    '2023', '23'
                MM          ��
                D           1-7 (1:�Ͽ���, 7:�����)
                DAY         ����
                DD          1-31
                HH          12�ð��� �ð�
                HH24        24�ð��� �ð�
                Mi          ��
                SS          ��
            * ��¥ ��ȯ ������ ��ҹ��ڸ� �������� �ʴ´�.
*/

-- ���ڸ� ��¥�� ��ȯ�ϱ�
select to_date('2023/01/01'),
       to_date('20230101'),     -- ? ���Ͼ��� ��ȯ ��
       to_date('2023 01 01'),   -- ? ���Ͼ��� ��ȯ ��
       to_date('2023/01/01 22:41:10', 'yyyy/mm/dd hh24:mi:ss')
from dual;

-- ��¥�� ���ڷ� ��ȯ�ϱ�
select to_char(sysdate, 'yyyy'),
       to_char(sysdate, 'mm'),
       to_char(sysdate, 'dd'),
       to_char(sysdate, 'day'),
       to_char(sysdate, 'am'),
       to_char(sysdate, 'hh'),
       to_char(sysdate, 'hh24')
from dual;

-- �������̺��� 2005�⵵�� �Ի��� ������ ���̵�, �̸�, �Ի����ڸ� ��ȸ�ϱ�
select employee_id, first_name, hire_date
from employees
where to_char(hire_date, 'yyyy') = '2005';

-- ���� SQL���� ���� ������� �������� �Ʒ��� ����� �� ��õ�Ѵ�.
-- ���� SQL���� ������ ����� �� ���� ������ ���̶� ��ȿ�����̴�.
select employee_id, first_name, hire_date
from employees
where hire_date >= '2005/01/01' and hire_date < '2006/01/01';

-- ���ڸ� ,�� ���Ե� ���ڷ� ��ȯ�Ѵ�.
select to_char(100000, '999,999'),
        to_char(1000000, '999,999') -- ���ĺ��� ���ų� �۾ƾ߸� ������ �׷��� ������ ###���� ��µȴ�.
from dual;

-- ���ڸ� ���ڷ� ��ȯȯ��.
select to_number('10000'),
       To_number('100,000', '999,999')  -- ���ڰ� �ƴ� ���ڰ� ���ԵǾ� ������ ������ ������߸� ��ȯ�ȴ�.
from dual;
