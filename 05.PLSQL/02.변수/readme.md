# 출력문 사용해보기

## DECLARE 변수 선언부

- -PL/SQL은 버전에 따라 기본적으로 실행이 되었다고만 표기 되기때문에 SET SERVEROUTPUT ON; 
   속성을 이용해 결과 출력부분이 필요함.


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

--  문제.
--  