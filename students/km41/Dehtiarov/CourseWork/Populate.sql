INSERT INTO ROLE(ROLE_NAME,ROLE_DESC)
 VALUES
 ('ADMIN','QWE');
 
 INSERT INTO ROLE(ROLE_NAME,ROLE_DESC)
 VALUES
 ('USER','123');
 
 INSERT INTO ROLE(ROLE_NAME,ROLE_DESC)
 VALUES
 ('MANAGER','1234');
 
 INSERT INTO USERDB(USER_EMAIL,USER_PASSWORD,ROLE_NAME,USER_NAME,USER_IDCODE,USER_PHONENUMBER,USER_PASSPORT,ISDELETED)
 VALUES
 ('1@MAIL.COM','a623456d','USER','Petrov Ivan',123456789011,'+38(050)1234567','��123332','N');
 
 INSERT INTO USERDB(USER_EMAIL,USER_PASSWORD,ROLE_NAME,USER_NAME,USER_IDCODE,USER_PHONENUMBER,USER_PASSPORT, ISDELETED)
 VALUES
 ('2@MAIL.COM','a623456d','ADMIN','Petrov Ivan',123456789011,'+38(050)1234567','��123332','N');
 
 INSERT INTO USERDB (USER_EMAIL,USER_PASSWORD,ROLE_NAME,USER_NAME,USER_IDCODE,USER_PHONENUMBER,USER_PASSPORT,ISDELETED)
 VALUES
 ('3@MAIL.COM','a623456d','MANAGER','Sidorov Ivan',123456782111,'+38(050)1274567','��124432','N');
 
 INSERT INTO USERDB (USER_EMAIL,USER_PASSWORD,ROLE_NAME,USER_NAME,USER_IDCODE,USER_PHONENUMBER,USER_PASSPORT,ISDELETED)
 VALUES
 ('4@MAIL.COM','a623456d','USER','Sidorov Pavlo',122456982111,'+38(050)1974567','��184432','N');
 
 INSERT INTO USERDB (USER_EMAIL,USER_PASSWORD,ROLE_NAME,USER_NAME,USER_IDCODE,USER_PHONENUMBER,USER_PASSPORT,ISDELETED)
 VALUES
 ('5@MAIL.COM','a623456d','USER','Sivov Pavlo',126656982111,'+38(095)1974567','��155432','N');
 
 
 INSERT INTO CREDITPL (CREDIT_DATE,CREDIT_NAME,CREDIT_DESCRIPTION,CREDIT_RANGE,CREDIT_VALUE,CREDIT_PERCENT,STATUS)
 VALUES
 (TO_DATE('1-2-2017','MM-DD-YYYY'),'�������','������� ���������������� ������',12,10000,12,'ACTIVE');
 
 INSERT INTO CREDITPL (CREDIT_DATE,CREDIT_NAME,CREDIT_DESCRIPTION,CREDIT_RANGE,CREDIT_VALUE,CREDIT_PERCENT,STATUS)
 VALUES
 (TO_DATE('12-1-2017','MM-DD-YYYY'),'����������','�������������� ������ � ������� ��������',12,10000,2,'ACTIVE');
 
 INSERT INTO CREDITPL (CREDIT_DATE,CREDIT_NAME,CREDIT_DESCRIPTION,CREDIT_RANGE,CREDIT_VALUE,CREDIT_PERCENT,STATUS)
 VALUES
 (TO_DATE('1-2-2017','MM-DD-YYYY'),'��������','������ ��� ���� �����',24,1000,12,'ACTIVE');
 
 INSERT INTO "CREDIT" (USER_EMAIL,CREDIT_DATE,CREDIT_NAME,RANGE,VALUE,STATUS,ROLE_NAME)
 VALUES
 ('1@MAIL.COM',(TO_DATE('1-2-2017','MM-DD-YYYY')),'�������',10,1000,'ACTIVE','USER');
 
 INSERT INTO "CREDIT" (USER_EMAIL,CREDIT_DATE,CREDIT_NAME,RANGE,VALUE,STATUS,ROLE_NAME)
 VALUES
 ('1@MAIL.COM',TO_DATE('12-1-2017','MM-DD-YYYY'),'����������',12,2000,'ACTIVE','USER');
 
 INSERT INTO "CREDIT" (USER_EMAIL,CREDIT_DATE,CREDIT_NAME,RANGE,VALUE,STATUS,ROLE_NAME)
 VALUES
 ('4@MAIL.COM',TO_DATE('12-1-2017','MM-DD-YYYY'),'����������',12,6000,'ACTIVE','USER');
 
 INSERT INTO "CREDIT" (USER_EMAIL,CREDIT_DATE,CREDIT_NAME,RANGE,VALUE,STATUS,ROLE_NAME)
 VALUES
 ('5@MAIL.COM',TO_DATE('1-2-2017','MM-DD-YYYY'),'��������',12,7000,'ACTIVE','USER');