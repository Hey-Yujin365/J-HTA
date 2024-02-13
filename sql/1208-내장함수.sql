/*
문자 함수

lower(컬럼 혹은 표현식) : 소문자로 변환된 문자를 반환한다.
upper(컬럼 혹은 표현식) : 대문자로 변환된 문자를 반환한다.

concat(컬럼 혹은 표현식, 컬럼 혹은 표현식) : 두 문자열을 연결해서 반환한다.

length(컬럼 혹은 표현식) : 문자열의 길이를 반환한다.

substr(컬럼 혹은 표현식, 시작위치, 길이) : 문자열의 시작위치부터 길이만큼 잘라서 반환한다.
                                       시작위치는 1부터 시작한다.
                                       
instr(컬럼 혹은 표현식, 문자열) : 지정된 문자열이 처음으로 등장하는 위치를 반환한다.

trim(컬럼 혹은 표현식) : 불필요한 좌우 여백이 제거된 문자열을 반환한다.

lpad(컬럼 혹은 표현식, 길이, 문자) : 컬럼 혹은 표현식의 길이가 지정된 길이보다 짧으면
                         부족한 길이만큼 왼쪽에 지정된 문자가 채워진 문자열이 반환된다.
*/

-- 60번 부서에 소속된 직원들의 이름을 소문자, 대문자로 조회하기
select first_name, Lower(first_name), upper(first_name)
from employees
where department_id = 60;

-- 60번 부서에 소속된 직원들의 first_name과 last_name을 연결해서 조회하기
select concat(first_name, last_name)
from employees
where department_id = 60;

-- 60번 부서에 소속된 직원들의 first_name과 last_name을 연결해서 조회하기
select first_name || ' ' ||last_name
from employees
where department_id = 60;

-- 60번 부서에 소속된 직원들의 이름과 이름의 길이를 조회하기
select first_name, length(first_name)
from employees
where department_id = 60;

-- 이름이 6글자 이상인 모든 직원들의 직원아이디와 이름을 조회하기
select employee_id, first_name
from employees
where length(first_name) >= 6;

-- sample_books에서 저자이름을 조회하고, 저자이름을 첫 번째 글자도 조회하기
select book_writer, substr(book_writer, 1, 1)
from sample_books;

-- 전화번호에서 국번만 조회하기
select substr('031)1234-5678', 1, instr('031)1234-5678', ')') -1)
from dual;

-- dual은 오라클에서 제공하는 dummy 테이블이다.
-- dual은 1행 1열짜리 테이블이다.
-- 실제 테이블 조회없이 간단한 연산을 수행할 때 이용한다.
select *
from dual;

-- 불필요한 좌우 여백이 제거된 문자열을 조회하기
select trim('            hello world     ')
from dual;

-- 지정된 길이만큼 문자열의 왼쪽에 '0'을 채워서 조회하기
select lpad('100', 10, '0')
from dual;


