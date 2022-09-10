--SQL TABLE 문제---
-- 테이블 만들기 연습 : 제약조건은 테이블을 만들때 CONSTRAINT를 이용하여 추가하세요.

-- TABLE 만들기 --
--1번 : 테이블 이름 : ORDER_ING
--필요 컬럼
-- ORDER_ID	    NUMBER(12,0)        DESC: 주문구분번호
-- ORDER_DATE   DATE                DESC: 주문일자
-- ORDER_MODE	  VARCHAR2(8 )  DESC: 주문 구분 ( 온라인 또는 직접 )
-- CUSTOMER_ID	NUMBER(6,0)         DESC: 제품 공급사
-- ORDER_STATUS	NUMBER(2,0)         DESC : 주문 상태
-- ORDER_TOTAL	NUMBER(8,2)         DESC : 주문 수량
-- SALES_REP_ID	NUMBER(6,0)         DESC: 할인율 코드
-- PROMOTION_ID	NUMBER(6,0)         DESC: 프로모션 코드

--제약조건: 기본키 ORDER_ID , ORDER_MODE에는 'D' 또는 'O'만 입력가능하며 ORDER_TOTAL은 NULL이아닌 기본값 0을 가진다.



-- 2번 : 테이블이름 : ORDER_ITEMS 
-- 컬럼 :   ORDER_ID	    NUMBER(12,0)
--          LINE_ITEM_ID NUMBER(3,0) 
--          PRODUCT_ID   NUMBER(3,0) 
--          UNIT_PRICE   NUMBER(8,2) 
--          QUANTITY     NUMBER(8,0)
-- 제약사항 : 기본키는 ORDER_ID와 LINE_ITEM_ID
--             UNIT_PRICE, QUANTITY 의 디폴트 값은 0

-- 3번 : 테이블 : PROMOTIONS
-- 컬럼 :   PROMO_ID	    NUMBER(6,0)
--          PROMO_NAME   VARCHAR2(20) 
-- 제약사항 : 기본키는 PROMO_ID


-- 4번 : 테이블 : SALES
-- 컬럼 : SALES_REP_ID 할인율 코드
--        SALES_PERSENT 할인율 값  
-- 해당하는 테이블을 만들때 할인율의 값의 데이터타입은 어떤타입을 하는게 좋을지 생각해서 만들어보기.

-- 5번 : 각 테이블은 아직 관계가 없는 비식별 관계이다.
-- ORDER_ID , SALES_REP_ID , PROMOTION_ID등의 컬럼들을 확인하고 외래키 조건을 통해 식별 관계를 만들어보기.
