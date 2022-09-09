# 출력문 사용해보기

## DECLARE 변수 선언부

- -변수를 이용해서 출력해보기


```sql
SET SERVEROUTPUT ON; 
	DECLARE--BEGIN실행문에서 사용할 변수를 선언
	v_Str  VARCHAR2(100); -- 문자열 데이터를 담을 변수 선언
	v_Int INT ; -- Oracle에도 INT형이 있지만 NUMBER는 고정 및 부동 소숫점을 유지하기 때문에 NUMBER를 많이 사용함.
	v_Num NUMBER; --※
	BEGIN
	v_str := 'KYM_TEST_ORACLE_VARIABLE';
	v_Int := 10.5;
	v_Num := 3.14;
	DBMS_OUTPUT.put_line('변수 출력 : '||v_str);
	DBMS_OUTPUT.put_line('변수 출력 : '||v_Int);
	DBMS_OUTPUT.put_line('변수 출력 : '||v_Num);
	END;

	--변수 초기화도 가능함.
	DECLARE
	v_Str VARCHAR2(100) := '변수 초기화식';
	BEGIN
	DBMS_OUTPUT.put_line('변수 출력 : '||v_str);
	END;
	```

--  문제.v_Str 이라는 변수에 테이블의 조회 결과 1건을 넣고 출력해보기
--  