/*
숫자함수

round(컬럼 혹은 표현식, 자릿수) : 지정된 자릿수까지 반올림한다.

trunc(컬럼 혹은 표현식, 자릿수) : 지정된 자릿수까지 남기고 전부 버린다.

mod(숫자1, 숫자2) : 나머지 값을 반환한다.

abs(컬럼 혹은 표현식) : 절댓값을 반환한다.

ceil(컬럼 혹은 표현식) : 지정된 값보다 크거나 같은 정수 중에서 가장 작은 정수를 반환한다.
floor(컬럼 혹은 표현식) : 지정된 값보다 작거나 같은 정수 중에서 가장 큰 정수를 반환한다.
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

-- 80번 부서에 소속된 직원의 아이디, 이름, 급여, 급여에 대한 #을 출력하기
-- '#' 하나는 1000달러를 나타낸다.
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
날짜 함수

sysdate : 시스템의 현재 일자와 시간을 date 타입으로 반환한다.
        * 데이터가 추가될 때, 데이터가 변경될 때 시스템의 현재 날짜와 시간정보를 저장하는 용도로 활용된다. 
        
systimestamp : 시스템의 현재 일자와 시간을 timestamp 타입으로 변환한다.

extract(포맷 from 날짜) : 날짜에서 형식에 해당하는 값을 조회한다.
                         형식 : year, month, day, hour, minute, second
                         
last_day(날짜) : 지정된 날짜를 기준으로 해당 월의 마지막 일자를 반환한다.

next_day(날짜, 요일) : 지정된 날짜를 기준으로 앞으로 다가올 날짜중에서 지정된 요일에 해당하는 날짜를 반환한다.

개월 수 관련 함수
add_months(날짜, 숫자) : 날짜에 지정된 숫자만큼의 월을 더한 날짜를 반환한다.
months_between(날짜, 날짜) : 두 날짜 사이의 개월수를 반환한다.

일수 관련 연산
날짜 + 숫자 = 숫자만큼 일자가 경과된 날짜를 반환한다
날짜 - 숫자 = 숫자만큼 이전 날짜를 반환한다.
날짜 - 날짜 = 두 날짜사이의 일수를 반환한다.
날짜 + 1/24 = 1시간 이후의 날짜 시간 정보를 반환한다.

trunc(날짜) : 지정된 날짜의 모든 시간 정보를 0시 0분 0초로 바꾼 날짜가 반환된다.
round(날짜) : 지정된 날짜의 시간정보가 정오를 지나기 전이면 해당날짜가
                                   정오를 지났으면 하루 증가된 날짜가 반환된다.
                                   시간정보는 0시 0분 0초다.
*/

-- 시스템의 현재 일자와 시간을 date, timestamp 형으로 조회하기
select sysdate, systimestamp
from dual;

select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;

select sysdate,                 -- 오늘
       add_months(sysdate, 1),  -- 1달 후
       add_months(sysdate, 2),  -- 2달 후
       add_months(sysdate, 3)   -- 3달 후
from dual;

-- 오늘이 12월 31일이라고 가정하고, 2달 후 날짜를 조회하면 2월 28일 혹은 2월 29일이 반환된다.
select add_months('2023/12/31', 2)
from dual;

-- 시스템의 현재 일자와 시간 정보에서 년, 월, 일, 시, 분, 초 조회하기
select extract(year from sysdate),
       extract(month from sysdate),
       extract(day from sysdate),
       extract(hour from systimestamp),
       extract(minute from systimestamp),
       extract(second from systimestamp)
from dual;

-- 현재 일자가 속한 월의 마지막 일자 조회하기
select last_day(sysdate),
       last_day('2024/01/01'),
       last_day('2024/02/01')
from dual;

-- 현재 일자를 기준으로 다음 월요일을 조회하기
select next_day(sysdate, '월요일')
from dual;

-- 현재 일자와 지정된 날짜 사이의 개월 수를 조회하기
select months_between(sysdate, '2024/6/01'),
       trunc(months_between(sysdate, '2024/6/01')) 개월수,
       abs(trunc(months_between(sysdate, '2024/6/01'))) as "개월수 절댓값"
from dual;

-- 현재 일자를 기준으로 7일 전, 3일 전, 3일 후, 7일 후 날짜를 조회하기
select sysdate - 7,     -- 7일 전
       sysdate - 3,     -- 3일 전
       sysdate + 3,     -- 3일 후
       sysdate + 7      -- 7일 후
from dual;

// 지정된 날짜를 기준으로 7일 전의 날짜를 조회하기
select to_date('2023/12/01'), trunc(to_date('2023/12/01')) - 7
from dual;

// 지정된 날짜를 기준으로 1달 전, 1달 후의 날짜를 조회하기
select add_months(to_date('2023/12/01'), -1),
       add_months(to_date('2023/12/01'), 1)
from dual;

// 오늘 기준으로 7일 전의 날짜를 조회하기
select trunc(sysdate) - 7
from dual;

// 오늘 기준으로 한달 전의 날짜를 조회하기
select add_months(trunc(sysdate), -1)
from dual;

-- 오늘 기준으로 7일동안의 주문내역 조회하기, 오늘 포함하는 기준
select *
from orders
where order_date >= trunc(sysdate) - 7 and order_date < trunc(sysdate + 1);

