/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     25.10.2017 6:49:20                           */
/*==============================================================*/


alter table CREDIT
   drop constraint FK_CREDIT_WANT_TO_R_USERDB;

  alter table CREDIT
     drop constraint "FK_CREDIT_WILL_BE_C_CREDIT P";
  
  alter table "USERDB"
     drop constraint FK_USERDB_IS_ROLE;
  
  drop index will_be_choosen_FK;
  
  drop index want_to_take_credit_FK;
  
  drop table CREDIT cascade constraints;
  
  drop table "CREDITPL" cascade constraints;
  
  drop table Role cascade constraints;
  
  drop index is_FK;
  
  drop table "USERDB" cascade constraints;
  
  /*==============================================================*/
  /* Table: CREDIT                                                */
  /*==============================================================*/
  create table CREDIT 
  (
     id_credit            INTEGER              not null,
     user_email           VARCHAR2(20)         not null,
     role_name            VARCHAR2(20)         not null,
     credit_date          DATE                 not null,
     credit_name          VARCHAR2(20)         not null,
     date_of_start        DATE                 not null,
     range                SMALLINT             not null,
     value                SMALLINT             not null,
     status               CHAR(20)             not null,
     constraint PK_CREDIT primary key (id_credit)
  );
  
  /*==============================================================*/
  /* Index: want_to_take_credit_FK                                  */
  /*==============================================================*/
  create index want_to_take_credit_FK on CREDIT (
     user_email ASC,
     role_name ASC
  );
  
  /*==============================================================*/
  /* Index: will_be_choosen_FK                                    */
  /*==============================================================*/
  create index will_be_choosen_FK on CREDIT (
     credit_date ASC,
     credit_name ASC
  );
  
  /*==============================================================*/
  /* Table: "CREDITPL"                                         */
  /*==============================================================*/
  create table "CREDITPL" 
  (
     credit_date          DATE                 not null,
     credit_name          VARCHAR2(20)         not null,
     credit_description   VARCHAR2(100),
     credit_range         SMALLINT             not null,
     credit_value         SMALLINT             not null,
     credit_percent       SMALLINT             not null,
     STATUS               VARCHAR2(20)         not null,
     constraint "PK_CREDIT PLAN" primary key (credit_date, credit_name)
  );
  
  /*==============================================================*/
  /* Table: Role                                                  */
  /*==============================================================*/
  create table Role 
  (
     role_name            VARCHAR2(20)         not null,
     role_desc            VARCHAR2(260)   ,
     constraint PK_ROLE primary key (role_name)
  );
  
  /*==============================================================*/
  /* Table: "USERDB"                                                */
  /*==============================================================*/
  create table "USERDB" 
  (
     user_password        VARCHAR2(20)         not null,
     user_email           VARCHAR2(20)         not null,
     role_name            VARCHAR2(20)         not null,
     user_name            VARCHAR2(50)         not null,
     user_passport        CHAR(10)              not null,
     user_IDcode          CHAR(12)             not null,
     user_phonenumber     CHAR(18)             not null,
	   ISDELETED	         	CHAR(1)	            	not null,
     constraint PK_USERDB primary key (user_email, role_name)
  );
  
  /*==============================================================*/
  /* Index: is_FK                                                 */
  /*==============================================================*/
  create index is_FK on "USERDB" (
     role_name ASC
  );
  
  alter table CREDIT
     add constraint FK_CREDIT_WANT_TO_R_USERDB foreign key (user_email, role_name)
        references "USERDB" (user_email, role_name)
ON DELETE CASCADE;
  
  alter table CREDIT
     add constraint "FK_CREDIT_WILL_BE_C_CREDIT P" foreign key (credit_date, credit_name)
        references "CREDITPL" (credit_date, credit_name)
ON DELETE CASCADE;

  
  alter table "USERDB"
     add constraint FK_USERDB_IS_ROLE foreign key (role_name)
        references Role (role_name)
ON DELETE CASCADE;

  
  
  
  ALTER TABLE "ROLE"
  	ADD CONSTRAINT check_role
  	CHECK (ROLE_NAME IN ('ADMIN', 'USER', 'MANAGER'));
   
  ALTER TABLE "ROLE"
   	ADD CONSTRAINT check_role_description
   	CHECK (REGEXP_LIKE(ROLE_DESC , '[A-z.,0-9 ]{1,200}'));
   
  
   ALTER TABLE "USERDB"
     ADD CONSTRAINT check_email
     CHECK ( REGEXP_LIKE (USER_EMAIL, '[A-Za-z0-9._,!#?]+@[a-zA-Z]+[/.][a-z]{1,4}'));
  
   ALTER TABLE "USERDB"
     ADD CONSTRAINT check_password
     CHECK ( REGEXP_LIKE (user_password, '[A-Za-z 0-9.,!#$%^&*_]{6,20}'));
  
   ALTER TABLE "USERDB"
     ADD CONSTRAINT check_password_len
     CHECK(length(user_password)>6 and length(user_password)<20);
  
  
   ALTER TABLE "USERDB"
     ADD CONSTRAINT check_name 
     CHECK (REGEXP_LIKE(user_name,'[A-ZА-Я][a-zа-я]{1,20} [A-ZА-Я][a-zа-я]{1,20}'));
  
  
   ALTER TABLE "USERDB"
     ADD CONSTRAINT check_number_passport
     CHECK ( REGEXP_LIKE (user_passport, '[А-Я]{2}[0-9]{6}'));
  
  ALTER TABLE "USERDB"
     ADD CONSTRAINT check_idcode
     CHECK ( REGEXP_LIKE(user_IDcode, '[0-9]{12}'));
  
  ALTER TABLE "USERDB"
     ADD CONSTRAINT check_phone_number
     CHECK (REGEXP_LIKE(user_phonenumber,'\+38+\(0[0-9]{2}\)[0-9]{4}[0-9]{3}','c'));
  
  
  ALTER TABLE "USERDB"
     ADD CONSTRAINT check_name_len
     CHECK(length(user_name)>2 and length(user_name)<50);

