# 시퀀스

## 시퀀스는 객체를 초기화해 놓기만 하면 요청할 때마다 증가한 값을 자동으로 돌려준다.

```sql
만들때
CREATE SEQUENCE 이름 [AS 타입] START WITH 시작값 INCREMENT BY 증가값
MINVALUE 최소값 MAXVALUE 최대값 CYCLE | NOCYCLE CACHE | NOCACHE

CREATE SEQUENCE seqSale START WITH 1 INCREMENT BY 1;
필요 없으면 DROP SEQUENCE 명령으로 직접 삭제
```

<aside>
💡 
시작값과 증가값을 바꾸면 2, 4, 6, 8이나 3, 6, 9 식으로 번호를 붙일 수 있지만 식별 자체가 목적이라면 굳이 그럴 필요는 없다.

</aside>

```sql
오라클은 시퀀스 객체의 NEXTVAL 값을 읽어 구한다.
INSERT INTO tSale VALUES (seqSale.NEXTVAL, '단군', '지팡이');
INSERT INTO tSale VALUES (seqSale.NEXTVAL, '고주몽', '고등어');

현재값은 시퀀스 객체의 CURRVAL 값을 읽어 구한다.
SELECT seqSale.CURRVAL FROM DUAL;
```

![Untitled](%E1%84%89%E1%85%B5%E1%84%8F%E1%85%AF%E1%86%AB%E1%84%89%E1%85%B3%20b027e6069cfb47a9b84c042c0de52498/Untitled.png)

##