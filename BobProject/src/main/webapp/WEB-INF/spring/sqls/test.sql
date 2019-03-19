DROP TABLE COMPANY;
DROP SEQUENCE CNOSEQ;

CREATE SEQUENCE CNOSEQ;
CREATE TABLE COMPANY(
	CNO NUMBER PRIMARY KEY,
	CNAME VARCHAR2(100) NOT NULL,
	CADDR VARCHAR2(500) NOT NULL,
	CYN VARCHAR2(10) NOT NULL,
	CONSTRAINT COMPANY_CYN_CHK CHECK(CYN IN('Y','N'))
);


DROP TABLE USERBOARD;

CREATE TABLE USERBOARD(
	USER_ID VARCHAR2(100) PRIMARY KEY,
	USER_PW VARCHAR2(100) NOT NULL,
	USER_NAME VARCHAR2(100) NOT NULL,
	USER_EMAIL VARCHAR2(150) NOT NULL,
	USER_ADDR VARCHAR2(1000) NOT NULL,
	USER_PHONE VARCHAR2(200) NOT NULL,
	USER_GENDER VARCHAR2(20) NOT NULL,
	USER_BIRTH DATE NOT NULL,
	USER_GRADE VARCHAR2(20) NOT NULL,
	USER_SNS VARCHAR2(100) NOT NULL,
	USER_CONFIRM VARCHAR2(200) NOT NULL,
	USER_IMG VARCHAR2(1000) NULL,
	CNO NUMBER NOT NULL,
	
	CONSTRAINT USERBOARD_USER_GENDER_CHK CHECK(USER_GENDER IN('M','F')),
	CONSTRAINT USERBOARD_USER_CONFIRM_CHK CHECK(USER_CONFIRM IN('Y','N'))
);
ALTER TABLE USERBOARD ADD FOREIGN KEY (CNO) REFERENCES COMPANY(CNO);


DROP SEQUENCE BOBIDSEQ;
DROP TABLE BOB;

CREATE SEQUENCE BOBIDSEQ;
CREATE TABLE BOB(
	BOB_ID NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(100) NOT NULL,
	BOB_DATE DATE NOT NULL,
	BOB_TYPE VARCHAR2(100) NOT NULL,
	BOB_MENU VARCHAR2(400) NOT NULL,
	BOB_KAL VARCHAR2(200) NOT NULL,
	BOB_IMG VARCHAR2(1000) NOT NULL
);
ALTER TABLE BOB ADD FOREIGN KEY (USER_ID) REFERENCES USERBOARD(USER_ID);


DROP SEQUENCE BMIDSEQ;
DROP TABLE BOBMANAGER;

CREATE SEQUENCE BMIDSEQ;
CREATE TABLE BOBMANAGER(
	BM_ID NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(100) NOT NULL,
	BM_DATE DATE NOT NULL,
	BM_TYPE VARCHAR2(100) NOT NULL,
	BM_MENU VARCHAR2(400) NOT NULL,
	BM_KAL VARCHAR2(200) NOT NULL,
	BM_IMG VARCHAR2(1000) NOT NULL
);
ALTER TABLE BOBMANAGER ADD FOREIGN KEY (USER_ID) REFERENCES USERBOARD(USER_ID);


DROP SEQUENCE SNOSEQ;
DROP TABLE SUGGEST;

CREATE SEQUENCE SNOSEQ;
CREATE TABLE SUGGEST(
	S_NO NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(100) NOT NULL,
	S_TITLE VARCHAR2(1000) NOT NULL,
	S_CONTENT VARCHAR2(4000) NOT NULL,
	S_DATE DATE NOT NULL,
	S_VIEW NUMBER NOT NULL,
	S_DELFLAG VARCHAR2(4) NOT NULL,
	CONSTRAINT SUGGEST_S_DELFLAG_CHK CHECK(S_DELFLAG IN('Y','N'))
);
ALTER TABLE SUGGEST ADD FOREIGN KEY (USER_ID) REFERENCES USERBOARD(USER_ID);


