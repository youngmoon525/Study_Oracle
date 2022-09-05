# 99.ETC_SELECT&MERGE

```sql
-DB 계정에 있는 테이블 전체 목록 조회
SELECT * FROM SYS.dba_tables where owner = 'HR';
--테이블의 열(컬럼) 조회
SELECT * FROM SYS.DBA_TAB_COLUMNS WHERE OWNER = 'HR' AND TABLE_NAME = 'EMPLOYEES';
--다른 스키마(계정)에 있는 데이터 조회 시 앞에 스키마를 붙여줌
SELECT * FROM HR.employees;

- -데이터 변경 MERGE ( 조건부 데이터 변경)
--1.테스트용 테이블 추가
DROP TABLE TEST_MERGE;
DROP TABLE TEST_MERGE_SUB;

CREATE TABLE TEST_MERGE (
	key1 number primary key,
	data1 varchar2(100)
);

CREATE TABLE TEST_MERGE_SUB (
	key1 number primary key,
	data1 varchar2(100)
);

INSERT INTO test_merge_sub VALUES ( 1 , 2);
INSERT INTO test_merge VALUES ( 1 , 6);
INSERT INTO test_merge VALUES ( 2 , 4);
COMMIT;

--MERGE문은 조건식에 따라서 INSERT , UPDATE , DELETE를 동적으로 수행하여 병합할때 사용하는 구문
MERGE
INTO TEST_MERGE_SUB T   -- 데이터가 수정이 될 테이블
USING (SELECT * FROM TEST_MERGE) S -- 이용할 테이블
ON (T.KEY1 = S.KEY1)
WHEN MATCHED THEN
UPDATE SET T.DATA1 = 'TEST-U'
WHEN NOT MATCHED THEN
INSERT (T.KEY1 , T.DATA1 ) VALUES (S.KEY1 , S.DATA1 );

SELECT * FROM TEST_MERGE_SUB;
```

<aside>
💡 A테이블에 있는 데이터와 B테이블에 있는 데이터를 병합해야 하는경우 사용하면 좋다.

</aside>
