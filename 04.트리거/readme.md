# 트리거

## 트리거(Trigger)란

- 테이블의 **DML(Insert,Update,Delete)**문이 작동할때 미리 정의해놓은 기능을 자동으로 실행되게 만드는것으로 테이블 또는 뷰에 부착되는 프로그램 코드의 일종 , **데이터베이스 개체**라고 생각하면 됨.

## 트리거의 기본 형식

- - BEFORE 및 AFTER를 지정하면 해당 테이블에 SQL이 수행되고, 작업 전 또는 후에 트리거의 내용이 실행됨.
- - BEFORE와 AFTER는 테이블에 대해서만 지정할 수 있으며, 뷰에 대해서는 지정할 수 없음
- ~~- INSTEAD OF의 용도는 뷰에 사용됨.
- INSTEAD OF를 지정하면 해당 뷰에 지정한 SQL(INSERT, UPDATE, DELETE)이 작동하며, 시도된 SQL은 무시되고
트리거에 지정된 SQL 문이 대신 작동됨. (뷰 부분은 아직 공부하지 않았으니 무시해도 좋음)~~
- 새로들어오는 데이터값은 :NEW , 기존 데이터값은 :OLD 로 구분지을수있음

## 기본 구문

> CREATE [ OR REPLACE ] TRIGGER [ schema.] trigger
> 
> 
> BEFORE | AFTER | INSTEAD OF 
> 
> DML EVENT ( INSERT [OR] UPDATE [OR} DELETE )
> 
> ON [SCHEMA.] DATABASE TABLE
> 
> WHEN ( 조건)
> 
> PL/SQL_BLOCK | CALL_PROCEDURE_STATEMENT ;
> 

```sql
--간단한 사용방법1
--ING테이블(데이터가 계속해서 발생하는 테이블)이 수정 또는 삭제가 되었을때
--원본 이력을 HISTORY_TABLE에 계속해서 저장해보기.
DROP TABL ING_TABLE ;
DROP TABLE HISTORY_TABLE ; 
CREATE TABLE ING_TABLE ( id NUMBER, test_data NVARCHAR2(10));
INSERT INTO ING_TABLE VALUES ( 1 , 'data1');
INSERT INTO ING_TABLE VALUES ( 2 , 'data2');
INSERT INTO ING_TABLE VALUES ( 3 , 'data3');
COMMIT;

CREATE TABLE HISTORY_TABLE ( id NUMBER, test_data VARCHAR2(10) , result_date date , result_data NVARCHAR2(10) );

CREATE OR REPLACE TRIGGER Trg_ING_TABLE  -- 트리거 이름
    AFTER DELETE  OR UPDATE -- 삭제 및 수정 후에 작동하게 지정 **BEFORE , AFTER 꼭 구분하기**
    ON  ING_TABLE -- 트리거를 부착할 테이블
    FOR EACH ROW -- 각 행마다 적용됨
BEGIN --실행부 => 이해가 안된다면 메소드의 블럭킹을 떠올리면 될것같음.
    INSERT INTO HISTORY_TABLE VALUES ( :OLD.id , :OLD.test_data , sysdate , null); 
--:OLD.iD <= 기존에 있던 데이터를 가지고올수있음
END;

UPDATE ING_TABLE SET test_data = 'data11' WHERE id = 1;
DELETE ING_TABLE WHERE id = 2;
COMMIT;
SELECT * FROM HISTORY_TABLE;
```

```sql
--응용1.트리거는 해당하는 DML이 작업한것이 UPDATE , DELETE 작업인지를 구분할수가있음.

CREATE OR REPLACE TRIGGER Trg_ING_TABLE  -- 트리거 이름
    AFTER DELETE  OR UPDATE -- 삭제 및 수정 후에 작동하게 지정
    ON  ING_TABLE -- 트리거를 부착할 테이블
    FOR EACH ROW -- 각 행마다 적용됨
BEGIN
    IF UPDATING THEN  -- 업데이트 되었다면
        INSERT INTO HISTORY_TABLE VALUES ( :OLD.id , :OLD.test_data , sysdate , 'UPDATE'); 
     ELSIF DELETING  THEN -- 삭제되었다면,
         INSERT INTO HISTORY_TABLE VALUES ( :OLD.id , :OLD.test_data , sysdate , 'DELETE'); 
    END IF;
    
END;
```

```sql
--응용3. 특정열이 수정될때를 감지할수도있음.
--기존 트리거 삭제 (Trg_ING_TABLE ) DROP TRIGGER Trg_ING_TABLE  ;
CREATE OR REPLACE TRIGGER Trg_ING_TABLE_DATA  -- 트리거 이름
    AFTER UPDATE OF TEST_DATA -- 해당하는 이름의 열이 업데이트 된 경우
    ON  ING_TABLE -- 트리거를 부착할 테이블
    FOR EACH ROW -- 각 행마다 적용됨
BEGIN
    INSERT INTO HISTORY_TABLE VALUES ( :OLD.id , :OLD.test_data||'UP' , sysdate , null); 
END;

UPDATE ING_TABLE SET test_data = 'data11' WHERE id = 1;
COMMIT;
```