# 조건문(IF , CASE)

### IF문

> 조건에 따라 분기한다. 한 문장 이상이 처리되어야 할 때는 BEGIN… END와 함께 묶어줘야만
하며, 습관적으로 실행할 문장이 한 문장이라도 BEGIN… END로 묶어주는 것이 좋음.
> 

> (IF(조건){ ← → } 프로그래밍언어(Java,C#,C)의 조건문과 유사함.)
> 

### 1.단순 IF문

**구조**

IF 조건식 THEN 

조건식이 TRUE일때 실행할 문장

END IF;

```sql

SET SERVEROUTPUT ON;
BEGIN
IF  1 = 1 THEN  -- 만약에 조건이 참이라면.(TRUE)
    DBMS_OUTPUT.PUT_LINE('조건문  TRUE ');
END IF;
END ;
```

### 2.IF - ELSE 문

**구조**

IF 조건식 THEN

조건식이 TRUE일때 실행할 문장

ELSE

조건식이 FALSE일때 실행할 문장

END IF;

```sql
SET SERVEROUTPUT ON;
BEGIN
IF  1 = 2 THEN  -- 만약에 조건이 참이라면.(TRUE)
    DBMS_OUTPUT.PUT_LINE('조건문  TRUE ');
ELSE
    DBMS_OUTPUT.PUT_LINE('조건문  FALSE ');
END IF;
END ;
```

### 3. IF -ELSE IF - ELSE 문 (다중 IF문)

**구조**

IF 조건식1 THEN

조건식1이  TRUE일때 실행할 문장

**ELSIF** 조건식2 THEN

조건식2가 TRUE일때 실행할 문장

ELSE 

모든 조건식이 FALSE일때 실행할 ELSE 

END IF;←반드시 END IF로 끝나야함.

<aside>
💡 ELSE IF (x) ⇒ ELSIF 로 다음 조건 연결

</aside>

```sql
SET SERVEROUTPUT ON;
BEGIN
IF  1 = 2 THEN
DBMS_OUTPUT.PUT_LINE('조건문  TRUE ');
**ELSIF** 1 = 3 THEN
DBMS_OUTPUT.PUT_LINE('조건문  TRUE ');
ELSE
DBMS_OUTPUT.PUT_LINE('모든 조건문  FALSE');
END IF;
END;
```

### 4.CASE 문

구조

CASE

WHEN 조건식1 THEN

조건식1 TRUE일때 실행부

WHEN 조건식2 THEN

조건식2 TRUE일때 실행부

ELSE

조건식이 모두 FALSE일때 실행부

END CASE;

```sql
SET SERVEROUTPUT ON;
BEGIN
CASE
WHEN 1 = 2 THEN
DBMS_OUTPUT.PUT_LINE('조건문1  TRUE ');
WHEN 1 = 3 THEN
DBMS_OUTPUT.PUT_LINE('조건문2  TRUE ');
ELSE
DBMS_OUTPUT.PUT_LINE('조건문  FALSE ');
END CASE;
END;
```

문제1) 조건문에 사용할 변수 v_score와 v_grade를 각각 변수 선언부(DECLARE)에서 만들고 조건문으로 다음과 같은 처리를 한다.

v_score에 점수가 90~100점⇒ v_grade에는 ‘A’값을 담고 출력

ex) 점수가 95점이며 A등급입니다.

80~89⇒B등급 , 70~79는 C등급 그외에는 등급이 없습니다를 출력

문제2)v_num이라는 변수를 변수 선언부에 만들고 해당하는 변수에 아무 숫자나 넣고 초기화를 시킨다.

조건문을 이용해 해당하는 변수에 담긴 수가 홀수인지 짝수인지를 판단하는 조건문을 만들어보기..
