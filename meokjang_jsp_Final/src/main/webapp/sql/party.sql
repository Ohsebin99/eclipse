  CREATE TABLE "TJOEUNIT"."PARTY" 
   (	"IDX" NUMBER(*,0) NOT NULL ENABLE, 
	"ID" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"NICKNAME" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"CATEGORY" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"LOCATION" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"SUBJECT" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(3000 BYTE) NOT NULL ENABLE, 
	"PLACE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"PARTYGENDER" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"MEALDATE" TIMESTAMP (6) NOT NULL ENABLE, 
	"WRITEDATE" TIMESTAMP (6) DEFAULT sysdate, 
	"PHOTO" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"ACHOLCHK" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"IP" CHAR(15 BYTE), 
	"MINLIMITAGE" NUMBER(*,0) DEFAULT 19 NOT NULL ENABLE, 
	"MAXLIMITAGE" NUMBER(*,0) DEFAULT 100 NOT NULL ENABLE, 
	"LIMITNUM" NUMBER(*,0) DEFAULT 2 NOT NULL ENABLE, 
	"SHOW" VARCHAR2(10 BYTE) DEFAULT 'YES' NOT NULL ENABLE, 
	"REPORTCHECK" VARCHAR2(10 BYTE) DEFAULT 'NO' NOT NULL ENABLE, 
	"DELETEREPORT" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE, 
	 CONSTRAINT "PARTY_PK" PRIMARY KEY ("IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;


delete from party;
drop sequence party_idx_seq;
create sequence party_idx_seq;


select count(*) from party;
select * from party order by idx desc;
commit;

