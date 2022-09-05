--PIVOT QUERY TEST

CREATE TABLE pivotTest
   (  uName NCHAR(3),
      season NCHAR(2),
      amount NUMBER(3));

INSERT  INTO  pivotTest VALUES ('±è¹ü¼ö' , '°Ü¿ï',  10) ;
INSERT  INTO  pivotTest VALUES ('À±Á¾½Å' , '¿©¸§',  15) ;
INSERT  INTO  pivotTest VALUES ('±è¹ü¼ö' , '°¡À»',  25) ;
INSERT  INTO  pivotTest VALUES ('±è¹ü¼ö' , 'º½',    3) ;
INSERT  INTO  pivotTest VALUES ('±è¹ü¼ö' , 'º½',    37) ;
INSERT  INTO  pivotTest VALUES ('À±Á¾½Å' , '°Ü¿ï',  40) ;
INSERT  INTO  pivotTest VALUES ('±è¹ü¼ö' , '¿©¸§',  14) ;
INSERT  INTO  pivotTest VALUES ('±è¹ü¼ö' , '°Ü¿ï',  22) ;
INSERT  INTO  pivotTest VALUES ('À±Á¾½Å' , '¿©¸§',  64) ;
SELECT * FROM pivotTest;
COMMIT;
SELECT * FROM pivotTest
   PIVOT ( SUM(amount) 
           FOR season 
           IN ('º½','¿©¸§','°¡À»','°Ü¿ï') )   ;