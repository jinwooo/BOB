--댓글 
DROP SEQUENCE myReply_seq;
DROP TABLE myReply PURGE;

--게시글
DROP SEQUENCE myBoard_seq;
DROP TABLE myBoard PURGE;

CREATE TABLE myBoard (
	bno NUMBER NOT NULL,
	title VARCHAR2(30) NOT NULL,
	content VARCHAR2(2000) NOT NULL,
	writer VARCHAR2(30) NOT NULL,
	regDate DATE default SYSDATE,
	viewCnt number default 0,
	primary key(bno)
);
CREATE SEQUENCE myBoard_seq;




CREATE TABLE myReply(
	bno number not null,
	rno number not null,
	content varchar2(2000) not null,
	writer varchar2(30) not null,
	regDate DATE default SYSDATE,
	primary key(bno,rno)
);

alter table myReply
	add constraint myReply_bno foreign key(bno)
	references myBoard(bno) on delete cascade;
	
CREATE SEQUENCE myReply_seq; 

------------------------------------------------
--게시글 ex
insert into myBoard(bno,title,content,writer)
	select myBoard_seq.nextval, title, content, writer from myBoard; 

--예시 댓글
insert into myReply(bno, rno, content, writer)
	values(3109,myReply_seq.nextval,'더미댓글','더미작성자');


