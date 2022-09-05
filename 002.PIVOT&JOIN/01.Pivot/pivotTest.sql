--PIVOT QUERY TEST

CREATE TABLE pivotTest
   (  uName NCHAR(3),
      season NCHAR(2),
      amount NUMBER(3));

INSERT  INTO  pivotTest VALUES ('�����' , '�ܿ�',  10) ;
INSERT  INTO  pivotTest VALUES ('������' , '����',  15) ;
INSERT  INTO  pivotTest VALUES ('�����' , '����',  25) ;
INSERT  INTO  pivotTest VALUES ('�����' , '��',    3) ;
INSERT  INTO  pivotTest VALUES ('�����' , '��',    37) ;
INSERT  INTO  pivotTest VALUES ('������' , '�ܿ�',  40) ;
INSERT  INTO  pivotTest VALUES ('�����' , '����',  14) ;
INSERT  INTO  pivotTest VALUES ('�����' , '�ܿ�',  22) ;
INSERT  INTO  pivotTest VALUES ('������' , '����',  64) ;
SELECT * FROM pivotTest;
COMMIT;
SELECT * FROM pivotTest
   PIVOT ( SUM(amount) 
           FOR season 
           IN ('��','����','����','�ܿ�') )   ;