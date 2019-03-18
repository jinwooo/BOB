DROP SEQUENCE NOTICE_SEQ;
DROP TABLE NOTICE PURGE;

CREATE SEQUENCE NOTICE_SEQ;

CREATE TABLE NOTICE(
	N_NO NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(100) NOT NULL,
	N_TITLE VARCHAR2(1000) NOT NULL,
	N_CONTENT VARCHAR2(4000) NOT NULL,
	N_DATE DATE NOT NULL,
	N_VIEW NUMBER NOT NULL
);

INSERT INTO NOTICE
VALUES(NOTICE_SEQ.NEXTVAL,'TEST','TEST','TEST123',SYSDATE,1);

SELECT * FROM NOTICE;