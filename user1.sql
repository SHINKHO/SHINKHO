/*
--테이블 스페이스 생성
*/
/*
--테이블스페이스 생성
*/        
CREATE TABLESPACE myts
    datafile '/u01/app/oracle/oradata/XE/myts.dbf'
    size 100M autoextend on next 5M;
        
/*
유저 생성
*/
CREATE USER java identified by oracle default TABLESPACE myths temporary tablespace temp;

/*
--롤 생성
*/
GRANT connect to java; --겁근
GRANT resource to java; -- 일반적인 롤
-- grant connect,resource,create view to java

-- 덤프파일의 정보를 java 계정에 임포트 
/*
-- cd Downloads
-- imp system/oracle file=expjava2.dmp fromuser=java touser=java
-- exp system/oracle file='expjava3.dmp 
*/

/* table 테이블
    1.테이블명 컬럼명으로 예약어는 사용할 수 없다. (select, from...)
    2.테이블명 컬럼명으로 최대 크기는 30byte
    3.테이블명 컬럼명으로  문자, 숫자, _, $, # 사용할 수 있지만 첫 글자는 문자만
    4. 한 테이블에 사용 가능한 컬럼수는 255개
*/
CREATE TABLE ex1_1(
    col1 CHAR(10) --고정형 크기
    ,col2 VARCHAR(10) --가변형 크기
    ,col3 DATE
);
--테이블 삭제
--DROP TABLE ex1_1;
--데이터 삽입
INSERT INTO ex1_1(col1,col2,col3) VALUES('a','a',SYSDATE);
--데이터 조회
SELECT col1,lengthb(col1), col2, lengthb(col2), col3
FROM ex1_1;