# 출력문 사용해보기

## DBMS_OUTPUT.PUTLINE

- -PL/SQL은 버전에 따라 기본적으로 실행이 되었다고만 표기 되기때문에 SET SERVEROUTPUT ON; 
   속성을 이용해 결과 출력부분이 필요함.


```sql

SET SERVEROUTPUT ON;--해당하는 부분을 써주면 PLSQL에서 출력한 결과가 로그에 찍힘
BEGIN               --PL/SQL의 실행부로 다양한 로직을 넣을수있고 반드시 END<- 종료부와 쌍을 맞춰서 사용
                    --자바의 블럭킹을 생각하면 이해하기가 쉽다.
    DBMS_OUTPUT.PUT_LINE('HelloOracle');
    DBMS_OUTPUT.PUT_LINE('HelloOracle'||'PL/SQL사용');
END;
```

--  문제. DBMS_OUTPUT.PUTLINE 기능을 이용하여 문자열(이니셜등 자유로운문자열)과 숫자의합을 출력해보기.
--  출력결과 : KYM 1+10 = 10  