-- 오늘 기준으로 1개월동안의 주문내역을 조회하기, 오늘 포함하지 않는 기준
select *
from orders
where order_date >= add_months(trunc(sysdate), -1) and order_date < trunc(sysdate);

select sysdate,
       sysdate + 1/24,  -- 1시간 후
       sysdate + 3/24,  -- 3시간 후
       sysdate + 6/24  -- 6시간 후
from dual;


/*
변환 함수

묵시적 변환
    변환함수를 사용하지 않아도 데이터의 타입이 자동으로 변하는 것이다.
    '문자' -> 날짜 : '문자'가 유효한 날짜 형식의 문자인 경우 날짜로 변경된다.
    '문자' -> 숫자 : '문자'가 숫자로만 구성되어 있으면 숫자로 변경된다.
    
    select *
    from employees
    where hire_date >= '2005/01/01' and hire_date < '2005/07/01';
    * 위의 SQL에서 hire_date가 date타입의 컬럼이기 때문에 '2005/01/01'문자가 date타입의 값으로 자동 변환된다.
    * '2005/01/01'이나 '2005-01-01'의 형식인 경우 자동으로 변환된다.
    
    select *
    from employees
    where department_id = '10';
    * 위의SQL문에서 department_id가 number타입의 컬럼이기 때문에 '10'문자가 number타입의 값으로 자동으로 변환된다.

명시적 변환
    변환함수를 사용해서 '문자' <--> 날짜, '문자' <--> 숫자 간의 데이터변환을 하는 것이다.
    
    to_date('날짜형식의 문자열', '패턴')
    예) to_date('2023/01/01')
        * 문자열이 날짜형식의 텍스트이기 때문에 패턴을 지정하지 않아도 DATE타입으로 변환된다.
        to_date('20230101', 'YYYYMMDD')
        * 문자열이 일반적인 날짜 형식이 아닌 경우에는 패턴을 지정해야 한다.
        
        to_char(날짜, '포맷')
            날짜를 지정된 포맷형식의 텍스트로 변환한다.
            날짜 변환 형식
                AM, PM      '오전', '오후'
                YYYY, YY    '2023', '23'
                MM          월
                D           1-7 (1:일요일, 7:토요일)
                DAY         요일
                DD          1-31
                HH          12시간제 시간
                HH24        24시간제 시간
                Mi          분
                SS          초
            * 날짜 변환 형식은 대소문자를 구분하지 않는다.
*/

-- 문자를 날짜로 변환하기
select to_date('2023/01/01'),
       to_date('20230101'),     -- ? 패턴없이 변환 됨
       to_date('2023 01 01'),   -- ? 패턴없이 변환 됨
       to_date('2023/01/01 22:41:10', 'yyyy/mm/dd hh24:mi:ss')
from dual;

-- 날짜를 문자로 변환하기
select to_char(sysdate, 'yyyy'),
       to_char(sysdate, 'mm'),
       to_char(sysdate, 'dd'),
       to_char(sysdate, 'day'),
       to_char(sysdate, 'am'),
       to_char(sysdate, 'hh'),
       to_char(sysdate, 'hh24')
from dual;

-- 직원테이블에서 2005년도에 입사한 직원의 아이디, 이름, 입사일자를 조회하기
select employee_id, first_name, hire_date
from employees
where to_char(hire_date, 'yyyy') = '2005';

-- 위의 SQL문과 같은 결과값이 나오지만 아래의 방식을 더 추천한다.
-- 위의 SQL문은 색인을 사용할 수 없게 가공된 것이라 비효율적이다.
select employee_id, first_name, hire_date
from employees
where hire_date >= '2005/01/01' and hire_date < '2006/01/01';

-- 숫자를 ,가 포함된 문자로 변환한다.
select to_char(100000, '999,999'),
        to_char(1000000, '999,999') -- 형식보다 같거나 작아야만 나오고 그렇지 않으면 ###으로 출력된다.
from dual;

-- 문자를 숫자로 변환환다.
select to_number('10000'),
       To_number('100,000', '999,999')  -- 숫자가 아닌 문자가 포함되어 있으면 패턴을 적어줘야만 변환된다.
from dual;