DROP SEQUENCE SCNOSEQ;
DROP SEQUENCE SCGNOSEQ;
DROP TABLE SCOMMENT;

CREATE SEQUENCE SCNOSEQ;
CREATE SEQUENCE SCGNOSEQ;
CREATE TABLE SCOMMENT(
	SC_NO NUMBER PRIMARY KEY,
	S_NO NUMBER NOT NULL,
	USER_ID VARCHAR2(100) NOT NULL,
	SC_GNO NUMBER NOT NULL,
	SC_GSQ NUMBER NOT NULL,
	SC_TAP NUMBER NOT NULL,
	SC_CONTENT VARCHAR2(4000) NOT NULL,
	SC_DATE DATE NOT NULL,
	SC_DELFLAG VARCHAR2(4) NOT NULL,
	CONSTRAINT SCOMMENT_SC_DELFLAG_CHK CHECK(SC_DELFLAG IN('Y','N'))
);
ALTER TABLE SCOMMENT ADD FOREIGN KEY (S_NO) REFERENCES SUGGEST(S_NO);

DROP SEQUENCE NNOSEQ;
DROP TABLE NOTICE;

CREATE SEQUENCE NNOSEQ;
CREATE TABLE NOTICE(
	N_NO NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(100) NOT NULL,
	N_TITLE VARCHAR2(1000) NOT NULL,
	N_CONTENT VARCHAR2(4000) NOT NULL,
	N_DATE DATE NOT NULL,
	N_VIEW NUMBER NOT NULL
);
ALTER TABLE NOTICE ADD FOREIGN KEY (USER_ID) REFERENCES USERBOARD(USER_ID);


DROP SEQUENCE VNOSEQ;
DROP TABLE VOTE;

CREATE SEQUENCE VNOSEQ;
CREATE TABLE VOTE(
	V_NO NUMBER PRIMARY KEY,
	V_MENU VARCHAR2(400) NOT NULL,
	V_CNT NUMBER NOT NULL,
	V_IMG VARCHAR2(1000) NOT NULL
);

DROP SEQUENCE ROOMSEQ;
DROP TABLE CHATROOM;

CREATE SEQUENCE ROOMSEQ;
CREATE TABLE CHATROOM(
	CH_ROOMNO NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(100) NOT NULL,
	CH_USERCNT NUMBER NOT NULL
);
ALTER TABLE CHATROOM ADD FOREIGN KEY (USER_ID) REFERENCES USERBOARD(USER_ID);


DROP SEQUENCE CHUSERSEQ;
DROP TABLE CHATUSER;

CREATE SEQUENCE CHUSERSEQ;
CREATE TABLE CHATUSER(
	CR_NO NUMBER PRIMARY KEY,
	CH_ROOMNO NUMBER NOT NULL,
	USER_ID NOT NULL
);
ALTER TABLE CHATUSER ADD FOREIGN KEY (CH_ROOMNO) REFERENCES CHATROOM(CH_ROOMNO);
ALTER TABLE CHATUSER ADD FOREIGN KEY (USER_ID) REFERENCES USERBOARD(USER_ID);



DROP SEQUENCE CHNOSEQ;
DROP TABLE CHAT;

CREATE SEQUENCE CHNOSEQ;
CREATE TABLE CHAT(
	CH_NO NUMBER PRIMARY KEY,
	CR_NO NUMBER NOT NULL,
	CH_ROOMNO NUMBER NOT NULL,
	CH_USERNO NUMBER NOT NULL,	
	USER_ID VARCHAR2(100) NOT NULL,
	CH_MSG VARCHAR2(1500) NOT NULL,
	CH_TIME DATE NOT NULL
);
ALTER TABLE CHAT ADD FOREIGN KEY (CH_USERNO) REFERENCES CHATUSER(CH_ROOMNO);
ALTER TABLE CHAT ADD FOREIGN KEY (CR_NO) REFERENCES CHATUSER(CR_NO);