ALTER TABLE "USERDB"                                         
   ADD CONSTRAINT check_isdeleted
   CHECK (ISDELETED IN ('Y', 'N'));
  
  
  ALTER TABLE "CREDITPL"                                         
     ADD CONSTRAINT check_credit_date
     CHECK(credit_date > DATE '1960-01-01');
  
  ALTER TABLE "CREDITPL"                                         
     ADD CONSTRAINT check_credit_name
     CHECK (REGEXP_LIKE(credit_name,'[A-ZА-Яa-zа-я ]{1,20}')); 
     
  ALTER TABLE "CREDITPL"                                         
     ADD CONSTRAINT check_credit_desc
     CHECK (REGEXP_LIKE(credit_description,'[A-ZА-Яa-zа-я,. ]{1,100}')); 
  
  ALTER TABLE "CREDITPL"                                         
     ADD CONSTRAINT check_credit_range_inp
     CHECK (REGEXP_LIKE(credit_range,'[0-9]{1,2}')); 
  
  ALTER TABLE "CREDITPL"                                         
     ADD CONSTRAINT check_credit_range
     CHECK(credit_range BETWEEN 0 and 36); 
  
  ALTER TABLE "CREDITPL"                                         
     ADD CONSTRAINT check_credit_value_inp
     CHECK (REGEXP_LIKE(credit_value,'[0-9]{1,5}')); 
  
  ALTER TABLE "CREDITPL"                                         
     ADD CONSTRAINT check_credit_value
     CHECK (credit_value BETWEEN 0 and 36000); 
  
  
  ALTER TABLE "CREDITPL"                                         
     ADD CONSTRAINT check_credit_percent_inp
     CHECK (REGEXP_LIKE(credit_percent,'[0-9]{1,3}'));
  
  ALTER TABLE "CREDITPL"                                         
     ADD CONSTRAINT check_credit_percent
     CHECK (credit_percent BETWEEN 0 and 100);
  
  ALTER TABLE "CREDIT"                                         
     ADD CONSTRAINT check_credit_range_input
     CHECK (REGEXP_LIKE(range,'[0-9]{1,2}')); 
  
  ALTER TABLE "CREDIT"                                         
     ADD CONSTRAINT check_credit_value_input
     CHECK (REGEXP_LIKE(value,'[0-9]{1,5}')); 
  
 ALTER TABLE "CREDIT"                                         
   ADD CONSTRAINT check_status
   CHECK (status IN ('ACTIVE', 'DENIED', 'FINISH','WAIT','CANCEL'));
  
  ALTER TABLE "CREDIT"                                         
     ADD CONSTRAINT check_creditrole
     CHECK (ROLE_NAME='USER');
  






CREATE SEQUENCE IDSEQ INCREMENT BY 1 START WITH 15 MAXVALUE 10000000000000000 MINVALUE 1 NOCACHE;

CREATE OR REPLACE TRIGGER ID_TRIGGER 
BEFORE INSERT ON "CREDIT"
FOR EACH ROW
BEGIN
  :NEW."ID_CREDIT" := IDSEQ.NEXTVAL;
END ID_TRIGGER;


CREATE OR REPLACE TRIGGER date_time
BEFORE INSERT ON "CREDIT"
FOR EACH ROW
BEGIN
  :NEW."DATE_OF_START" := TO_DATE(TO_CHAR(SYSDATE,'yyyy/mm/dd hh24:mi:ss'), 'yyyy/mm/dd hh24:mi:ss');
END;


CREATE OR REPLACE VIEW USERCREDIT AS
SELECT ID_CREDIT "Номер заявки", USER_EMAIL "E-mail", CREDIT_NAME "Кредитный план",
DATE_OF_START "Дата начала", "RANGE" "Cрок", "VALUE" "Сумма кредита", STATUS "Статус"
FROM CREDIT
WHERE (STATUS ='ACTIVE' OR STATUS='FINISH');


SELECT ID_CREDIT "Номер заявки", USER_EMAIL "E-mail", CREDIT_NAME "Кредитный план",
DATE_OF_START "Дата заявки", "RANGE" "Срок", "VALUE" "Сумма кредита", STATUS "Статус"
FROM CREDIT
WHERE (STATUS ='WAIT' OR STATUS='DENIED');


CREATE OR REPLACE VIEW CREDITPLANVIEW AS
SELECT CREDIT_NAME "Название",CREDIT_DESCRIPTION "Описание", CREDIT_RANGE "Мax срок",
CREDIT_VALUE "Max сумма", CREDIT_PERCENT "%"
FROM CREDITPL
WHERE (STATUS ='ACTIVE');



CREATE OR REPLACE VIEW MANAGERREQ AS
SELECT ID_CREDIT "Номер заявки",USERDB.USER_NAME, CREDIT_NAME "Кредитный план",
DATE_OF_START "Дата заявки", "RANGE" "Cрок", "VALUE" "Сумма кредита"
FROM CREDIT, USERDB
WHERE (CREDIT.STATUS ='WAIT' AND CREDIT.USER_EMAIL=USERDB.USER_EMAIL);
FROM USERDB
WHERE ISDELETED='N';
  